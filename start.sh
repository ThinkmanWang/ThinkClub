#!/bin/sh

cd /var/services/homes/thinkman/Github-Thinkman/ThinkClub
export PATH="$PATH:/opt/bin"

pipenv run python make_deal.py -Dpname=thinkclub > /dev/null 2>&1 &

