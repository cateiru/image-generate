import os

from selenium import webdriver


def main():
    image_save_path = os.path.join('images', 'image.png')

    text = 'Hello'

    captcha(image_save_path, text)


def captcha(image_save_path: str, text: str) -> None:
    url = f'http://server:5000/?text={text}'

    options = webdriver.ChromeOptions()

    options.add_argument('--headless')
    options.add_argument('--no-sandbox')

    driver = webdriver.Chrome(options=options)

    driver.set_window_size(1920, 1080)
    driver.execute_script("document.body.style.zoom='100%'")
    driver.get(url)
    driver.implicitly_wait(3)
    driver.save_screenshot(image_save_path)
    driver.quit()


if __name__ == "__main__":
    main()
