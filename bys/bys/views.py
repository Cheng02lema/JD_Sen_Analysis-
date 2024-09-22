from django.views.decorators.http import require_http_methods
import requests
from django.shortcuts import render
from django.http import JsonResponse
def predict_view(request):
    result = None
    if request.method == 'POST':
        user_input = request.POST.get('input_text')  # 从表单获取用户输入
        try:
            response = requests.post('http://localhost:8001/byspredict', json={'input': user_input})
            if response.status_code == 200:
                result = response.json().get('result', 'No result returned.')
            else:
                result = "Error: FastAPI server returned an error."
        except requests.exceptions.RequestException as e:
            result = str(e)

    return render(request, 'bys/predict.html', {'result': result})


@require_http_methods(["GET", "POST"])
def batch_predict_view(request):
    result = None
    if request.method == 'POST':
        file = request.FILES.get('file_input')
        if file:
            # 读取文件内容
            file_content = file.read().decode('utf-8')
            # 准备发送到 FastAPI 的数据
            try:
                response = requests.post('http://localhost:8001/batchpredict', files={'file': file_content})
                if response.status_code == 200:
                    result = response.json().get('results', 'No results returned.')
                else:
                    result = f"Error: FastAPI server returned {response.status_code}."
            except requests.exceptions.RequestException as e:
                result = f"Request failed: {str(e)}"
        else:
            result = "No file was uploaded."

    return render(request, 'bys/pl_predict.html', {'result': result})

from django.shortcuts import render
from django.http import JsonResponse
from .models import Review  # 确保导入你的模型

def wordcloud_view(request):
    return render(request, 'reviews/wordclouds.html')

def wordcloud(request):
    brand = request.GET.get('brand')
    if brand:
        reviews = Review.objects.filter(brand=brand)
        words = reviews.values('word', 'count')
        word_data = [{'name': w['word'], 'value': w['count']} for w in words]
        data = {
            'words': word_data,
            'barChart': {
                'categories': [w['word'] for w in words[:10]],
                'data': [w['count'] for w in words[:10]]
            },
            'pieChart': {
                'data': [{'name': w['word'], 'value': w['count']} for w in words[:10]]
            }
        }
    else:
        data = {}
    return JsonResponse(data)
