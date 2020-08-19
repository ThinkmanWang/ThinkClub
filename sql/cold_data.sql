CREATE TABLE olap."t_deal" (
  "id" int8 NOT NULL,
  "man_id" int8 NOT NULL,
  "manager_id" int8 NOT NULL,
  "create_time" timestamp(6) NOT NULL DEFAULT now(),
  "update_time" timestamp(6) NOT NULL DEFAULT now()
)
WITH (appendonly=true, orientation=column, compresstype=zlib, compresslevel=4)
PARTITION BY RANGE (create_time)
(
    START (timestamp '2010-01-01 00:00:00') INCLUSIVE
    END (timestamp '2031-01-01 00:00:00') EXCLUSIVE
    EVERY (INTERVAL '1 month')
);

CREATE TABLE olap."t_deal_detail" (
  "id" int8 NOT NULL,
  "order_id" int8 NOT NULL,
  "menu_id" int8 NOT NULL,
  "girl_id" int8 NOT NULL,
  "price" numeric(10,2) NOT NULL,
  "create_time" timestamp(6) NOT NULL DEFAULT now(),
  "update_time" timestamp(6) NOT NULL DEFAULT now()
)
WITH (appendonly=true, orientation=column, compresstype=zlib, compresslevel=4)
PARTITION BY RANGE (create_time)
(
    START (timestamp '2010-01-01 00:00:00') INCLUSIVE
    END (timestamp '2031-01-01 00:00:00') EXCLUSIVE
    EVERY (INTERVAL '1 month')
);
