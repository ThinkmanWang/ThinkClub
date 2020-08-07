# -*- coding: utf-8 -*-

import psycopg2

from psycopg2.extras import DictCursor

from pythinkutils.postgresql.ThinkPG import ThinkPG
from pythinkutils.common.object2json import *

class ManagerService(object):

    @classmethod
    def get_managers(cls):
        conn = ThinkPG.get_conn_pool_ex().getconn()
        cur = conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor)
        try:
            cur.execute("SELECT * from t_manager ")
            rows = cur.fetchall()

            return rows
        except Exception as e:
            return []
        finally:
            ThinkPG.get_conn_pool_ex().putconn(conn)

