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

 Date: 20/08/2020 18:26:25
*/

DROP SEQUENCE IF EXISTS "t_girls_id_seq";
CREATE SEQUENCE "t_girls_id_seq"
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 5000
CACHE 1;

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
-- Records of t_girls
-- ----------------------------
BEGIN;
INSERT INTO "t_girls" VALUES (1024, '俞凯', '2000-02-18', '2020-08-07 00:06:51', '2020-08-07 00:06:51');
INSERT INTO "t_girls" VALUES (1027, '雪丽', '1999-04-06', '2020-08-07 00:06:51', '2020-08-07 00:06:51');
INSERT INTO "t_girls" VALUES (1031, '俊誉', '1997-12-15', '2020-08-07 00:06:51', '2020-08-07 00:06:51');
INSERT INTO "t_girls" VALUES (1035, '军卿', '1998-08-12', '2020-08-07 00:06:51', '2020-08-07 00:06:51');
INSERT INTO "t_girls" VALUES (1036, '培安', '2003-11-16', '2020-08-07 00:06:51', '2020-08-07 00:06:51');
INSERT INTO "t_girls" VALUES (1042, '静香', '2005-07-02', '2020-08-07 00:06:51', '2020-08-07 00:06:51');
INSERT INTO "t_girls" VALUES (1044, '俊泽', '1999-08-20', '2020-08-07 00:06:51', '2020-08-07 00:06:51');
INSERT INTO "t_girls" VALUES (1045, '浩成', '1998-03-04', '2020-08-07 00:06:51', '2020-08-07 00:06:51');
INSERT INTO "t_girls" VALUES (1047, '雪怡', '2005-05-30', '2020-08-07 00:06:51', '2020-08-07 00:06:51');
INSERT INTO "t_girls" VALUES (1049, '宸赫', '2001-01-26', '2020-08-07 00:06:51', '2020-08-07 00:06:51');
INSERT INTO "t_girls" VALUES (1051, '墨含', '2001-01-01', '2020-08-07 00:06:51', '2020-08-07 00:06:51');
INSERT INTO "t_girls" VALUES (1063, '皓睿', '2000-11-18', '2020-08-07 00:06:51', '2020-08-07 00:06:51');
INSERT INTO "t_girls" VALUES (1064, '雨萌', '1999-03-30', '2020-08-07 00:06:51', '2020-08-07 00:06:51');
INSERT INTO "t_girls" VALUES (1066, '博豪', '2004-07-31', '2020-08-07 00:06:51', '2020-08-07 00:06:51');
INSERT INTO "t_girls" VALUES (1071, '钰彤', '2003-06-01', '2020-08-07 00:06:51', '2020-08-07 00:06:51');
INSERT INTO "t_girls" VALUES (1074, '月婵', '1998-10-11', '2020-08-07 00:06:51', '2020-08-07 00:06:51');
INSERT INTO "t_girls" VALUES (1083, '展博', '2000-06-03', '2020-08-07 00:06:51', '2020-08-07 00:06:51');
INSERT INTO "t_girls" VALUES (1098, '清凌', '2005-04-07', '2020-08-07 00:06:51', '2020-08-07 00:06:51');
INSERT INTO "t_girls" VALUES (1101, '俞凯', '2000-08-22', '2020-08-07 00:06:52', '2020-08-07 00:06:52');
INSERT INTO "t_girls" VALUES (1102, '海程', '2003-12-06', '2020-08-07 00:06:52', '2020-08-07 00:06:52');
INSERT INTO "t_girls" VALUES (1107, '俊誉', '1999-05-03', '2020-08-07 00:06:52', '2020-08-07 00:06:52');
INSERT INTO "t_girls" VALUES (1110, '泰霖', '1997-12-18', '2020-08-07 00:06:52', '2020-08-07 00:06:52');
INSERT INTO "t_girls" VALUES (1117, '芮涵', '1999-12-30', '2020-08-07 00:06:52', '2020-08-07 00:06:52');
INSERT INTO "t_girls" VALUES (1120, '伟菘', '2002-08-21', '2020-08-07 00:06:52', '2020-08-07 00:06:52');
INSERT INTO "t_girls" VALUES (1123, '博裕', '2001-08-28', '2020-08-07 00:06:52', '2020-08-07 00:06:52');
INSERT INTO "t_girls" VALUES (1127, '惠茜', '2002-03-03', '2020-08-07 00:06:52', '2020-08-07 00:06:52');
INSERT INTO "t_girls" VALUES (1129, '月松', '2002-02-23', '2020-08-07 00:06:52', '2020-08-07 00:06:52');
INSERT INTO "t_girls" VALUES (1133, '云哲', '1998-07-07', '2020-08-07 00:06:52', '2020-08-07 00:06:52');
INSERT INTO "t_girls" VALUES (1135, '萧然', '1998-02-06', '2020-08-07 00:06:52', '2020-08-07 00:06:52');
INSERT INTO "t_girls" VALUES (1138, '远帆', '2005-02-16', '2020-08-07 00:06:52', '2020-08-07 00:06:52');
COMMIT;

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
