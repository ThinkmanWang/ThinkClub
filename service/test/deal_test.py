# -*- coding: utf-8 -*-

from service.DealService import DealService

from pythinkutils.common.log import g_logger
from pythinkutils.common.datetime_utils import *
from pythinkutils.common.object2json import *

def get_deal_by_date():
    nStart = get_timestamp()
    nCount, lstData = DealService.get_deal_with_count("2017-07-01", "2017-07-31", 0, 10)
    g_logger.info("%d => %s" % (nCount, obj2json(lstData)))
    g_logger.info("%d s" % (get_timestamp() - nStart, ))

def get_deal_by_month():
    nStart = get_timestamp()
    nCount, lstData = DealService.get_deal_by_month("2017-07", 0, 10)
    g_logger.info("%d => %s" % (nCount, obj2json(lstData)))
    g_logger.info("%d s" % (get_timestamp() - nStart,))


def main():
    get_deal_by_date()
    get_deal_by_month()

if __name__ == '__main__':
    main()