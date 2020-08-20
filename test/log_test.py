# -*- coding: utf-8 -*-

from pythinkutils.common.log import g_logger
from pythinkutils.common.datetime_utils import *

def main():
    while True:
        g_logger.info("%s" % (get_current_time_str()))
        time.sleep(5)

if __name__ == '__main__':
    main()