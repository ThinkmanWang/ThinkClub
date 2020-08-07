# -*- coding: utf-8 -*-

import random

from service.GirlService import GirlService
from service.MenuService import MenuService

g_dictBaseMenuPrice = {
    "1": 100
    , "2": 188
    , "3": 1500
    , "4": 128
    , "5": 788
}

def rand_gen_menu_price(dictGirl):
    nItems = random.randint(1, 5)

    setMenu = set()
    while len(setMenu) < nItems:
        setMenu.add(random.choice([1, 2, 3, 4, 5]))

    for nMenuId in setMenu:
        if 3 == nMenuId:
            nBasePrice = g_dictBaseMenuPrice[str(nMenuId)] + random.randint(-100, 1000)
        else:
            nBasePrice = g_dictBaseMenuPrice[str(nMenuId)]

        GirlService.add_girl_menu_price(dictGirl["id"], nMenuId, nBasePrice)

def main():
    lstGirl = GirlService.get_girls()

    for dictGirl in lstGirl:
        rand_gen_menu_price(dictGirl)


if __name__ == '__main__':
    main()