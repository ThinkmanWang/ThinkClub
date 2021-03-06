/*
 Navicat Premium Data Transfer

 Source Server         : Synology Greenplum
 Source Server Type    : PostgreSQL
 Source Server Version : 90424
 Source Host           : thinkman-wang.uicp.io:52643
 Source Catalog        : db_club_plus
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 90424
 File Encoding         : 65001

 Date: 21/08/2020 11:41:04
*/


-- ----------------------------
-- Table structure for t_deal_detail
-- ----------------------------
DROP TABLE IF EXISTS "t_deal_detail";
CREATE TABLE "t_deal_detail" (
  "deal_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "menu_id" int8 NOT NULL,
  "girl_id" int8 NOT NULL,
  "price" numeric(10,2) NOT NULL,
  "create_time" timestamp(0) NOT NULL DEFAULT now(),
  "update_time" timestamp(0) NOT NULL DEFAULT now()
) PARTITION BY RANGE (create_time)
(
    START (timestamp '2010-01-01 00:00:00') INCLUSIVE
    END (timestamp '2031-01-01 00:00:00') EXCLUSIVE
    EVERY (INTERVAL '1 month')
);

ALTER TABLE "t_deal_detail" OWNER TO "thinkman";

-- ----------------------------
-- Indexes structure for table t_deal_detail
-- ----------------------------
CREATE INDEX "idx_deal_id" ON "public"."t_deal_detail" USING btree ("deal_id");
CREATE INDEX "idx_detail_create_time" ON "public"."t_deal_detail" USING btree ("create_time");
CREATE INDEX "idx_detail_girl" ON "public"."t_deal_detail" USING btree ("girl_id");
CREATE INDEX "idx_detail_menu" ON "public"."t_deal_detail" USING btree ("menu_id");

-- ----------------------------
-- Triggers structure for table t_deal_detail
-- ----------------------------
CREATE TRIGGER "update_ab_changetimestamp" BEFORE UPDATE ON "t_deal_detail"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_currenttimestamp_column"();

-- ----------------------------
-- Primary Key structure for table t_deal_detail
-- ----------------------------
CREATE UNIQUE INDEX "idx_detail_id" ON "public"."t_deal_detail" USING btree ("deal_id", "menu_id");