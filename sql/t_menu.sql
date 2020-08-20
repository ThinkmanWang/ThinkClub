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

 Date: 20/08/2020 18:27:03
*/


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
-- Records of t_menu
-- ----------------------------
BEGIN;
INSERT INTO "t_menu" VALUES (4, '采耳', '2020-08-07 13:07:04.348334', '2020-08-07 13:07:04.348334');
INSERT INTO "t_menu" VALUES (3, '按摩', '2020-08-07 13:07:00.327548', '2020-08-07 13:07:38.460426');
INSERT INTO "t_menu" VALUES (1, '洗澡', '2020-08-07 13:06:45.017662', '2020-08-07 13:06:45.017662');
INSERT INTO "t_menu" VALUES (5, '肾保健', '2020-08-07 13:07:18.045817', '2020-08-07 13:07:18.045817');
INSERT INTO "t_menu" VALUES (2, '足疗', '2020-08-07 13:06:50.978028', '2020-08-09 22:05:24.404986');
COMMIT;

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
