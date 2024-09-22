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
import random

# ****************************************************************加载评论数据集******************************************************
dataset = None

# 打开文件，并将所有评论信息读取至数据集
with open('./data/merged_file.csv', 'r', encoding='UTF-8') as fp:
    reader = csv.reader(fp)
    dataset = np.array([comment for comment in reader])

# ****************************************************************分词******************************************************
dictionary = []  # 定义词典
stop_words = []  # 定义停用词表
clear_dataset = []  # 定义清洗后的数据集

# 读取停用词表，并以列表的方式存入stop_words中
with open('./dataset/stopwords.txt', 'r', encoding='UTF-8') as fp:
    stop_words = fp.read().split('\n')

# 加载自定义词典
jieba.load_userdict('./dataset/custom_dict.txt')

for comment in dataset:
    words = []  # 存放切词后、去除停用词后的句子词组

    # 使用jieba对评论进行分词
    for word in jieba.lcut(comment[0]):

        # 若切出来的词语 不属于停用词表， 加入词组中
        if word not in stop_words:
            words.append(word)

        # 向词典中加入所有未加入的词语
        if word not in dictionary:
            dictionary.append(word)

    # 追加句子词组和对应的标志
    clear_dataset.append([words, comment[1]])

# 去除低频词和高频词
from collections import Counter
word_counts = Counter([word for comment in clear_dataset for word in comment[0]])
dictionary = [word for word in dictionary if 5 < word_counts[word] < 1000]

# 输出词典的长度
print(len(dictionary))

# ***************************************************************向量化******************************************************
# 使用TF-IDF向量化
vectorizer = TfidfVectorizer(vocabulary=dictionary)
X = vectorizer.fit_transform([' '.join(comment[0]) for comment in clear_dataset])
y = np.array([comment[1] for comment in clear_dataset])

# ***************************************************************拆分数据集*****************************************************
# X_train，y_train为训练集数据
# X_test,y_test为测试集数据
X_train, X_test, y_train, y_test = train_test_split(X, y)

# 分别输出训练集的 X, y形状， 测试集的X, y的形状
print(X_train.shape)
print(y_train.shape)
print(X_test.shape)
print(y_test.shape)

# ***************************************************************训练模型*****************************************************
# 使用多项式朴素贝叶斯
nb_model = MultinomialNB()

# 使用逻辑回归和支持向量机结合
lr_model = LogisticRegression()
svc_model = SVC(probability=True)

# 结合多分类器进行训练
ensemble_model = VotingClassifier(estimators=[('lr', lr_model), ('svc', svc_model), ('nb', nb_model)], voting='soft')
ensemble_model.fit(X_train, y_train)

# 交叉验证
scores = cross_val_score(ensemble_model, X, y, cv=5)
print("Cross-validation scores: ", scores)
print("Mean cross-validation score: ", scores.mean())

# 参数优化
param_grid = {'svc__C': [0.1, 1, 10], 'svc__kernel': ['linear', 'rbf']}
grid_search = GridSearchCV(ensemble_model, param_grid, cv=5)
grid_search.fit(X_train, y_train)
print("Best parameters: ", grid_search.best_params_)

# ***************************************************************判断模型*****************************************************
success_count = 0
for i in range(len(X_test)):
    if i >= 10000:
        break

    X_data = X_test[i]
    y_data = y_test[i]

    good_pro_pre = np.sum(X_data * ensemble_model.predict_proba(X_data)[0]) + np.log(ensemble_model.classes_[0])
    bad_pro_pre = np.sum(X_data * ensemble_model.predict_proba(X_data)[1]) + np.log(1 - ensemble_model.classes_[0])

    if good_pro_pre > bad_pro_pre:
        result = '3'  # 输出好评
    else:
        result = '1'  # 否则输出差评

    if (y_data == result):  # 若预测答案与真实答案相等，预测正确数量增加
        success_count += 1

print('朴素贝叶斯模型(bayes)预测的准确度: {}'.format(success_count / 10000))

# ***************************************************************测试模型*****************************************************
start = random.randint(50, 2450)
X_data = X_test[start:start + 50]
y_data = y_test[start:start + 50]

success_test = 0

# 对 50条评论信息进行预测
for sequence_index in range(len(X_data)):
    locs = np.where(X_data[sequence_index] == 1)

    for loc in locs[0]:
        print(dictionary[loc], end='/')
    print('\n')

    good_pro_pre = np.sum(X_data[sequence_index] * ensemble_model.predict_proba(X_data[sequence_index])[0]) + np.log(
        ensemble_model.classes_[0])
    bad_pro_pre = np.sum(X_data[sequence_index] * ensemble_model.predict_proba(X_data[sequence_index])[1]) + np.log(
        1 - ensemble_model.classes_[0])

    if good_pro_pre > bad_pro_pre:
        result = '3'  # 输出好评
        print('Predict result : 好评', end='\t')
    else:
        result = '1'  # 否则输出差评
        print('Predict result : 差评', end='\t')

    if y_data[sequence_index] == '3':
        print('Actual results: 好评', end='\t')
    else:
        print('Actual results: 差评', end='\t')

    if result == y_data[sequence_index]:
        print('Predict success!', end='\t')
        success_test += 1
    else:
        print('Predict fail!', end='\t')

    print('\n\n')

print('本次测试预测准确度为: {}'.format(success_test / 50))

# ***************************************************************保存模型*****************************************************
# 保存模型
np.savez('./model/bayes_gaimodel.npz', dictionary=dictionary, good_pro=ensemble_model.classes_[0],
         good_vec_trained=ensemble_model.predict_proba(X_train)[0],
         bad_vec_trained=ensemble_model.predict_proba(X_train)[1])
