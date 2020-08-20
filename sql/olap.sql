CREATE TABLE olap."t_deal" (
  "id" int8 NOT NULL,
  "man_id" int8 NOT NULL,
  "man_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "manager_id" int8 NOT NULL,
  "manager_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "amount" numeric(10,2) NOT NULL,
  "create_time" timestamp(6) NOT NULL DEFAULT now(),
  "update_time" timestamp(6) NOT NULL DEFAULT now()
)
WITH (appendonly=true, orientation=column, compresstype=zlib, compresslevel=5)
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
  "menu_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "girl_id" int8 NOT NULL,
  "girl_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "price" numeric(10,2) NOT NULL,
  "create_time" timestamp(6) NOT NULL DEFAULT now(),
  "update_time" timestamp(6) NOT NULL DEFAULT now()
)
WITH (appendonly=true, orientation=column, compresstype=zlib, compresslevel=5)
PARTITION BY RANGE (create_time)
(
    START (timestamp '2010-01-01 00:00:00') INCLUSIVE
    END (timestamp '2031-01-01 00:00:00') EXCLUSIVE
    EVERY (INTERVAL '1 month')
);

CREATE OR REPLACE FUNCTION check_deal_id_pkey()
  RETURNS trigger
  LANGUAGE plpgsql
AS $$
BEGIN
  IF count(1) > 1 FROM olap.t_deal WHERE id = NEW.id THEN
    RAISE EXCEPTION 'duplicate key value violates unique constraint "%" ON "%"',
      TG_NAME, TG_TABLE_NAME
      USING DETAIL = format('Key (id)=(%s) already exists.', NEW.id);
  END IF;

  RETURN NULL;
END
$$;

CREATE OR REPLACE FUNCTION check_deal_detail_id_pkey()
  RETURNS trigger
  LANGUAGE plpgsql
AS $$
BEGIN
  IF count(1) > 1 FROM olap.t_deal_detail WHERE id = NEW.id THEN
    RAISE EXCEPTION 'duplicate key value violates unique constraint "%" ON "%"',
      TG_NAME, TG_TABLE_NAME
      USING DETAIL = format('Key (id)=(%s) already exists.', NEW.id);
  END IF;

  RETURN NULL;
END
$$;

CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal            FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_1    FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_2    FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_3    FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_4    FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_5    FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_6    FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_7    FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_8    FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_9    FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_10   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_11   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_12   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_13   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_14   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_15   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_16   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_17   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_18   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_19   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_20   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_21   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_22   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_23   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_24   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_25   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_26   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_27   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_28   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_29   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_30   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_31   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_32   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_33   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_34   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_35   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_36   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_37   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_38   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_39   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_40   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_41   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_42   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_43   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_44   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_45   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_46   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_47   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_48   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_49   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_50   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_51   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_52   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_53   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_54   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_55   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_56   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_57   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_58   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_59   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_60   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_61   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_62   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_63   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_64   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_65   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_66   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_67   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_68   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_69   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_70   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_71   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_72   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_73   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_74   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_75   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_76   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_77   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_78   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_79   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_80   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_81   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_82   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_83   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_84   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_85   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_86   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_87   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_88   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_89   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_90   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_91   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_92   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_93   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_94   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_95   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_96   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_97   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_98   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_99   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_100  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_101  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_102  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_103  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_104  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_105  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_106  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_107  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_108  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_109  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_110  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_111  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_112  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_113  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_114  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_115  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_116  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_117  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_118  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_119  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_120  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_121  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_122  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_123  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_124  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_125  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_126  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_127  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_128  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_129  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_130  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_131  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_132  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_133  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_134  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_135  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_136  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_137  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_138  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_139  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_140  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_141  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_142  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_143  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_144  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_145  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_146  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_147  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_148  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_149  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_150  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_151  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_152  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_153  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_154  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_155  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_156  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_157  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_158  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_159  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_160  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_161  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_162  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_163  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_164  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_165  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_166  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_167  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_168  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_169  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_170  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_171  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_172  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_173  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_174  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_175  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_176  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_177  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_178  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_179  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_180  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_181  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_182  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_183  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_184  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_185  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_186  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_187  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_188  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_189  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_190  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_191  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_192  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_193  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_194  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_195  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_196  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_197  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_198  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_199  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_200  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_201  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_202  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_203  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_204  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_205  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_206  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_207  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_208  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_209  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_210  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_211  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_212  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_213  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_214  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_215  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_216  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_217  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_218  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_219  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_220  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_221  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_222  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_223  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_224  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_225  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_226  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_227  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_228  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_229  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_230  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_231  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_232  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_233  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_234  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_235  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_236  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_237  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_238  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_239  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_240  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_241  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_242  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_243  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_244  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_245  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_246  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_247  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_248  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_249  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_250  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_251  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();
CREATE TRIGGER deal_id_pkey AFTER INSERT ON olap.t_deal_1_prt_252  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_id_pkey();


CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail           FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_1   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_2   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_3   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_4   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_5   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_6   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_7   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_8   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_9   FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_10  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_11  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_12  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_13  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_14  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_15  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_16  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_17  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_18  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_19  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_20  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_21  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_22  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_23  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_24  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_25  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_26  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_27  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_28  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_29  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_30  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_31  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_32  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_33  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_34  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_35  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_36  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_37  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_38  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_39  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_40  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_41  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_42  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_43  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_44  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_45  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_46  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_47  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_48  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_49  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_50  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_51  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_52  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_53  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_54  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_55  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_56  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_57  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_58  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_59  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_60  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_61  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_62  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_63  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_64  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_65  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_66  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_67  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_68  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_69  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_70  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_71  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_72  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_73  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_74  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_75  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_76  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_77  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_78  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_79  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_80  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_81  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_82  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_83  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_84  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_85  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_86  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_87  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_88  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_89  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_90  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_91  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_92  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_93  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_94  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_95  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_96  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_97  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_98  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_99  FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_100 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_101 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_102 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_103 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_104 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_105 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_106 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_107 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_108 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_109 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_110 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_111 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_112 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_113 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_114 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_115 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_116 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_117 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_118 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_119 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_120 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_121 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_122 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_123 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_124 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_125 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_126 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_127 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_128 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_129 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_130 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_131 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_132 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_133 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_134 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_135 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_136 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_137 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_138 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_139 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_140 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_141 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_142 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_143 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_144 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_145 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_146 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_147 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_148 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_149 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_150 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_151 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_152 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_153 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_154 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_155 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_156 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_157 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_158 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_159 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_160 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_161 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_162 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_163 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_164 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_165 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_166 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_167 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_168 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_169 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_170 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_171 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_172 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_173 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_174 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_175 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_176 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_177 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_178 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_179 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_180 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_181 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_182 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_183 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_184 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_185 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_186 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_187 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_188 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_189 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_190 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_191 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_192 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_193 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_194 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_195 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_196 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_197 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_198 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_199 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_200 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_201 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_202 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_203 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_204 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_205 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_206 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_207 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_208 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_209 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_210 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_211 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_212 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_213 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_214 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_215 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_216 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_217 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_218 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_219 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_220 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_221 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_222 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_223 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_224 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_225 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_226 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_227 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_228 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_229 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_230 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_231 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_232 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_233 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_234 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_235 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_236 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_237 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_238 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_239 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_240 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_241 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_242 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_243 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_244 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_245 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_246 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_247 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_248 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_249 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_250 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_251 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();
CREATE TRIGGER detail_id_pkey AFTER INSERT ON olap.t_deal_detail_1_prt_252 FOR EACH ROW EXECUTE PROCEDURE public.check_deal_detail_id_pkey();