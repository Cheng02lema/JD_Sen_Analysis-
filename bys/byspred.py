import jieba
import numpy as np

# 加载模型和词典数据
def load_bysmodel(filepath):
    data = np.load(filepath)
    return  data['dictionary'],data['good_vec_trained'], data['bad_vec_trained'], data['good_pro']



# 文本预处理和向量化
def text_to_vector(text, dictionary, stop_words):
    words = jieba.lcut(text)
    word_vec = np.zeros(len(dictionary))
    for word in words:
        if word not in stop_words and word in dictionary:
            index = np.where(np.array(dictionary) == word)[0]
            word_vec[index] += 1
    return word_vec

# 判断是否是好评
def predict_good_review(text, dictionary, good_vec, bad_vec, good_pro, stop_words):
    text_vec = text_to_vector(text, dictionary, stop_words)
    good_log_prob = np.sum(text_vec * good_vec) + np.log(good_pro)
    bad_log_prob = np.sum(text_vec * bad_vec) + np.log(1 - good_pro)
    return "好评" if good_log_prob > bad_log_prob else "差评"

# 示例用法
dictionary,good_vec, bad_vec, good_pro = load_bysmodel('./model/bayes_newmodel.npz')

with open('./dataset/stopwords.txt', 'r', encoding='UTF-8') as fp:
    stop_words = fp.read().split('\n')
# 输入句子
input_text = ""

# 预测结果
result = predict_good_review(input_text, dictionary, good_vec, bad_vec, good_pro, stop_words)
print(result)
