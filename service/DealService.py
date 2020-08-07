# -*- coding: utf-8 -*-

import psycopg2

from psycopg2.extras import DictCursor

from pythinkutils.postgresql.ThinkPG import ThinkPG
from pythinkutils.common.object2json import *

class DealService(object):

    @classmethod
    def make_deal(cls, nManId, nGirlId, nMenuId, nPrice, szDealTime):
        conn = ThinkPG.get_conn_pool_ex().getconn()
        cur = conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor)
        try:
            nRet = cur.execute('''
                INSERT INTO t_deal(man_id, girl_id, menu_id, price, create_time)
                VALUES
                    (%s, %s, %s, %s, %s)
            ''', (nManId, nGirlId, nMenuId, nPrice, szDealTime))

            conn.commit()

            return nRet
        except Exception as e:
            return 0
        finally:
            ThinkPG.get_conn_pool_ex().putconn(conn)