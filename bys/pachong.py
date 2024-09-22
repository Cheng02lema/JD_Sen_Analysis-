import requests
import json

# 获取评论请求地址
url = 'https://club.jd.com/comment/productPageComments.action'

# 请求参数
params = {
    'callback': 'fetchJSON_comment98',
    'productId': '100021771660',
    'score': '1',  # 类型代表差评
    'sortType': '5',  # 默认排序
    'page': '99',  # 第99页数据
    'pageSize': '10',
    'isShadowSku': '0',
    'fold': '1',
}

# 请求头参数，反反爬策略 UA 伪装
headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36'
}

# 获取响应，并分析响应内容
response = requests.get(url=url, params=params, headers=headers)

# 拆分京东返回的响应数据，得到json类型数据
data_json = response.text.replace('fetchJSON_comment98(', '')[:-2]

# 将json字符串加载为 python的对象中
data = json.loads(data_json)

bad_comments = []

for comment in data['comments']:
    # 生成每条评论以及它的标签, 0代表好评, 1代表差评
    comments = [comment['content'].replace('\n', ''), '0']

    bad_comments.append(comments)

print(bad_comments)


