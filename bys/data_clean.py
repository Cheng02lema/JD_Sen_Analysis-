import json
import csv
with open("data/jd_phone_comment.json", "r", encoding="utf-8") as f:
    f.seek(0)
    lines = [line.strip() for line in f.readlines()]
    for line in lines :
        data = json.loads(line)

        score = str(data['score'])
        content = data['content']
        data_list = [content, score]
        if (score=="3") :
            with open("data/jd_comment_3.csv", "a", encoding="utf-8", newline='') as n:  # 注意指定 newline='' 避免空行
                writer = csv.writer(n)
                writer.writerow(data_list)
        if (score=="2") :
            with open("data/jd_comment_2.csv", "a", encoding="utf-8", newline='') as n:  # 注意指定 newline='' 避免空行
                writer = csv.writer(n)
                writer.writerow(data_list)
        if (score=="1") :
            with open("data/jd_comment_1.csv", "a", encoding="utf-8", newline='') as n:  # 注意指定 newline='' 避免空行
                writer = csv.writer(n)
                writer.writerow(data_list)

