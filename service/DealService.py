# -*- coding: utf-8 -*-

import psycopg2

from psycopg2.extras import DictCursor

from pythinkutils.postgresql.ThinkPG import ThinkPG
from pythinkutils.common.object2json import *

class DealService(object):

    @classmethod
    def make_deal(cls, nManId, nManagerId, szDealTime):
        conn = ThinkPG.get_conn_pool_ex().getconn()
        cur = conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor)
        try:
            nRet = cur.execute('''
                INSERT INTO t_deal(man_id, manager_id, create_time)
                VALUES
                    (%s, %s, %s)
                RETURNING id;
            ''', (nManId, nManagerId, szDealTime))

            conn.commit()

            rows = cur.fetchall()
            if rows is None or len(rows) <= 0:
                return 0

            return rows[0]["id"]
        except Exception as e:
            return 0
        finally:
            ThinkPG.get_conn_pool_ex().putconn(conn)

    @classmethod
    def make_deal_detail(cls, nOrderId, nMenuId, nGirlId, nPrice, szDealTime):
        conn = ThinkPG.get_conn_pool_ex().getconn()
        cur = conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor)
        try:
            nRet = cur.execute('''
                    INSERT INTO t_deal_detail(order_id, menu_id, girl_id, price, create_time)
                    VALUES
                        (%s, %s, %s, %s, %s)
                ''', (nOrderId, nMenuId, nGirlId, nPrice, szDealTime))

            conn.commit()

            return nRet
        except Exception as e:
            return 0
        finally:
            ThinkPG.get_conn_pool_ex().putconn(conn)