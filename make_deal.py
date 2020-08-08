# -*- coding: utf-8 -*-

import random

from multiprocessing.pool import ThreadPool
import threading

from service.ManService import ManService
from service.MenuService import MenuService
from service.DealService import DealService
from service.ManagerService import ManagerService

from pythinkutils.common.log import g_logger
from pythinkutils.common.object2json import obj2json
from pythinkutils.common.datetime_utils import *

g_nSuccess = 0
g_lock = threading.Lock()
g_threadPool = ThreadPool(256)

def rand_deal():
    global g_nSuccess

    while True:
        lstMan = ManService.random_man(random.randint(10, 200))
        g_logger.info("Random %d man" % (len(lstMan), ))

        lstMenu = MenuService.get_menus()
        lstManager = ManagerService.get_managers()

        for dictMan in lstMan:

            dictPlayList = {}
            nPlayCnt = random.randint(1, len(lstMenu))

            while len(dictPlayList.keys()) < nPlayCnt:
                dictMenu = random.choice(lstMenu)
                if str(dictMenu["id"]) not in dictPlayList.keys():
                    dictPlayList[str(dictMenu["id"])] = dict(dictMenu)

            szDate = randomDate("2010-01-01 00:00:00", "2020-12-31 23:59:59")
            dictManager = random.choice(lstManager)

            # with g_lock:
            #     g_nSuccess += 1
            #     g_logger.info("[%d] => %s %s %d items" % (g_nSuccess, szDate, dictMan["name"], len(dictPlayList.keys()), ))

            g_nSuccess += 1
            g_logger.info("[%d] => %s %s %d items" % (g_nSuccess, szDate, dictMan["name"], len(dictPlayList.keys()),))

            nOrderId = DealService.make_deal(dictMan["id"], dictManager["id"], szDate)
            if nOrderId <= 0:
                continue

            for dictMenu in dictPlayList.values():
                dictGirl = random.choice(dictMenu["girls"])
                DealService.make_deal_detail(nOrderId, dictMenu["id"], dictGirl["girl_id"], dictGirl["price"], szDate)


def main():
    # rand_deal()

    for i in range(256):
        g_threadPool.apply_async(rand_deal)

    g_threadPool.close()
    g_threadPool.join()

if __name__ == '__main__':
    main()
