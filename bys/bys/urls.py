# urls.py
from django.urls import path,include
from .views import predict_view, batch_predict_view, wordcloud_view, wordcloud  # 确保视图函数正确导入
from django.contrib import admin
urlpatterns = [
    path('', predict_view, name='home'),
    path('admin/', admin.site.urls),
    path('predict/', predict_view, name='predict_view'),  # 确保路径和名称正确
    path('pl_predict/', batch_predict_view, name='batch_predict_view'),
    path('wordclouds/', wordcloud_view, name='wordclouds'),
    path('wordcloud/', wordcloud, name='wordcloud'),
]
