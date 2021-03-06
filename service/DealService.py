# -*- coding: utf-8 -*-

import psycopg2
import uuid

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
            szID = str(uuid.uuid4())

            nRet = cur.execute('''
                INSERT INTO t_deal(id, man_id, manager_id, create_time)
                VALUES
                    (%s, %s, %s, %s)
            ''', (szID, nManId, nManagerId, szDealTime))

            conn.commit()

            # rows = cur.fetchall()
            # if rows is None or len(rows) <= 0:
            #     return 0

            return szID
        except Exception as e:
            return 0
        finally:
            ThinkPG.get_conn_pool_ex().putconn(conn)

    @classmethod
    def make_multiple_deal(cls, lstDeals):

        lstIDRet = []
        for dictDeal in lstDeals:
            dictDeal["id"] = str(uuid.uuid4())
            lstIDRet.append({
                "id": dictDeal["id"]
            })

        conn = ThinkPG.get_conn_pool_ex().getconn()
        cur = conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor)
        try:
            szSql = 'INSERT INTO t_deal(id, man_id, manager_id, create_time) VALUES %s '
            psycopg2.extras.execute_values(cur, szSql, lstDeals, page_size=len(lstDeals))

            conn.commit()

            return lstIDRet
        except Exception as e:
            return None
        finally:
            ThinkPG.get_conn_pool_ex().putconn(conn)

    @classmethod
    def make_deal_multiple_detail(cls, lstDetails):
        conn = ThinkPG.get_conn_pool_ex().getconn()
        cur = conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor)
        try:

            szSql = 'INSERT INTO t_deal_detail(order_id, menu_id, girl_id, price, create_time) VALUES %s '
            psycopg2.extras.execute_values(cur, szSql, lstDetails, page_size=len(lstDetails))

            conn.commit()

        except Exception as e:
            pass
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
                            b.name as menu_name
                            , c.name as girl_name
                            , a.*
                        FROM
                            t_deal_detail as a 
                            left join t_menu as b on a.menu_id = b.id
                            left join t_girls as c on a.girl_id = c.id
                        where 
                            a.deal_id = %s
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
                    b.name as manager_name
                    , c.name as man_name
                    , a.*
                FROM
                    t_deal as a
                    left join t_manager as b on a.manager_id = b.id
                    left join t_man as c on a.man_id = c.id
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

