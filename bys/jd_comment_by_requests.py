import random
import sys
import time
from urllib.parse import urlparse
from urllib.parse import parse_qs
import requests
from glob import glob
import csv
import json
from get_proxys import check
import logging


#print("初始化日志")
logger = logging.getLogger("logger")
logger.setLevel(logging.INFO)# info,debug,warning, error, fatal
#控制台输出
sh = logging.StreamHandler()
#写入日志文件
fh = logging.FileHandler("log/crawl.log", encoding="utf-8")
formatter = logging.Formatter(fmt="%(asctime)s-[%(filename)s-->Line:%(lineno)d]-%(levelname)s:%(message)s",
                              datefmt="%Y/%m/%d %X")
fh.setFormatter(formatter)

logger.addHandler(sh)
logger.addHandler(fh)

#读取有效的代理列表
def get_proxy_list():
    file_list = glob("valid_proxies/*.csv")
    file_list.sort()
    proxy_file = file_list[0]
    proxy_lst = []
    f2 = open(proxy_file, encoding="utf-8")
    reader = csv.reader(f2)
    for row in reader:
        if row[1] in proxy_lst:
            continue
        proxy_lst.append(row[1])
    f2.close()
    return proxy_lst

#将代理地址转换为requests可以接收的格式，即字典格式
def convert_proxies(proxy_lst):
    types = [ip.split("://")[0] for ip in proxy_lst]
    proxies = []
    for (k, v) in zip(types, proxy_lst):
        tmp_dct = {k:v}
        proxies.append(tmp_dct)
        # print(proxies)
    return proxies

def get_productIds(error_of_productId=None):
    id_lst=[]
    f = open("data/jd_phone_list1.json", encoding="utf-8")
    l = f.readlines()
    if not error_of_productId:
       for idx,line in enumerate(l):
           dct = json.loads(line)
           productid = dct["productid"]
           id_lst.append(productid)
    else:
        search_idx = 0
        for idx,line in enumerate(l):
            dct = json.loads(line)
            productid = dct["productid"]
            if error_of_productId == productid:
               search_idx = idx
               break
        l= l[search_idx:]
        for idx, line in enumerate(l):
            dct = json.loads(line)
            productid = dct["productid"]
            id_lst.append(productid)
    f.close()
    return id_lst
#爬取数据前再次检查代理是否有效
def _get_valid_proxies(all_poxies):
    #随机取一个有效的代理
    cnt = 0
    while True:
        proxies = random. choice(all_proxies)
        cnt += 1
        tmp = list(dict(proxies).values())[0]
        if check(tmp):
           return proxies
        if cnt == 100:
            logger.warn("尝试100次，仍没有有效的代理，无法爬取数据!!")
            return None
def _sleep(small,big):
   rnd = random.randint(small, big)
   logger.info("睡" +str(rnd)+"秒")
   time.sleep(rnd)

def save_to_current_url(url):
    with open("data/current_url.txt","w", encoding="utf-8")as f:
        f.write(url)
        logger.warning("系统因异常即将终止，已将当前处理的url写入data/current_url.txt")

def get_current_url():
    with open("data/current_url.txt",encoding="utf-8")as f:
       url = f.readline()
       if url:
           return url
       else:
           return None

def crawl(productids, all_proxies, base_url, headers, status=0):
    for idx, id in enumerate(productids):
        logger.info("爬取第" + str(idx)+ "个商品的评价，商品编号;" + str(id))
        if (idx +1) % 30 ==0:
            logger.info("进入睡眠大周期(每爬取三十个商品进入一次大周期（30~60秒）)")
            _sleep(30,60)
        logger.info("进入睡眠小周期(每爬取一个商品进入一次小周期(（1~10秒）)")
        _sleep(1,6)
        proxies = _get_valid_proxies(all_proxies)
        logger.info("每爬取一个商品，获取新的随机获取有效代理为:" +str(proxies))
        #评价，0:全部评价,1:差评,2:中评，3:好评，此处取1-3
        for score in range(1,4):
            #每类评价取10页(每页10条）,共计100条评价
            for pagenum in range(10):
                if pagenum % 3 == 0:
                    logger.info("每爬取3页，睡5～10秒")
                    _sleep(5, 10)
                url = base_url.format(id, score, pagenum)
                logger.info("当前抓取url:" +url)
                data = None
                try:
                    data = requests.get(url,proxies=proxies,headers=headers)
                    if not data:
                        break
                    #print(data)
                    data=data.json()
                    #print(data)
                    comments=data["comments"]
                    with open("data/jd_phone_comment_3.json","a",encoding="utf-8",newline="") as f:
                       comment_dict= {}
                       for comment in comments:
                           comment_dict[ "produetid"]= id
                           comment_dict["id"] =comment["id"]
                           comment_dict[ "score"] = score
                           content = comment['content']
                           content = str(content).replace("\n", "")
                           comment_dict["content"]=content
                           json.dump(comment_dict, f, ensure_ascii=False)
                           f.write("\n")
                except BaseException as e:
                    logger.warning(str(e))
                    save_to_current_url(url)
                    sys.exit(0)


def get_current_productid_from_url(current_url):
    url = urlparse(current_url)
    qstr = url.query
    tmp_dict = parse_qs(qstr)
    return(tmp_dict["productId"][0],tmp_dict["score"][0],tmp_dict["page"][0])
    #return (tmp_dict["productId"][0],tmp_dict["score"][0],tmp_dict["page"][0])

def clear_current_url():
    open("data/current_url.txt", "w").close()


if __name__ == "__main__":
    base_url="https://api.m.jd.com/?appid=item-v3&functionId=pc_club_productPageComments&client=pc&clientVersion=1.0.0&t=1684916804850&loginType=3&uuid=122270672.165131705921745578021.1651317059.1684907742.1684913510.123&productId={}&score={}&sortType=5&page={}&pageSize=10&isShadowSku=0&fold=1&bbtf=1&shield="
    headers= {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:105.0) Gecko/20100101 Firefox/105.0",
        "cookie": "__jda=76161171.1897416788.1665990956.1665990962.1666009575.2; unpl=JF8EAK9nNSttX0pUDEgEGRtEHl4HW1kPTR5WOjQCVgpfT1FVSwETG0d7XlVdXhRLFh9vYRRUWVNLUA4fBSsSEXteXVdZDEsWC2tXVgQFDQ8VXURJQlZAFDNVCV9dSRZRZjJWBFtdT1xWSAYYRRMfDlAKDlhCR1FpMjVkXlh7VAQrAhIaFk5dU1hUAXsnBF9XNVNeWUtSAysDKxMgCQkIW1wKTRYAImcMXFtdS1MDEgsrEyBI; __jdv=76161171|baidu-pinzhuan|t_288551095_baidupinzhuan|cpc|0f3d30c8dba7459bb52f2eb5eba8ac7d_0_6018b738ed2b45678ddb63f654aa298f|1666009574933; __jdu=1897416788; areaId=13; ipLoc-djd=13-1000-0-0; PCSYCityID=CN_370000_370100_0; shshshfp=8e0aebf2bba8a98eb1957eb50ab4bdf0; shshshfpa=afb77d77-5fc4-f6f6-c2c2-8acaf5965f7c-1665990965; shshshfpb=j-5sOHNg-yKJWmwLVlicezQ; __jdc=76161171; __jdb=76161171.1.1897416788|2.1666009575; shshshsID=6dd75453152c8354f7be88d16bbb18c9_1_1666009577685; 3AB9D23F7A4B3C9B=HPRXXOSHPPXV3Y4IFLB74CLVTAHTS2JXA4GIQYR2FFHGUFZE7XUNYM5KY25UCMZBQDAXPWNU3BLRCXJFXVH4TPZRRM"
    }
    proxy_lst = get_proxy_list()
    #logger.info(proxy_lst)

    all_proxies = convert_proxies(proxy_lst)
    #logger.info(all_proxies)

    current_url = get_current_url()

    productids = None
    # 判断data/current_url.txt中是否有记录,如果有表示不是从头爬取
    if not current_url:
        # 获取所有商品id
        productids = get_productIds()
    else:
        # 拆分
        current_productid = get_current_productid_from_url(current_url)[0]
        # 清空current_url.txt
        clear_current_url()
        # 从指定productid开始读取
        productids = get_productIds(error_of_productId=current_productid)
        #print(productids)
        # logger.info(productids)
    crawl(productids, all_proxies, base_url, headers)
# data=requests.get(
#     "https://club.jd.com/comment/productPageComments.action?productId=",
#     proxies=proxies,
#     headers=headers
# ).json
# comments=data['comments']
# logger.info(comments)
