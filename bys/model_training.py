import jieba
import csv
import numpy as np
from sklearn.model_selection import train_test_split
import random
# ****************************************************************加载评论数据集******************************************************
dataset = None

# 打开文件，并将所有评论信息读取至数据集
with open('./data/test.csv', 'r', encoding='UTF-8') as fp:
    reader = csv.reader(fp)
    dataset = np.array([comment for comment in reader])


# ****************************************************************分词******************************************************
dictionary = []  # 定义词典
stop_words = []  # 定义停用词表
clear_dataset = []  # 定义清洗后的数据集

# 读取停用词表，并以列表的方式存入stop_words中
with open('./dataset/stopwords.txt', 'r', encoding='UTF-8') as fp:
    stop_words = fp.read().split('\n')

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

# 输出词典的长度
print(len(dictionary))


# ***************************************************************向量化******************************************************


X = []  # 存放word2vec后的评论向量
y = [y[1] for y in clear_dataset]  # 存放每条评论的结果

# 遍历所有清洗后的评论数据，并将所有评论文本信息转化为向量信息
for clear_data in clear_dataset:

    # 评论信息列表赋值为sentence
    sentence = clear_data[0]

    # 首先将每个评论分词列表设置为 (1,5023)的向量，每个向量值为1
    # 一个句子转化为一个向量
    word_2_vec = np.zeros(len(dictionary))

    # 遍历字典，将所有评论分词列表 转化为 向量列表 (超重要!!!)
    for word in sentence:

        # 如果word存在于字典中
        if word in dictionary:
            # 找到该词在字典中的位置
            loc = dictionary.index(word)

            # 此句子对照向量的该位置加1
            word_2_vec[loc] += 1

            # X，即输入句子的特征向量列表，追加新句子向量
    X.append(word_2_vec)


# ***************************************************************拆分数据集*****************************************************


X = np.array(X)               #转化为numpy数组，X作为输入项，即评论生成的向量
y = np.array(y)               #转化为numpy数组，X作为输出项，即评论的类别

#X_train，y_train为训练集数据
#X_test,y_test为测试集数据
X_train, X_test, y_train, y_test = train_test_split(X, y)            #使用sklearn库的随即切分函数，将X、y划分为训练集与测试集


#分别输出训练集的 X, y形状， 测试集的X, y的形状
print(X_train.shape)
print(y_train.shape)
print(X_test.shape)
print(y_test.shape)



# ***************************************************************训练模型*****************************************************
len_dic = len(dictionary)  # 词典的长度，即所有词的长度

good_pro = np.sum(y_train == '3') / len(X_train)  # 好评率

good_num = 0  # 好评的次数
bad_num = 0  # 差评的次数

# 初始化之所以为 1，是防止P(特征i|类别)中某个为0，导致连乘积为0
good_vec = np.ones(len_dic)  # 向量组，每个值(词语)代表好评的次数,初始化全为1
bad_vec = np.ones(len_dic)  # 向量组，每个值(词语)代表差评的次数，初始化全为1

for i in range(len(X_train)):

    # 代表的是好评
    if y_train[i] == '3':
        good_vec += X_train[i]  # 把该评论词语代表的向量,累加到good_vec
        good_num += 1  # 好评次数增加

    # 否则是差评
    else:
        bad_vec += X_train[i]  # 把该评论词语代表的向量,累加到bad_vec
        bad_num += 1  # 差评次数增加

# 取log的原因有二：1、拉普拉斯平滑，防止太小的结果乘积造成下溢。2、log(连乘积)可以转化为 log累加
good_vec_trained = np.log(good_vec / good_num)  # 用于存放所有的 P(特征i|好评)向量，每个值代表一个概率
bad_vec_trained = np.log(bad_vec / bad_num)  # 用于存放所有的 P(特征i|差评)向量，每个值代表一个概率

print('good_pro is: {}'.format(good_pro))
print('good_vec_trained is: {}'.format(good_vec_trained))
print('bad_vec_trained is: {}'.format(bad_vec_trained))


# ***************************************************************判断模型*****************************************************
success_count = 0

for i in range(100):

    # 代入朴素贝叶斯公式

    # 评论好评的概率
    good_pro_pre = np.sum(X_test[i] * good_vec_trained) + np.log(good_pro)

    # 评论差评的概率
    bad_pro_pre = np.sum(X_test[i] * bad_vec_trained) + np.log(1 - good_pro)

    # 若好评概率大于差评概率
    if good_pro_pre > bad_pro_pre:
        result = '3'  # 输出好评

    else:
        result = '1'  # 否则输出差评

    if (y_test[i] == result):  # 若预测答案与真实答案相等，预测正确数量增加
        success_count += 1

print('朴素贝叶斯模型(bayes)预测的准确度: {}'.format(success_count / 10000))


# ***************************************************************测试模型*****************************************************
import random

dic_len = len(dictionary)

start = random.randint(50, 2450)

# 从测试集中随机抽取50条数据，准备测试
X_data = X_test[start:start + 50]
y_data = y_test[start:start + 50]

success_test = 0

# 对 50条评论信息进行预测
for sequence_index in range(len(X_data)):

    # 找到该 评论语句 切分后的词组对应的位置，返回一个数组
    locs = np.where(X_data[sequence_index] == 1)

    # 输出切分、分词后的评论内容
    for loc in locs[0]:
        print(dictionary[loc], end='/')

    print('\n')

    # 代入朴素贝叶斯公式
    good_pro_pre = np.sum(X_data[sequence_index] * good_vec_trained) + np.log(good_pro)  # 评论好评的概率
    bad_pro_pre = np.sum(X_data[sequence_index] * bad_vec_trained) + np.log(1 - good_pro)  # 评论差评的概率

    # 0 代表好评， 1代表差评
    # 若好评概率大于差评概率
    if good_pro_pre > bad_pro_pre:
        result = '3'  # 输出好评
        print('Predict result : 好评', end='\t')
    else:
        result = '1'  # 否则输出差评
        print('Predict result : 差评', end='\t')

    # 实际该评论的结果
    if y_data[sequence_index] == '3':
        print('Actual results: 好评', end='\t')
    else:
        print('Actual results: 差评', end='\t')

    # 判断是否预测正确
    if result == y_data[sequence_index]:
        print('Predict success!', end='\t')
        success_test += 1
    else:
        print('Predict fail!', end='\t')

    print('\n\n')

print('本次测试预测准确度为: {}'.format(success_test / 50))

# ***************************************************************保存模型*****************************************************
# 保存模型
np.savez('./model/bayes_model.npz', dictionary=dictionary,good_pro=good_pro, good_vec_trained=good_vec_trained, bad_vec_trained=bad_vec_trained)
from sklearn import metrics



#***************************************************************判断模型并计算评估指标*****************************************************
y_pred = []
for i in range(len(X_test)):
    # 代入朴素贝叶斯公式
    # 评论好评的概率
    good_pro_pre = np.sum(X_test[i] * good_vec_trained) + np.log(good_pro)
    # 评论差评的概率
    bad_pro_pre = np.sum(X_test[i] * bad_vec_trained) + np.log(1 - good_pro)

    # 若好评概率大于差评概率
    if good_pro_pre > bad_pro_pre:
        y_pred.append('3')  # 输出好评
    else:
        y_pred.append('1')  # 否则输出差评

# 计算并输出模型的准确度、精确度、召回率和F1分数
accuracy = metrics.accuracy_score(y_test, y_pred)
precision = metrics.precision_score(y_test, y_pred, pos_label='3')
recall = metrics.recall_score(y_test, y_pred, pos_label='3')
f1 = metrics.f1_score(y_test, y_pred, pos_label='3')

print(f'Accuracy: {accuracy * 100:.2f}%')
print(f'Precision: {precision * 100:.2f}%')
print(f'Recall: {recall * 100:.2f}%')
print(f'F1 Score: {f1:.2f}')

# *****************************************************************模型测试结束********************************************************
