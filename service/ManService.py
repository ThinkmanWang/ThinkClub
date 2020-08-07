# -*- coding: utf-8 -*-

import psycopg2

from psycopg2.extras import DictCursor

from pythinkutils.postgresql.ThinkPG import ThinkPG
from pythinkutils.common.object2json import *

class ManService(object):

    @classmethod
    def get_mans(cls):
        conn = ThinkPG.get_conn_pool_ex().getconn()
        cur = conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor)
        try:
            cur.execute("SELECT * from t_man ")
            rows = cur.fetchall()

            return rows
        except Exception as e:
            return []
        finally:
            ThinkPG.get_conn_pool_ex().putconn(conn)

    @classmethod
    def random_man(cls, nCount):
        conn = ThinkPG.get_conn_pool_ex().getconn()
        cur = conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor)
        try:
            cur.execute("SELECT * from t_man order by random() limit %s", (nCount, ))
            rows = cur.fetchall()

            return rows
        except Exception as e:
            return []
        finally:
            ThinkPG.get_conn_pool_ex().putconn(conn)

