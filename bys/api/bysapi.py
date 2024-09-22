from fastapi import FastAPI, File, UploadFile
from pydantic import BaseModel
from starlette.middleware.cors import CORSMiddleware
from starlette.responses import JSONResponse
import jieba
import numpy as np
import uvicorn
from typing import List, Dict, Any
import os
from collections import Counter
import json

app = FastAPI()

# 允许所有来源的CORS请求，以便前端可以访问后端API
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

class WordCloudResponse(BaseModel):
    words: List[Dict[str, Any]]
    barChart: Dict[str, Any]
    pieChart: Dict[str, Any]

def load_bysmodel(filepath: str):
    """加载模型和词典数据"""
    try:
        data = np.load(filepath)
        return data['dictionary'], data['good_vec_trained'], data['bad_vec_trained'], data['good_pro']
    except Exception as e:
        raise RuntimeError(f"Error loading model: {e}")

def text_to_vector(text: str, dictionary: np.ndarray, stop_words: List[str]):
    """文本预处理和向量化"""
    words = jieba.lcut(text)
    words = [word for word in words if word.strip() != '' and word not in stop_words]  # 过滤空白词和停用词
    word_vec = np.zeros(len(dictionary))
    for word in words:
        if word in dictionary:
            index = np.where(np.array(dictionary) == word)[0]
            if index.size > 0:
                word_vec[index[0]] += 1
    return words, word_vec


def predict_good_review(text: str, dictionary: np.ndarray, good_vec: np.ndarray, bad_vec: np.ndarray, good_pro: float, stop_words: List[str]):
    """判断是否是好评"""
    words, text_vec = text_to_vector(text, dictionary, stop_words)
    good_log_prob = np.sum(text_vec * good_vec) + np.log(good_pro)
    bad_log_prob = np.sum(text_vec * bad_vec) + np.log(1 - good_pro)
    good_review_probability = 1 / (1 + np.exp(bad_log_prob - good_log_prob))
    result = "好评" if good_review_probability > 0.5 else "差评"
    confidence = abs(good_review_probability - 0.5) * 2  # 置信度计算
    return {
        "text": text,
        "result": result,
        "good_review_probability": good_review_probability,
        "confidence": confidence,
        "words": words
    }

# 载入模型数据和停用词
try:
    model_path = os.getenv('MODEL_PATH', '../model/bayes_newmodel.npz')
    stopwords_path = os.getenv('STOPWORDS_PATH', '../dataset/stopwords.txt')
    dictionary, good_vec, bad_vec, good_pro = load_bysmodel(model_path)
    with open(stopwords_path, 'r', encoding='UTF-8') as fp:
        stop_words = fp.read().split('\n')
except Exception as e:
    print(f"Error loading model or stopwords: {e}")
    raise

class Item(BaseModel):
    input: str

@app.post('/byspredict')
def handle_calculate(item: Item):
    """单文本预测API"""
    try:
        result = predict_good_review(item.input, dictionary, good_vec, bad_vec, good_pro, stop_words)
        return {
            "result": {
                "result": result["result"],
                "good_review_probability": result["good_review_probability"],
                "confidence": result["confidence"]
            }
        }
    except Exception as e:
        return JSONResponse(status_code=500, content={"message": str(e)})

@app.post('/batchpredict/')
async def handle_batch_predict(file: UploadFile = File(...)):
    """批量文本预测API"""
    if file.content_type != 'text/plain':
        return JSONResponse(status_code=400, content={"message": "Only plain text files are accepted."})
    contents = await file.read()
    try:
        texts = contents.decode('utf-8').split('\n')
        results = [predict_good_review(text, dictionary, good_vec, bad_vec, good_pro, stop_words) for text in texts if text.strip() != '']
        words_list = [word for result in results for word in result['words'] if word not in stop_words] # 过滤停用词
        word_freq = Counter(words_list)
        word_freq_list = [{"name": word, "value": count} for word, count in word_freq.items()]
        # 保存词频数据到文件
        with open('wordcloud.json', 'w', encoding='utf-8') as fp:
            json.dump(word_freq_list, fp, ensure_ascii=False)
        return {"results": results}
    except Exception as e:
        return JSONResponse(status_code=500, content={"message": str(e)})


def load_wordcloud_data(filepath):
    """加载词云数据"""
    try:
        with open(filepath, 'r', encoding='utf-8') as fp:
            return json.load(fp)
    except Exception as e:
        raise RuntimeError(f"Error loading word cloud data: {e}")


@app.get('/wordcloud')
def get_wordcloud():
    """获取新词云数据"""
    try:
        word_cloud_data = load_wordcloud_data('wordcloud.json')

        # 对数据按值进行排序
        sorted_word_cloud_data = sorted(word_cloud_data, key=lambda x: x['value'], reverse=True)

        bar_chart_data = {
            'categories': [w['name'] for w in sorted_word_cloud_data[:10]],
            'data': [w['value'] for w in sorted_word_cloud_data[:10]]
        }

        pie_chart_data = {
            'data': [{'name': w['name'], 'value': w['value']} for w in sorted_word_cloud_data[:10]]
        }

        return {
            'word_cloud': sorted_word_cloud_data,
            'barChart': bar_chart_data,
            'pieChart': pie_chart_data
        }
    except Exception as e:
        return JSONResponse(status_code=500, content={"message": str(e)})

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8001)
