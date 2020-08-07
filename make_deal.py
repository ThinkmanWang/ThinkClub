# -*- coding: utf-8 -*-

import random

from multiprocessing.pool import ThreadPool
import threading

from service.ManService import ManService
from service.MenuService import MenuService
from service.DealService import DealService

from pythinkutils.common.log import g_logger
from pythinkutils.common.object2json import obj2json
from pythinkutils.common.datetime_utils import *

g_nTotal = 0
g_nSuccess = 0
g_lock = threading.Lock()
g_threadPool = ThreadPool(32)

def rand_deal():
    global g_nTotal
    global g_nSuccess

    lstMan = ManService.random_man(random.randint(10, 200))
    g_logger.info("Random %d man" % (len(lstMan), ))

    with g_lock:
        g_nTotal += len(lstMan)

    lstMenu = MenuService.get_menus()

    for dictMan in lstMan:
        g_logger.info("%s come" % (dictMan["name"], ))
        with g_lock:
            g_nSuccess += 1

        dictPlayList = {}
        nPlayCnt = random.randint(1, len(lstMenu))

        while len(dictPlayList.keys()) < nPlayCnt:
            dictMenu = random.choice(lstMenu)
            if str(dictMenu["id"]) not in dictPlayList.keys():
                dictPlayList[str(dictMenu["id"])] = dict(dictMenu)

        g_logger.info("[%d/%d] => %d items" % (g_nSuccess, g_nTotal, len(dictPlayList.keys()), ))

        for dictMenu in dictPlayList.values():
            dictGirl = random.choice(dictMenu["girls"])
            DealService.make_deal(dictMan["id"], dictGirl["girl_id"], dictMenu["id"], dictGirl["price"], randomDate("2018-01-01 00:00:00", "2020-12-31 23:59:59"))


def main():
    for i in range(100):
        g_threadPool.apply_async(rand_deal)

    g_threadPool.close()
    g_threadPool.join()

if __name__ == '__main__':
    main()