DROP SEQUENCE IF EXISTS "t_deal_id_seq1";
CREATE SEQUENCE "t_deal_id_seq1" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

DROP TABLE IF EXISTS "t_deal";
CREATE TABLE "t_deal" (
  "id" int8 NOT NULL DEFAULT nextval('t_deal_id_seq1'::regclass),
  "man_id" int8 NOT NULL,
  "manager_id" int8 NOT NULL,
  "create_time" timestamp(6) NOT NULL DEFAULT now(),
  "update_time" timestamp(6) NOT NULL DEFAULT now()
)
PARTITION BY RANGE(create_time) 
SUBPARTITION BY LIST(manager_id)
	SUBPARTITION template
		(
			SUBPARTITION m_5001 VALUES (5001)
			, SUBPARTITION m_5002 VALUES (5002)
			, SUBPARTITION m_5003 VALUES (5003)
			, SUBPARTITION m_5004 VALUES (5004)
			, SUBPARTITION m_5005 VALUES (5005)
			, SUBPARTITION m_5006 VALUES (5006)
			, SUBPARTITION m_5007 VALUES (5007)
			, SUBPARTITION m_5008 VALUES (5008)
			, SUBPARTITION m_5009 VALUES (5009)
			, SUBPARTITION m_5010 VALUES (5010)
			, SUBPARTITION m_5011 VALUES (5011)
			, SUBPARTITION m_5012 VALUES (5012)
			, SUBPARTITION m_5013 VALUES (5013)
			, SUBPARTITION m_5014 VALUES (5014)
			, SUBPARTITION m_5015 VALUES (5015)
			, SUBPARTITION m_5016 VALUES (5016)
			, SUBPARTITION m_5017 VALUES (5017)
			, SUBPARTITION m_5018 VALUES (5018)
			, SUBPARTITION m_5019 VALUES (5019)
			, SUBPARTITION m_5020 VALUES (5020)
			, SUBPARTITION m_5021 VALUES (5021)
			, SUBPARTITION m_5022 VALUES (5022)
			, SUBPARTITION m_5023 VALUES (5023)
			, SUBPARTITION m_5024 VALUES (5024)
			, SUBPARTITION m_5025 VALUES (5025)
			, SUBPARTITION m_5026 VALUES (5026)
			, SUBPARTITION m_5027 VALUES (5027)
			, SUBPARTITION m_5028 VALUES (5028)
			, SUBPARTITION m_5029 VALUES (5029)
		)
	(
		  PARTITION pdate_201001 START ('2010-01-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201002 START ('2010-02-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201003 START ('2010-03-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201004 START ('2010-04-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201005 START ('2010-05-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201006 START ('2010-06-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201007 START ('2010-07-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201008 START ('2010-08-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201009 START ('2010-09-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201010 START ('2010-10-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201011 START ('2010-11-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201012 START ('2010-12-01 00:00:00') INCLUSIVE
		
		, PARTITION pdate_201101 START ('2011-01-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201102 START ('2011-02-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201103 START ('2011-03-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201104 START ('2011-04-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201105 START ('2011-05-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201106 START ('2011-06-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201107 START ('2011-07-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201108 START ('2011-08-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201109 START ('2011-09-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201110 START ('2011-10-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201111 START ('2011-11-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201112 START ('2011-12-01 00:00:00') INCLUSIVE
		
		, PARTITION pdate_201201 START ('2012-01-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201202 START ('2012-02-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201203 START ('2012-03-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201204 START ('2012-04-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201205 START ('2012-05-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201206 START ('2012-06-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201207 START ('2012-07-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201208 START ('2012-08-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201209 START ('2012-09-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201210 START ('2012-10-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201211 START ('2012-11-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201212 START ('2012-12-01 00:00:00') INCLUSIVE
		
		, PARTITION pdate_201301 START ('2013-01-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201302 START ('2013-02-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201303 START ('2013-03-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201304 START ('2013-04-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201305 START ('2013-05-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201306 START ('2013-06-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201307 START ('2013-07-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201308 START ('2013-08-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201309 START ('2013-09-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201310 START ('2013-10-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201311 START ('2013-11-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201312 START ('2013-12-01 00:00:00') INCLUSIVE
		
		, PARTITION pdate_201401 START ('2014-01-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201402 START ('2014-02-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201403 START ('2014-03-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201404 START ('2014-04-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201405 START ('2014-05-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201406 START ('2014-06-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201407 START ('2014-07-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201408 START ('2014-08-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201409 START ('2014-09-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201410 START ('2014-10-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201411 START ('2014-11-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201412 START ('2014-12-01 00:00:00') INCLUSIVE
		
		, PARTITION pdate_201501 START ('2015-01-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201502 START ('2015-02-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201503 START ('2015-03-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201504 START ('2015-04-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201505 START ('2015-05-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201506 START ('2015-06-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201507 START ('2015-07-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201508 START ('2015-08-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201509 START ('2015-09-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201510 START ('2015-10-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201511 START ('2015-11-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201512 START ('2015-12-01 00:00:00') INCLUSIVE
		
		, PARTITION pdate_201601 START ('2016-01-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201602 START ('2016-02-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201603 START ('2016-03-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201604 START ('2016-04-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201605 START ('2016-05-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201606 START ('2016-06-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201607 START ('2016-07-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201608 START ('2016-08-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201609 START ('2016-09-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201610 START ('2016-10-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201611 START ('2016-11-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201612 START ('2016-12-01 00:00:00') INCLUSIVE
		
		, PARTITION pdate_201701 START ('2017-01-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201702 START ('2017-02-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201703 START ('2017-03-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201704 START ('2017-04-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201705 START ('2017-05-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201706 START ('2017-06-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201707 START ('2017-07-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201708 START ('2017-08-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201709 START ('2017-09-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201710 START ('2017-10-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201711 START ('2017-11-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201712 START ('2017-12-01 00:00:00') INCLUSIVE
		
		, PARTITION pdate_201801 START ('2018-01-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201802 START ('2018-02-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201803 START ('2018-03-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201804 START ('2018-04-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201805 START ('2018-05-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201806 START ('2018-06-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201807 START ('2018-07-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201808 START ('2018-08-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201809 START ('2018-09-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201810 START ('2018-10-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201811 START ('2018-11-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201812 START ('2018-12-01 00:00:00') INCLUSIVE
		
		, PARTITION pdate_201901 START ('2019-01-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201902 START ('2019-02-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201903 START ('2019-03-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201904 START ('2019-04-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201905 START ('2019-05-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201906 START ('2019-06-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201907 START ('2019-07-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201908 START ('2019-08-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201909 START ('2019-09-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201910 START ('2019-10-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201911 START ('2019-11-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201912 START ('2019-12-01 00:00:00') INCLUSIVE
		
		, PARTITION pdate_202001 START ('2020-01-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202002 START ('2020-02-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202003 START ('2020-03-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202004 START ('2020-04-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202005 START ('2020-05-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202006 START ('2020-06-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202007 START ('2020-07-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202008 START ('2020-08-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202009 START ('2020-09-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202010 START ('2020-10-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202011 START ('2020-11-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202012 START ('2020-12-01 00:00:00') INCLUSIVE
		
		, PARTITION pdate_202101 START ('2021-01-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202102 START ('2021-02-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202103 START ('2021-03-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202104 START ('2021-04-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202105 START ('2021-05-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202106 START ('2021-06-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202107 START ('2021-07-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202108 START ('2021-08-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202109 START ('2021-09-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202110 START ('2021-10-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202111 START ('2021-11-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202112 START ('2021-12-01 00:00:00') INCLUSIVE
		
		, PARTITION pdate_202201 START ('2022-01-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202202 START ('2022-02-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202203 START ('2022-03-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202204 START ('2022-04-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202205 START ('2022-05-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202206 START ('2022-06-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202207 START ('2022-07-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202208 START ('2022-08-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202209 START ('2022-09-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202210 START ('2022-10-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202211 START ('2022-11-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202212 START ('2022-12-01 00:00:00') INCLUSIVE
		
		, DEFAULT PARTITION pdate_default
	)
;
ALTER TABLE "t_deal" OWNER TO "thinkman";

ALTER SEQUENCE "t_deal_id_seq1"
OWNED BY "t_deal"."id";
SELECT setval('"t_deal_id_seq1"', 76205828, true);

CREATE INDEX "idx_deal_create_time" ON "t_deal" USING btree (
  "create_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_deal_man" ON "t_deal" USING btree (
  "manager_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_deal_manager" ON "t_deal" USING btree (
  "man_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

CREATE TRIGGER "update_ab_changetimestamp" BEFORE UPDATE ON "t_deal"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_currenttimestamp_column"();

ALTER TABLE "t_deal" ADD CONSTRAINT "t_deal_pkey1" PRIMARY KEY ("id", "manager_id", "create_time");


DROP SEQUENCE IF EXISTS "t_deal_detail_id_seq";
CREATE SEQUENCE "t_deal_detail_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

DROP TABLE IF EXISTS "t_deal_detail";
CREATE TABLE "t_deal_detail" (
  "id" int8 NOT NULL DEFAULT nextval('t_deal_detail_id_seq'::regclass),
  "order_id" int8 NOT NULL,
  "menu_id" int8 NOT NULL,
  "girl_id" int8 NOT NULL,
  "price" numeric(10,2) NOT NULL,
  "create_time" timestamp(6) NOT NULL DEFAULT now(),
  "update_time" timestamp(6) NOT NULL DEFAULT now()
)
PARTITION BY RANGE(create_time) 
(
		  PARTITION pdate_201001 START ('2010-01-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201002 START ('2010-02-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201003 START ('2010-03-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201004 START ('2010-04-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201005 START ('2010-05-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201006 START ('2010-06-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201007 START ('2010-07-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201008 START ('2010-08-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201009 START ('2010-09-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201010 START ('2010-10-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201011 START ('2010-11-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201012 START ('2010-12-01 00:00:00') INCLUSIVE
		
		, PARTITION pdate_201101 START ('2011-01-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201102 START ('2011-02-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201103 START ('2011-03-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201104 START ('2011-04-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201105 START ('2011-05-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201106 START ('2011-06-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201107 START ('2011-07-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201108 START ('2011-08-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201109 START ('2011-09-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201110 START ('2011-10-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201111 START ('2011-11-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201112 START ('2011-12-01 00:00:00') INCLUSIVE
		
		, PARTITION pdate_201201 START ('2012-01-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201202 START ('2012-02-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201203 START ('2012-03-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201204 START ('2012-04-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201205 START ('2012-05-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201206 START ('2012-06-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201207 START ('2012-07-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201208 START ('2012-08-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201209 START ('2012-09-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201210 START ('2012-10-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201211 START ('2012-11-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201212 START ('2012-12-01 00:00:00') INCLUSIVE
		
		, PARTITION pdate_201301 START ('2013-01-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201302 START ('2013-02-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201303 START ('2013-03-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201304 START ('2013-04-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201305 START ('2013-05-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201306 START ('2013-06-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201307 START ('2013-07-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201308 START ('2013-08-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201309 START ('2013-09-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201310 START ('2013-10-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201311 START ('2013-11-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201312 START ('2013-12-01 00:00:00') INCLUSIVE
		
		, PARTITION pdate_201401 START ('2014-01-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201402 START ('2014-02-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201403 START ('2014-03-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201404 START ('2014-04-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201405 START ('2014-05-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201406 START ('2014-06-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201407 START ('2014-07-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201408 START ('2014-08-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201409 START ('2014-09-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201410 START ('2014-10-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201411 START ('2014-11-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201412 START ('2014-12-01 00:00:00') INCLUSIVE
		
		, PARTITION pdate_201501 START ('2015-01-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201502 START ('2015-02-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201503 START ('2015-03-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201504 START ('2015-04-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201505 START ('2015-05-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201506 START ('2015-06-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201507 START ('2015-07-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201508 START ('2015-08-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201509 START ('2015-09-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201510 START ('2015-10-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201511 START ('2015-11-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201512 START ('2015-12-01 00:00:00') INCLUSIVE
		
		, PARTITION pdate_201601 START ('2016-01-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201602 START ('2016-02-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201603 START ('2016-03-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201604 START ('2016-04-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201605 START ('2016-05-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201606 START ('2016-06-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201607 START ('2016-07-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201608 START ('2016-08-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201609 START ('2016-09-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201610 START ('2016-10-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201611 START ('2016-11-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201612 START ('2016-12-01 00:00:00') INCLUSIVE
		
		, PARTITION pdate_201701 START ('2017-01-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201702 START ('2017-02-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201703 START ('2017-03-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201704 START ('2017-04-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201705 START ('2017-05-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201706 START ('2017-06-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201707 START ('2017-07-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201708 START ('2017-08-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201709 START ('2017-09-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201710 START ('2017-10-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201711 START ('2017-11-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201712 START ('2017-12-01 00:00:00') INCLUSIVE
		
		, PARTITION pdate_201801 START ('2018-01-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201802 START ('2018-02-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201803 START ('2018-03-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201804 START ('2018-04-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201805 START ('2018-05-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201806 START ('2018-06-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201807 START ('2018-07-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201808 START ('2018-08-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201809 START ('2018-09-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201810 START ('2018-10-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201811 START ('2018-11-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201812 START ('2018-12-01 00:00:00') INCLUSIVE
		
		, PARTITION pdate_201901 START ('2019-01-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201902 START ('2019-02-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201903 START ('2019-03-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201904 START ('2019-04-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201905 START ('2019-05-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201906 START ('2019-06-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201907 START ('2019-07-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201908 START ('2019-08-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201909 START ('2019-09-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201910 START ('2019-10-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201911 START ('2019-11-01 00:00:00') INCLUSIVE
		, PARTITION pdate_201912 START ('2019-12-01 00:00:00') INCLUSIVE
		
		, PARTITION pdate_202001 START ('2020-01-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202002 START ('2020-02-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202003 START ('2020-03-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202004 START ('2020-04-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202005 START ('2020-05-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202006 START ('2020-06-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202007 START ('2020-07-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202008 START ('2020-08-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202009 START ('2020-09-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202010 START ('2020-10-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202011 START ('2020-11-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202012 START ('2020-12-01 00:00:00') INCLUSIVE
		
		, PARTITION pdate_202101 START ('2021-01-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202102 START ('2021-02-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202103 START ('2021-03-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202104 START ('2021-04-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202105 START ('2021-05-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202106 START ('2021-06-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202107 START ('2021-07-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202108 START ('2021-08-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202109 START ('2021-09-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202110 START ('2021-10-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202111 START ('2021-11-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202112 START ('2021-12-01 00:00:00') INCLUSIVE
		
		, PARTITION pdate_202201 START ('2022-01-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202202 START ('2022-02-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202203 START ('2022-03-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202204 START ('2022-04-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202205 START ('2022-05-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202206 START ('2022-06-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202207 START ('2022-07-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202208 START ('2022-08-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202209 START ('2022-09-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202210 START ('2022-10-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202211 START ('2022-11-01 00:00:00') INCLUSIVE
		, PARTITION pdate_202212 START ('2022-12-01 00:00:00') INCLUSIVE
		
		, DEFAULT PARTITION pdate_default
	)
;
ALTER TABLE "t_deal_detail" OWNER TO "thinkman";

CREATE INDEX "idx_detail_create_time" ON "t_deal_detail" USING btree (
  "create_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_detail_girl" ON "t_deal_detail" USING btree (
  "girl_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_detail_menu" ON "t_deal_detail" USING btree (
  "menu_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

CREATE TRIGGER "update_ab_changetimestamp" BEFORE UPDATE ON "t_deal_detail"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_currenttimestamp_column"();

-- ----------------------------
-- Primary Key structure for table t_deal_detail
-- ----------------------------
ALTER TABLE "t_deal_detail" ADD CONSTRAINT "t_deal_detail_pkey" PRIMARY KEY ("id", "create_time");
