import jieba
import csv
import numpy as np
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.model_selection import train_test_split, cross_val_score
from sklearn.naive_bayes import MultinomialNB
from sklearn.ensemble import VotingClassifier
from sklearn.linear_model import LogisticRegression
from sklearn.svm import SVC
from sklearn.model_selection import GridSearchCV
from collections import Counter
import random

# Load comment dataset
dataset = []
with open('./data/merged_file.csv', 'r', encoding='UTF-8') as fp:
    reader = csv.reader(fp)
    dataset = np.array(list(reader))

# Load stopwords
with open('./dataset/stopwords.txt', 'r', encoding='UTF-8') as fp:
    stop_words = set(fp.read().splitlines())

# Load custom dictionary for better segmentation
jieba.load_userdict('./dataset/custom_dict.txt')

# Tokenization and stopword removal
dictionary = set()
clear_dataset = []
for comment in dataset:
    words = [word for word in jieba.lcut(comment[0]) if word not in stop_words]
    dictionary.update(words)
    clear_dataset.append([words, comment[1]])

# Remove high-frequency and low-frequency words
word_counts = Counter(word for comment in clear_dataset for word in comment[0])
dictionary = {word for word in dictionary if 5 < word_counts[word] < 1000}
print(f"Dictionary length: {len(dictionary)}")

# Vectorization using TF-IDF
vectorizer = TfidfVectorizer(vocabulary=dictionary, lowercase=False)
X = vectorizer.fit_transform([' '.join(comment[0]) for comment in clear_dataset])
y = np.array([comment[1] for comment in clear_dataset])

# Split dataset into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y)
print(X_train.shape, y_train.shape, X_test.shape, y_test.shape)

# Model training with Voting Classifier
ensemble_model = VotingClassifier(
    estimators=[
        ('lr', LogisticRegression(max_iter=200, solver='lbfgs')),
        ('svc', SVC(probability=True)),
        ('nb', MultinomialNB())
    ], voting='soft')
ensemble_model.fit(X_train, y_train)

# Cross-validation
scores = cross_val_score(ensemble_model, X, y, cv=5)
print(f"Cross-validation scores: {scores}")
print(f"Mean cross-validation score: {scores.mean()}")

# Parameter tuning with GridSearchCV
param_grid = {'svc__C': [0.1, 1, 10], 'svc__kernel': ['linear', 'rbf']}
grid_search = GridSearchCV(ensemble_model, param_grid, cv=5)
grid_search.fit(X_train, y_train)
print(f"Best parameters: {grid_search.best_params_}")

# Model evaluation
predictions = ensemble_model.predict(X_test)
success_count = np.sum(predictions == y_test)
accuracy = success_count / len(y_test)
print(f'Ensemble model accuracy: {accuracy}')

# Save the model
np.savez('./model/bayes_gaimodel.npz', dictionary=list(dictionary),
         good_pro=ensemble_model.classes_[0],
         good_vec_trained=ensemble_model.predict_proba(X_train)[0],
         bad_vec_trained=ensemble_model.predict_proba(X_train)[1])
