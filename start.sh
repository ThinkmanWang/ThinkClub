#!/bin/sh

cd /root/code/luban

pipenv run python main.py -Dpname=luban > /dev/null 2>&1 &

