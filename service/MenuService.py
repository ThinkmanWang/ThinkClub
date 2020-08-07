# -*- coding: utf-8 -*-

import psycopg2

from psycopg2.extras import DictCursor

from pythinkutils.postgresql.ThinkPG import ThinkPG
from pythinkutils.common.object2json import *

class MenuService(object):

    @classmethod
    def get_menus(cls):
        conn = ThinkPG.get_conn_pool_ex().getconn()
        cur = conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor)
        try:
            cur.execute("SELECT * from t_menu ")
            rows = cur.fetchall()

            lstRet = []
            for dictRow in rows:
                dictRow["girls"] = cls.get_menu_girls(dictRow["id"])
                lstRet.append(dictRow)

            return lstRet
        except Exception as e:
            return []
        finally:
            ThinkPG.get_conn_pool_ex().putconn(conn)


    @classmethod
    def get_menu_girls(cls, nMenuId):
        conn = ThinkPG.get_conn_pool_ex().getconn()
        cur = conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor)
        try:
            cur.execute("""
                        SELECT
                            a.girl_id
                            , b."name"
                            , a.price
                        FROM
                            t_girl_menu_price AS a 
                            LEFT JOIN t_girls as b on a.girl_id = b.id
                        where 
                            1 = 1
                            and a.menu_id = %s
                    """, (nMenuId,))
            rows = cur.fetchall()

            return rows
        except Exception as e:
            return []
        finally:
            ThinkPG.get_conn_pool_ex().putconn(conn)


def main():
    print(obj2json(MenuService.get_menus()))

if __name__ == '__main__':
    main()