/*
 Navicat Premium Data Transfer

 Source Server         : [内网]Synology Greenplum
 Source Server Type    : PostgreSQL
 Source Server Version : 90424
 Source Host           : 10.0.0.10:5532
 Source Catalog        : db_club
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 90424
 File Encoding         : 65001

 Date: 09/08/2020 02:29:52
*/


-- ----------------------------
-- Sequence structure for t_deal_detail_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "t_deal_detail_id_seq";
CREATE SEQUENCE "t_deal_detail_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_deal_id_seq1
-- ----------------------------
DROP SEQUENCE IF EXISTS "t_deal_id_seq1";
CREATE SEQUENCE "t_deal_id_seq1" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_girls_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "t_girls_id_seq";
CREATE SEQUENCE "t_girls_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_man_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "t_man_id_seq";
CREATE SEQUENCE "t_man_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_menu_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "t_menu_id_seq";
CREATE SEQUENCE "t_menu_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for t_deal
-- ----------------------------
DROP TABLE IF EXISTS "t_deal";
CREATE TABLE "t_deal" (
  "id" int8 NOT NULL DEFAULT nextval('t_deal_id_seq1'::regclass),
  "man_id" int8 NOT NULL,
  "manager_id" int8 NOT NULL,
  "create_time" timestamp(6) NOT NULL DEFAULT now(),
  "update_time" timestamp(6) NOT NULL DEFAULT now()
)
;
ALTER TABLE "t_deal" OWNER TO "thinkman";

-- ----------------------------
-- Table structure for t_deal_detail
-- ----------------------------
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
;
ALTER TABLE "t_deal_detail" OWNER TO "thinkman";

-- ----------------------------
-- Table structure for t_girl_menu_price
-- ----------------------------
DROP TABLE IF EXISTS "t_girl_menu_price";
CREATE TABLE "t_girl_menu_price" (
  "girl_id" int8 NOT NULL,
  "menu_id" int8 NOT NULL,
  "price" numeric(10,2) NOT NULL DEFAULT 0,
  "create_time" timestamp(6) NOT NULL DEFAULT now(),
  "update_time" timestamp(6) NOT NULL DEFAULT now()
)
;
ALTER TABLE "t_girl_menu_price" OWNER TO "thinkman";

-- ----------------------------
-- Table structure for t_girls
-- ----------------------------
DROP TABLE IF EXISTS "t_girls";
CREATE TABLE "t_girls" (
  "id" int8 NOT NULL DEFAULT nextval('t_girls_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "birthday" date NOT NULL,
  "create_time" timestamp(0) NOT NULL DEFAULT now(),
  "update_time" timestamp(0) NOT NULL DEFAULT now()
)
;
ALTER TABLE "t_girls" OWNER TO "thinkman";

-- ----------------------------
-- Table structure for t_man
-- ----------------------------
DROP TABLE IF EXISTS "t_man";
CREATE TABLE "t_man" (
  "id" int8 NOT NULL DEFAULT nextval('t_man_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "phone" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "create_time" timestamp(6) NOT NULL DEFAULT now(),
  "update_time" timestamp(6) NOT NULL DEFAULT now()
)
;
ALTER TABLE "t_man" OWNER TO "thinkman";

-- ----------------------------
-- Table structure for t_manager
-- ----------------------------
DROP TABLE IF EXISTS "t_manager";
CREATE TABLE "t_manager" (
  "id" int8 NOT NULL DEFAULT nextval('t_man_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "phone" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "create_time" timestamp(6) NOT NULL DEFAULT now(),
  "update_time" timestamp(6) NOT NULL DEFAULT now()
)
;
ALTER TABLE "t_manager" OWNER TO "thinkman";

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS "t_menu";
CREATE TABLE "t_menu" (
  "id" int8 NOT NULL DEFAULT nextval('t_menu_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "create_time" timestamp(6) NOT NULL DEFAULT now(),
  "update_time" timestamp(6) NOT NULL DEFAULT now()
)
;
ALTER TABLE "t_menu" OWNER TO "thinkman";

-- ----------------------------
-- Function structure for update_currenttimestamp_column
-- ----------------------------
DROP FUNCTION IF EXISTS "update_currenttimestamp_column"();
CREATE OR REPLACE FUNCTION "update_currenttimestamp_column"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
BEGIN
   NEW.update_time = now(); 
   RETURN NEW;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "t_deal_detail_id_seq"
OWNED BY "t_deal_detail"."id";
SELECT setval('"t_deal_detail_id_seq"', 1585466, true);
ALTER SEQUENCE "t_deal_id_seq1"
OWNED BY "t_deal"."id";
SELECT setval('"t_deal_id_seq1"', 76205862, true);
ALTER SEQUENCE "t_girls_id_seq"
OWNED BY "t_girls"."id";
SELECT setval('"t_girls_id_seq"', 2001, true);
ALTER SEQUENCE "t_man_id_seq"
OWNED BY "t_man"."id";
SELECT setval('"t_man_id_seq"', 5011, true);
ALTER SEQUENCE "t_menu_id_seq"
OWNED BY "t_menu"."id";
SELECT setval('"t_menu_id_seq"', 6, true);

-- ----------------------------
-- Indexes structure for table t_deal
-- ----------------------------
CREATE INDEX "idx_deal_create_time" ON "t_deal" USING btree (
  "create_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_deal_man" ON "t_deal" USING btree (
  "manager_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_deal_manager" ON "t_deal" USING btree (
  "man_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table t_deal
-- ----------------------------
CREATE TRIGGER "update_ab_changetimestamp" BEFORE UPDATE ON "t_deal"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_currenttimestamp_column"();

-- ----------------------------
-- Primary Key structure for table t_deal
-- ----------------------------
ALTER TABLE "t_deal" ADD CONSTRAINT "t_deal_pkey1" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table t_deal_detail
-- ----------------------------
CREATE INDEX "idx_detail_create_time" ON "t_deal_detail" USING btree (
  "create_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_detail_girl" ON "t_deal_detail" USING btree (
  "girl_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_detail_menu" ON "t_deal_detail" USING btree (
  "menu_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table t_deal_detail
-- ----------------------------
CREATE TRIGGER "update_ab_changetimestamp" BEFORE UPDATE ON "t_deal_detail"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_currenttimestamp_column"();

-- ----------------------------
-- Primary Key structure for table t_deal_detail
-- ----------------------------
ALTER TABLE "t_deal_detail" ADD CONSTRAINT "t_deal_detail_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Triggers structure for table t_girl_menu_price
-- ----------------------------
CREATE TRIGGER "update_ab_changetimestamp" BEFORE UPDATE ON "t_girl_menu_price"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_currenttimestamp_column"();

-- ----------------------------
-- Primary Key structure for table t_girl_menu_price
-- ----------------------------
ALTER TABLE "t_girl_menu_price" ADD CONSTRAINT "t_girl_menu_price_pkey" PRIMARY KEY ("girl_id", "menu_id");

-- ----------------------------
-- Triggers structure for table t_girls
-- ----------------------------
CREATE TRIGGER "update_timestamp" BEFORE UPDATE ON "t_girls"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_currenttimestamp_column"();

-- ----------------------------
-- Primary Key structure for table t_girls
-- ----------------------------
ALTER TABLE "t_girls" ADD CONSTRAINT "t_girls_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Triggers structure for table t_man
-- ----------------------------
CREATE TRIGGER "update_man_updatetime" BEFORE UPDATE ON "t_man"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_currenttimestamp_column"();

-- ----------------------------
-- Primary Key structure for table t_man
-- ----------------------------
ALTER TABLE "t_man" ADD CONSTRAINT "t_man_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Triggers structure for table t_manager
-- ----------------------------
CREATE TRIGGER "update_man_updatetime" BEFORE UPDATE ON "t_manager"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_currenttimestamp_column"();

-- ----------------------------
-- Primary Key structure for table t_manager
-- ----------------------------
ALTER TABLE "t_manager" ADD CONSTRAINT "t_man_copy1_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Triggers structure for table t_menu
-- ----------------------------
CREATE TRIGGER "update_menu_changetimestamp" BEFORE UPDATE ON "t_menu"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_currenttimestamp_column"();

-- ----------------------------
-- Primary Key structure for table t_menu
-- ----------------------------
ALTER TABLE "t_menu" ADD CONSTRAINT "t_menu_pkey" PRIMARY KEY ("id");
