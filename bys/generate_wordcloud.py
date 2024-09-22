import jieba
from wordcloud import WordCloud
import matplotlib.pyplot as plt

# 示例中文评论文本
text = """
手机非常好，性能出色，电池续航时间长，摄像头画质非常清晰。价格实惠，屏幕显示效果非常棒，操作流畅，设计时尚，非常适合日常使用。
非常好的购物体验，手机运行速度快，用户界面友好，感觉轻巧，便于携带，性价比高，推荐购买。
"""

# 使用 jieba 进行中文分词
text = " ".join(jieba.cut(text))

# 创建词云对象，指定字体路径为 macOS 下常见的中文字体
wordcloud = WordCloud(
    font_path='/System/Library/Fonts/STHeiti Medium.ttc',  # macOS 字体路径
    width=800,
    height=400,
    background_color='white',
    colormap='viridis',
    max_words=100
).generate(text)

# 显示词云图像
plt.figure(figsize=(10, 5))
plt.imshow(wordcloud, interpolation='bilinear')
plt.axis('off')  # 不显示坐标轴
plt.show()
wordcloud.to_file("wordcloud.png")