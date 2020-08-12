# -*- coding: utf-8 -*-

from service.DealService import DealService

from pythinkutils.common.log import g_logger
from pythinkutils.common.datetime_utils import *
from pythinkutils.common.object2json import *

def get_deal_by_date():
    nStart = get_timestamp()
    nCount, lstData = DealService.get_deal_with_count("2017-07-01", "2017-07-31", nOffset=0, nLimit=10)
    g_logger.info("%d => %s" % (nCount, obj2json(lstData).encode('utf-8').decode('unicode_escape')))
    g_logger.info("%d s" % (get_timestamp() - nStart, ))

def get_deal_by_month():
    nStart = get_timestamp()
    nCount, lstData = DealService.get_deal_by_month("2017-07", nOffset=0, nLimit=10)
    g_logger.info("%d => %s" % (nCount, obj2json(lstData).encode('utf-8').decode('unicode_escape')))
    g_logger.info("%d s" % (get_timestamp() - nStart,))

def get_deal_by_manager():
    nStart = get_timestamp()
    nCount, lstData = DealService.get_deal_by_month("2017-07", nManagerId=5010, nOffset=0, nLimit=10)
    g_logger.info("%d => %s" % (nCount, obj2json(lstData).encode('utf-8').decode('unicode_escape')))
    g_logger.info("%d s" % (get_timestamp() - nStart,))

def get_deal_by_girl():
    nStart = get_timestamp()
    nCount, lstData = DealService.get_deal_by_month("2017-07", nGirlId=1098, nOffset=0, nLimit=10)
    g_logger.info("%d => %s" % (nCount, obj2json(lstData).encode('utf-8').decode('unicode_escape')))
    g_logger.info("%d s" % (get_timestamp() - nStart,))

def get_deal_by_manager_girl():
    nStart = get_timestamp()
    nCount, lstData = DealService.get_deal_by_month("2017-07", nManagerId=5010, nGirlId=1098, nOffset=0, nLimit=10)
    g_logger.info("%d => %s" % (nCount, obj2json(lstData).encode('utf-8').decode('unicode_escape')))
    g_logger.info("%d s" % (get_timestamp() - nStart,))



def main():
    get_deal_by_date()
    get_deal_by_month()
    get_deal_by_manager()
    get_deal_by_girl()
    get_deal_by_manager_girl()

if __name__ == '__main__':
    main()