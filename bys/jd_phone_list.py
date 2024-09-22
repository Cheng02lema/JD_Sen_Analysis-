# import selenium
from selenium import webdriver
from selenium.webdriver.common.by import By
import time
import json

num = 0
def get_page():
    global num
    num += 1
    if num > 10:
        return
    print(num)
    js = "window.scrollTo(10000000,100000000)"
    driver.execute_script(js)
    time.sleep(10)
    li_list = driver.find_elements(By.XPATH, value="//div[@id='J_goodsList']/ul/li")
    with open("data/jd_phone_list.json", "a", encoding="utf-8") as f:
        for li in li_list:
            price = li.find_element(By.XPATH, value=".//div[1]/div[3]/strong/i").text
            title = li.find_element(By.XPATH, value=".//div[1]/div[4]/a/em").text
            if title.startswith("京品手机"):
                title = title.replace("京品手机", "").replace("\n", "")
            if title.startswith("爱心东东"):
                title = title.replace("爱心东东", "").replace("\n", "")
            if title.startswith("京东国际"):
                title = title.replace("京东国际", "").replace("\n", "")
            href = li.find_element(by=By.XPATH, value=".//div[1]/div[4]/a").get_attribute("href")
            productId = href[20:-5]
            selfsupport_tmp = li.find_element(by=By.XPATH, value=".//div[1]/div[8]").text
            if "自营" in selfsupport_tmp:
                selfsupport = True
            else:
                selfsupport = False
            commentcnt = li.find_element(by=By.XPATH, value=".//div[1]/div[5]/strong/a").text
            commentcnt = commentcnt.replace("万", "0000").replace("+", "")
            try:
                shop = li.find_element(by=By.XPATH, value=".//div/div[7]/span/a").text
            except:
                shop = "none"
            tmp_dct = {"price": price, "title": title, "href": href, "commentcnt": commentcnt, "shop": shop,
                       "productid": productId, "selfsupport": selfsupport}
            json.dump(tmp_dct, f, ensure_ascii=False)
            f.write("\n")
    driver.find_element(by=By.XPATH, value="//div[@id='J_bottomPage']/span/a[@class='pn-next']").click()
    time.sleep(3)
    get_page()



if __name__ == '__main__':
    url = "https://jd.com"

    driver = webdriver.Chrome()
    driver.maximize_window()
    driver.get(url)
    key = driver.find_element(By.XPATH, value=".//input[@id='key']")
    key.send_keys("手机")
    btn = driver.find_element(By.XPATH, value=".//button[@aria-label='搜索']")
    btn.click()
    time.sleep(3)
    driver.find_element(By.XPATH, value="//div[@class='f-sort']/a[2]/span").click()
    driver.find_element(By.XPATH, value="//div[@id='J_feature']/ul/li/a").click()
    time.sleep(1)
    get_page()
