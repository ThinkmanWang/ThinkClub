# -*- coding: utf-8 -*-

import psycopg2
import redis
import time

from pythinkutils.redis.ThinkRedis import ThinkRedis
from pythinkutils.postgresql.ThinkPG import ThinkPG
from pythinkutils.common.log import g_logger
from pythinkutils.common.datetime_utils import *

g_nLimit = 10000
g_nTotal = 100001000

def get_offset():
    r = redis.StrictRedis(connection_pool=ThinkRedis.get_conn_pool_ex())
    return int(r.get("n_t_deal_offset"))

def incr_offset():
    r = redis.StrictRedis(connection_pool=ThinkRedis.get_conn_pool_ex())
    r.incrby("n_t_deal_offset", g_nLimit)

def insert_deal():
    nStartTime = get_timestamp()

    conn = ThinkPG.get_conn_pool_ex().getconn()
    cur = conn.cursor()
    try:
        cur.execute('''
            insert into public.t_deal
            select * from csv.t_deal offset %s limit %s
        ''', (get_offset(), g_nLimit))

        conn.commit()
        incr_offset()

        g_logger.info("[%d s] %d / %d" % ((get_timestamp() - nStartTime), get_offset(), g_nTotal))
        return True
    except Exception as e:
        g_logger.info(e)
        return False
    finally:
        ThinkPG.get_conn_pool_ex().putconn(conn)

def main():
    # nStartTime = get_timestamp()
    # g_logger.info("[%d s] %d / %d" % ((get_timestamp() - nStartTime), get_offset(), g_nTotal))
    g_logger.info("Start!!!")

    while get_offset() < g_nTotal:
        try:
            insert_deal()
        except Exception as e:
            g_logger.info(e)
            time.sleep(10)
            continue

if __name__ == '__main__':
    main()