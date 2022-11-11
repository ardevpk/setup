import os
import pyautogui
from threading import Thread
import time


def openSystem():
    os.system(f'cd $PWD/project/ && git stash && git pull && cd ../ && ./restart.sh')

thread = Thread(target=openSystem, args=())
thread.start()
time.sleep(3)
pyautogui.write(str(input('Git Token: ')))
pyautogui.press('enter')
