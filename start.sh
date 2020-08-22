#!/bin/sh

cd /var/services/homes/thinkman/Github-Thinkman/ThinkClub
export PATH="$PATH:/opt/bin"

pipenv run python make_deal_final.py -Dpname=make_deal_final > /dev/null 2>&1 &
pipenv run python make_detail_final.py -Dpname=make_detail_final > /dev/null 2>&1 &

