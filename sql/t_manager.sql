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

 Date: 20/08/2020 18:26:51
*/


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
-- Records of t_manager
-- ----------------------------
BEGIN;
INSERT INTO "t_manager" VALUES (5002, '梦婷', '+375 (645) 259-9327', '2020-08-07 20:53:01.830163', '2020-08-07 20:53:01.830163');
INSERT INTO "t_manager" VALUES (5004, '奕漳', '+55 (517) 976-0915', '2020-08-07 20:53:01.830163', '2020-08-07 20:53:01.830163');
INSERT INTO "t_manager" VALUES (5009, '海程', '+82 (713) 633-5939', '2020-08-07 20:53:01.830163', '2020-08-07 20:53:01.830163');
INSERT INTO "t_manager" VALUES (5005, '龙胜', '+63 (865) 707-5302', '2020-08-07 20:53:01.830163', '2020-08-07 20:53:01.830163');
INSERT INTO "t_manager" VALUES (5008, '佐仪', '+62 (440) 778-4228', '2020-08-07 20:53:01.830163', '2020-08-07 20:53:01.830163');
INSERT INTO "t_manager" VALUES (5001, '羽彤', '+7 (871) 812-8187', '2020-08-07 20:53:01.830163', '2020-08-07 20:53:01.830163');
INSERT INTO "t_manager" VALUES (5003, '玺越', '+33 (159) 514-5695', '2020-08-07 20:53:01.830163', '2020-08-07 20:53:01.830163');
INSERT INTO "t_manager" VALUES (5006, '孜绍', '+86 (301) 723-8782', '2020-08-07 20:53:01.830163', '2020-08-07 20:53:01.830163');
INSERT INTO "t_manager" VALUES (5007, '伟宸', '+212 (711) 440-7694', '2020-08-07 20:53:01.830163', '2020-08-07 20:53:01.830163');
INSERT INTO "t_manager" VALUES (5010, '永鑫', '+355 (341) 502-7923', '2020-08-07 20:53:01.830163', '2020-08-07 20:53:01.830163');
COMMIT;

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
