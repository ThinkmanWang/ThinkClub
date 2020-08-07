# -*- coding: utf-8 -*-

from decimal import Decimal
from pythinkutils.common.object2json import obj2json

print(Decimal("1.01"))

dictTest = {
    "a" : Decimal("1.01")
}

print(obj2json(dictTest))