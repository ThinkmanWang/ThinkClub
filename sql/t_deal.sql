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

 Date: 20/08/2020 18:25:50
*/


-- ----------------------------
-- Table structure for t_deal
-- ----------------------------
DROP TABLE IF EXISTS "t_deal";
CREATE TABLE "t_deal" (
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "man_id" int8 NOT NULL,
  "manager_id" int8 NOT NULL,
  "create_time" timestamp(6) NOT NULL DEFAULT now(),
  "update_time" timestamp(6) NOT NULL DEFAULT now()
)
;
ALTER TABLE "t_deal" OWNER TO "thinkman";

-- ----------------------------
-- Indexes structure for table t_deal
-- ----------------------------
CREATE INDEX "idx_deal_create_time" ON "t_deal" USING btree (
  "create_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_deal_man" ON "t_deal" USING btree (
  "man_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_deal_manager" ON "t_deal" USING btree (
  "manager_id" "pg_catalog"."int8_ops" ASC NULLS LAST
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
ALTER TABLE "t_deal" ADD CONSTRAINT "t_deal_pkey" PRIMARY KEY ("id");
