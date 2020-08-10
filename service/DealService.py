# -*- coding: utf-8 -*-

import psycopg2

from psycopg2.extras import DictCursor

from pythinkutils.postgresql.ThinkPG import ThinkPG
from pythinkutils.common.object2json import *

class DealService(object):

    @classmethod
    def make_deal(cls, nManId, nManagerId, szDealTime=None):
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
    def make_deal_detail(cls, nOrderId, nMenuId, nGirlId, nPrice, szDealTime=None):
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

    @classmethod
    def get_deal_detail(cls, nDealId):
        conn = ThinkPG.get_conn_pool_ex().getconn()
        cur = conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor)
        try:
            cur.execute('''                
                        SELECT
                            *
                        FROM
                            t_deal_detail
                        where 
                            order_id = %s
                    ''', (nDealId, ))
            rows = cur.fetchall()

            return rows
        except Exception as e:
            return []
        finally:
            ThinkPG.get_conn_pool_ex().putconn(conn)

    @classmethod
    def get_deal_with_count(cls, szDateStart, szDateEnd, nOffset, nLimit):
        return cls.get_deal_count(szDateStart, szDateEnd), cls.get_deal(szDateStart, szDateEnd, nOffset, nLimit)

    @classmethod
    def get_deal(cls, szDateStart, szDateEnd, nOffset, nLimit):
        conn = ThinkPG.get_conn_pool_ex().getconn()
        cur = conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor)
        try:
            cur.execute('''                
                SELECT
                    *
                FROM
                    t_deal
                where 
                    create_time >= %s
                    and create_time <= %s
                offset %s limit %s;
            ''', (szDateStart + " 00:00:00", szDateEnd + " 23:59:59", nOffset, nLimit))
            rows = cur.fetchall()

            lstRet = []
            for row in rows:
                row["detail"] = cls.get_deal_detail(row["id"])
                lstRet.append(dict(row))

            return lstRet
        except Exception as e:
            return []
        finally:
            ThinkPG.get_conn_pool_ex().putconn(conn)

    @classmethod
    def get_deal_count(cls, szDateStart, szDateEnd):
        conn = ThinkPG.get_conn_pool_ex().getconn()
        cur = conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor)
        try:
            cur.execute('''
                    SELECT
                        count(1) as cnt
                    FROM
                        t_deal
                    where 
                        create_time >= %s
                        and create_time <= %s
                ''', (szDateStart + " 00:00:00", szDateEnd + " 23:59:59"))
            rows = cur.fetchall()

            return rows[0]["cnt"]
        except Exception as e:
            return 0
        finally:
            ThinkPG.get_conn_pool_ex().putconn(conn)

# DealService.get_deal("2017-07-01", "2017-07-31", 0, 10)
# DealService.get_deal_count("2017-07-01", "2017-07-31")
# print(DealService.get_deal_with_count("2017-07-01", "2017-07-31", 0, 10))

