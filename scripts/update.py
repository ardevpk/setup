import os
import pyautogui
from threading import Thread
import time

os.environ['DISPLAY'] = ':0'


os.system('cd $PWD/project/ && git stash')
token = input('Git Token: ')
def openSystem():
    os.system(f'cd $PWD/project/ && git pull')

thread = Thread(target=openSystem, args=())
thread.start()
time.sleep(3)
pyautogui.write(str(token))
pyautogui.press('enter')
