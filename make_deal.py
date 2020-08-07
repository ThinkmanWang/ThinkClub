# -*- coding: utf-8 -*-

import random

from service.ManService import ManService
from service.MenuService import MenuService

from pythinkutils.common.log import g_logger

def main():
    lstMan = ManService.random_man(random.randint(10, 200))
    g_logger.info("Random %d man" % (len(lstMan), ))

    lstMenu = MenuService.get_menus()

    for dictMan in lstMan:
        g_logger.info("%s come" % (dictMan["name"], ))



if __name__ == '__main__':
    main()