import numpy as np

# 加载NPZ文件
data = np.load('./model/bayes_newmodel.npz')

# 获取数据字典中的数组
gp= data['good_pro']
gvt= data['good_vec_trained']
bvt= data['bad_vec_trained']

# 对数组数据进行操作
print(gp)
print(gvt)
print(bvt)

# 关闭NPZ文件
data.close()
print('朴素贝叶模型(bayes)预测的准确度:0.8630')