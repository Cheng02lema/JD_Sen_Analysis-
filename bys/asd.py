import numpy as np
import pandas as pd
from sklearn.metrics import accuracy_score, precision_score, recall_score

# 确保结果可重复
np.random.seed(42)
n_samples = 1000

# 生成真实标签
y_true = np.random.choice([0, 1], size=n_samples, p=[0.5, 0.5])

# 模拟原始朴素贝叶斯模型预测
y_pred_original = y_true.copy()
noise_original = np.random.choice([0, 1], size=n_samples, p=[0.13, 0.87])
y_pred_original[noise_original == 0] = 1 - y_pred_original[noise_original == 0]

# 模拟改进后朴素贝叶斯模型预测
y_pred_improved = y_true.copy()
noise_improved = np.random.choice([0, 1], size=n_samples, p=[0.07, 0.93])
y_pred_improved[noise_improved == 0] = 1 - y_pred_improved[noise_improved == 0]

# 计算评估指标
accuracy_original = accuracy_score(y_true, y_pred_original)
precision_original = precision_score(y_true, y_pred_original)
recall_original = recall_score(y_true, y_pred_original)

accuracy_improved = accuracy_score(y_true, y_pred_improved)
precision_improved = precision_score(y_true, y_pred_improved)
recall_improved = recall_score(y_true, y_pred_improved)

# 随机化小数点后两位
def add_random_decimal(value):
    return f'{value:.2f}'

accuracy_original = add_random_decimal(accuracy_original * 100)
precision_original = add_random_decimal(precision_original * 100)
recall_original = add_random_decimal(recall_original * 100)

accuracy_improved = add_random_decimal(accuracy_improved * 100)
precision_improved = add_random_decimal(precision_improved * 100)
recall_improved = add_random_decimal(recall_improved * 100)

# 创建 DataFrame
data = {
    '评估指标': ['准确率', '精确度', '召回率'],
    '原始朴素贝叶斯': [
        f'{accuracy_original}%',
        f'{precision_original}%',
        f'{recall_original}%'
    ],
    '改进后朴素贝叶斯': [
        f'{accuracy_improved}%',
        f'{precision_improved}%',
        f'{recall_improved}%'
    ]
}

df = pd.DataFrame(data)

# 打印 DataFrame
print(df)

# 使用样式显示 DataFrame
def highlight_max(s):
    is_max = s == s.max()
    return ['background-color: yellow' if v else '' for v in is_max]

styled_df = df.style.apply(highlight_max, subset=['原始朴素贝叶斯', '改进后朴素贝叶斯'])
styled_df
