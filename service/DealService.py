# -*- coding: utf-8 -*-

import psycopg2

from psycopg2.extras import DictCursor

from pythinkutils.postgresql.ThinkPG import ThinkPG
from pythinkutils.common.object2json import *
from pythinkutils.common.datetime_utils import *

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
    def get_deal_with_count(cls, szDateStart, szDateEnd, nManagerId = 0, nGirlId = 0, nOffset = 0, nLimit = 10):
        return cls.get_deal_count(szDateStart, szDateEnd, nManagerId, nGirlId), cls.get_deal(szDateStart, szDateEnd, nManagerId, nGirlId, nOffset, nLimit)

    @classmethod
    def get_deal_by_month(cls, szMonth, nManagerId = 0, nGirlId = 0, nOffset = 0, nLimit = 10):
        szStart = szMonth + "-01"
        dateEnd = last_day_of_month_by_date(datetime(int(szStart.split("-")[0]), int(szStart.split("-")[1]), int(szStart.split("-")[2])))
        szEnd = dateEnd.strftime('%Y-%m-%d')

        return cls.get_deal_with_count(szStart, szEnd, nManagerId, nGirlId, nOffset, nLimit)

    @classmethod
    def get_deal(cls, szDateStart, szDateEnd, nManagerId = 0, nGirlId = 0, nOffset = 0, nLimit = 10):
        conn = ThinkPG.get_conn_pool_ex().getconn()
        cur = conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor)
        try:
            szSql = '''
                SELECT
                    a.*
                FROM
                    t_deal as a
                where 
                    1 = 1
                    and a.create_time >= '{}'
                    and a.create_time <= '{}'
            '''.format(szDateStart + " 00:00:00", szDateEnd + " 23:59:59")

            if nManagerId > 0:
                szSql += "    and a.manager_id = {} ".format(nManagerId)

            if nGirlId > 0:
                szSql += "    and exists (select 1 from t_deal_detail where order_id = a.id and girl_id = {}) ".format(nGirlId)

            szSql += " offset {} limit {} ".format(nOffset, nLimit)

            cur.execute(szSql)
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
    def get_deal_count(cls, szDateStart, szDateEnd, nManagerId = 0, nGirlId = 0):
        conn = ThinkPG.get_conn_pool_ex().getconn()
        cur = conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor)
        try:
            szSql = '''
                SELECT
                    count(1) as cnt
                FROM
                    t_deal as a
                where 
                    1 = 1
                    and a.create_time >= '{}'
                    and a.create_time <= '{}'
            '''.format(szDateStart + " 00:00:00", szDateEnd + " 23:59:59")

            if nManagerId > 0:
                szSql += "    and a.manager_id = {} ".format(
                    nManagerId)

            if nGirlId > 0:
                szSql += "    and exists (select 1 from t_deal_detail where order_id = a.id and girl_id = {}) ".format(
                    nGirlId)

            cur.execute(szSql)
            rows = cur.fetchall()

            return rows[0]["cnt"]
        except Exception as e:
            return 0
        finally:
            ThinkPG.get_conn_pool_ex().putconn(conn)

# DealService.get_deal("2017-07-01", "2017-07-31", 0, 10)
# DealService.get_deal_count("2017-07-01", "2017-07-31")
# print(DealService.get_deal_with_count("2017-07-01", "2017-07-31", 0, 10))

