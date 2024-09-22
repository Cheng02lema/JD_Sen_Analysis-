import numpy as np
import csv
# 用来存放评论的数据集
dataset = None

# 打开文件，并将所有评论信息读取至数据集
with open('./data/merged_file.csv', 'r', encoding='UTF-8') as fp:
    reader = csv.reader(fp)

    dataset = np.array([comment for comment in reader])

# 输出数据集的形状
print(dataset.shape)
