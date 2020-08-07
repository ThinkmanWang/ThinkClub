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
            conn.close()

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
            conn.close()

def main():
    print(obj2json(GirlService.get_girls()))

if __name__ == '__main__':
    main()