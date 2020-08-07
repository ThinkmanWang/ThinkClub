# -*- coding: utf-8 -*-

import psycopg2

from psycopg2.extras import DictCursor

from pythinkutils.postgresql.ThinkPG import ThinkPG
from pythinkutils.common.object2json import *

class GirlService(object):

    @classmethod
    def get_girls(cls, szBirthyearAfter = '1900'):
        conn = ThinkPG.get_conn_pool_ex().getconn()
        cur = conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor)
        try:
            szSql = "SELECT * from t_girls WHERE birthday >= '{}-01-01'".format(szBirthyearAfter)
            cur.execute(szSql)
            rows = cur.fetchall()

            lstRet = []
            for dictRow in rows:
                dictRow["menu"] = cls.get_girl_menus(dictRow["id"])
                lstRet.append(dictRow)

            return lstRet
        except Exception as e:
            return []
        finally:
            ThinkPG.get_conn_pool_ex().putconn(conn)

    @classmethod
    def get_girl_menus(cls, nGirlId):
        conn = ThinkPG.get_conn_pool_ex().getconn()
        cur = conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor)
        try:
            cur.execute("""
                SELECT
                    a.menu_id
                    , b."name"
                    , a.price
                FROM
                    t_girl_menu_price AS a 
                    LEFT JOIN t_menu as b on a.menu_id = b.id
                where 
                    1 = 1
                    and a.girl_id = %s
            """, (nGirlId, ))
            rows = cur.fetchall()

            return rows
        except Exception as e:
            return []
        finally:
            ThinkPG.get_conn_pool_ex().putconn(conn)

    @classmethod
    def add_girl_menu_price(cls, nGirlId, nMenuId, nPrice):
        conn = ThinkPG.get_conn_pool_ex().getconn()
        cur = conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor)
        try:
            nRet = cur.execute('''
                INSERT INTO t_girl_menu_price(girl_id, menu_id, price)
                VALUES
                    (%s, %s, %s)
            ''', (nGirlId, nMenuId, nPrice))

            conn.commit()

            return nRet
        except Exception as e:
            return 0
        finally:
            ThinkPG.get_conn_pool_ex().putconn(conn)


# def main():
#     print(obj2json(GirlService.get_girls()).encode('utf-8').decode('unicode_escape'))
#
# if __name__ == '__main__':
#     main()