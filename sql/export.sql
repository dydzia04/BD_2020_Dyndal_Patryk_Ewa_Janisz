--------------------------------------------------------
--  File created - pi¹tek-czerwca-19-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table POZWOLENIA
--------------------------------------------------------

  CREATE TABLE "ADMIN"."POZWOLENIA" 
   (	"ID_POZWOLENIA" RAW(16) DEFAULT SYS_GUID(), 
	"NAZWA" VARCHAR2(128 BYTE), 
	"CREATE_ISSUE" NUMBER(1,0), 
	"EDIT_OWN_ISSUE" NUMBER(1,0), 
	"DELETE_OWN_ISSUE" NUMBER(1,0), 
	"EDIT_ANY_ISSUE" NUMBER(1,0), 
	"DELETE_ANY_ISSUE" NUMBER(1,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PRIORITET
--------------------------------------------------------

  CREATE TABLE "ADMIN"."PRIORITET" 
   (	"ID_PRIORITET" RAW(16) DEFAULT SYS_GUID(), 
	"TYP" VARCHAR2(254 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PROJEKT
--------------------------------------------------------

  CREATE TABLE "ADMIN"."PROJEKT" 
   (	"ID_PROJEKTU" RAW(16) DEFAULT SYS_GUID(), 
	"OPIS" VARCHAR2(254 BYTE), 
	"CZAS_MODYFIKACJI" TIMESTAMP (6) DEFAULT CURRENT_TIMESTAMP
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ROLE
--------------------------------------------------------

  CREATE TABLE "ADMIN"."ROLE" 
   (	"ID_UZYTKOWNIKA" RAW(16), 
	"ID_POZWOLENIA" RAW(16)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TYP_ZGLOSZENIA
--------------------------------------------------------

  CREATE TABLE "ADMIN"."TYP_ZGLOSZENIA" 
   (	"ID_TYP" RAW(16) DEFAULT SYS_GUID(), 
	"NAZWA" VARCHAR2(254 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table UTWORZONE
--------------------------------------------------------

  CREATE TABLE "ADMIN"."UTWORZONE" 
   (	"ID_UTWORZONE" RAW(16) DEFAULT SYS_GUID(), 
	"ID_UZYTKOWNIKA" RAW(16), 
	"CZAS_UTWORZENIA" TIMESTAMP (6) DEFAULT CURRENT_TIMESTAMP
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table UZYTKOWNIK
--------------------------------------------------------

  CREATE TABLE "ADMIN"."UZYTKOWNIK" 
   (	"ID_UZYTKOWNIKA" RAW(16) DEFAULT SYS_GUID(), 
	"IMIE_NAZWISKO" VARCHAR2(64 BYTE), 
	"NAZWA_WYSWIETLANA" VARCHAR2(32 BYTE), 
	"EMAIL" VARCHAR2(254 BYTE), 
	"ZEZWOL_NA_POWIADOMIENIA_EMAIL" NUMBER(1,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ZAMKNIETE
--------------------------------------------------------

  CREATE TABLE "ADMIN"."ZAMKNIETE" 
   (	"ID_ZAMKNIETE" RAW(16) DEFAULT SYS_GUID(), 
	"ID_UZYTKOWNIKA" RAW(16), 
	"CZAS_ZAMKNIECIA" TIMESTAMP (6) DEFAULT CURRENT_TIMESTAMP
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ZARZADZANIE_PROJEKTEM
--------------------------------------------------------

  CREATE TABLE "ADMIN"."ZARZADZANIE_PROJEKTEM" 
   (	"ID_PROJEKTU" RAW(16), 
	"ID_UZYTKOWNIKA" RAW(16)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ZGLOSZENIA
--------------------------------------------------------

  CREATE TABLE "ADMIN"."ZGLOSZENIA" 
   (	"ID_ZGLOSZENIA" RAW(16) DEFAULT SYS_GUID(), 
	"TYTUL" VARCHAR2(64 BYTE), 
	"OPIS" VARCHAR2(254 BYTE), 
	"ID_TYP" RAW(16), 
	"ID_PRIORITET" RAW(16), 
	"ID_UTWORZONE" RAW(16), 
	"ID_ZAMKNIETE" RAW(16), 
	"PODSUMOWANIE" VARCHAR2(254 BYTE), 
	"ID_PROJEKTU" RAW(16)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
REM INSERTING into ADMIN.POZWOLENIA
SET DEFINE OFF;
Insert into ADMIN.POZWOLENIA (ID_POZWOLENIA,NAZWA,CREATE_ISSUE,EDIT_OWN_ISSUE,DELETE_OWN_ISSUE,EDIT_ANY_ISSUE,DELETE_ANY_ISSUE) values ('EB0D0ED02A4D49A0A01970F561FBA3C3','Admin','1','1','1','1','1');
Insert into ADMIN.POZWOLENIA (ID_POZWOLENIA,NAZWA,CREATE_ISSUE,EDIT_OWN_ISSUE,DELETE_OWN_ISSUE,EDIT_ANY_ISSUE,DELETE_ANY_ISSUE) values ('B3E765AD4E5E444EACE4347B4EB25DB3','Shadow_Admin','0','0','0','1','1');
Insert into ADMIN.POZWOLENIA (ID_POZWOLENIA,NAZWA,CREATE_ISSUE,EDIT_OWN_ISSUE,DELETE_OWN_ISSUE,EDIT_ANY_ISSUE,DELETE_ANY_ISSUE) values ('6A35381CE7644835AAEABDA0E2F27059','User','1','1','1','0','0');
REM INSERTING into ADMIN.PRIORITET
SET DEFINE OFF;
Insert into ADMIN.PRIORITET (ID_PRIORITET,TYP) values ('9171C86110CE47C68A451B344BA77E70','Niski');
Insert into ADMIN.PRIORITET (ID_PRIORITET,TYP) values ('A2A135B1B2AC4BEFA92A4F9FEF64FB92','Œredni');
Insert into ADMIN.PRIORITET (ID_PRIORITET,TYP) values ('C077EB8EDB0F46D8A35A53BD058A85A2','Wysoki');
Insert into ADMIN.PRIORITET (ID_PRIORITET,TYP) values ('41F1CFB87CCB4F6A82D44BD12CD74EB7','Krytyczny');
REM INSERTING into ADMIN.PROJEKT
SET DEFINE OFF;
Insert into ADMIN.PROJEKT (ID_PROJEKTU,OPIS,CZAS_MODYFIKACJI) values ('8D525AC978184F2BBF417E472755511B','TEST',to_timestamp('20/06/18 23:39:55,770000000','RR/MM/DD HH24:MI:SSXFF'));
REM INSERTING into ADMIN.ROLE
SET DEFINE OFF;
REM INSERTING into ADMIN.TYP_ZGLOSZENIA
SET DEFINE OFF;
Insert into ADMIN.TYP_ZGLOSZENIA (ID_TYP,NAZWA) values ('0D72FA56B54443D884B785C10FD1AA09','Bug');
Insert into ADMIN.TYP_ZGLOSZENIA (ID_TYP,NAZWA) values ('87872A2EC824483F80D2F5FEED0CD9D6','Poprawka');
Insert into ADMIN.TYP_ZGLOSZENIA (ID_TYP,NAZWA) values ('40C6A854D1484AC5B6059BBA7C97F2FD','Nowa funkcjonalnoœæ');
REM INSERTING into ADMIN.UTWORZONE
SET DEFINE OFF;
REM INSERTING into ADMIN.UZYTKOWNIK
SET DEFINE OFF;
Insert into ADMIN.UZYTKOWNIK (ID_UZYTKOWNIKA,IMIE_NAZWISKO,NAZWA_WYSWIETLANA,EMAIL,ZEZWOL_NA_POWIADOMIENIA_EMAIL) values ('A2A67329E58C4EA2A60A1510ABE8CAB0','Patryk Dyndal','PDyndal','PDyndal@example.com','1');
Insert into ADMIN.UZYTKOWNIK (ID_UZYTKOWNIKA,IMIE_NAZWISKO,NAZWA_WYSWIETLANA,EMAIL,ZEZWOL_NA_POWIADOMIENIA_EMAIL) values ('034EC3C5089C40B9B7C0E08A77A7533C','Ewa Janisz','EJanisz','EJanisz@example.com','0');
Insert into ADMIN.UZYTKOWNIK (ID_UZYTKOWNIKA,IMIE_NAZWISKO,NAZWA_WYSWIETLANA,EMAIL,ZEZWOL_NA_POWIADOMIENIA_EMAIL) values ('0884F81212E2456E96C105C8FC3F06B5','Example User','User','User@example.com','1');
Insert into ADMIN.UZYTKOWNIK (ID_UZYTKOWNIKA,IMIE_NAZWISKO,NAZWA_WYSWIETLANA,EMAIL,ZEZWOL_NA_POWIADOMIENIA_EMAIL) values ('1E6BF0188C284CB6B06198014DD30CC4','Shadow Admin','Shadow','Shadow@example.com','1');
REM INSERTING into ADMIN.ZAMKNIETE
SET DEFINE OFF;
REM INSERTING into ADMIN.ZARZADZANIE_PROJEKTEM
SET DEFINE OFF;
REM INSERTING into ADMIN.ZGLOSZENIA
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index PK_POZWOLENIA
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADMIN"."PK_POZWOLENIA" ON "ADMIN"."POZWOLENIA" ("ID_POZWOLENIA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_PRIORITET
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADMIN"."PK_PRIORITET" ON "ADMIN"."PRIORITET" ("ID_PRIORITET") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_PROJEKTU
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADMIN"."PK_PROJEKTU" ON "ADMIN"."PROJEKT" ("ID_PROJEKTU") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_TYP
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADMIN"."PK_TYP" ON "ADMIN"."TYP_ZGLOSZENIA" ("ID_TYP") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_UZYTKOWNIKA
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADMIN"."PK_UZYTKOWNIKA" ON "ADMIN"."UZYTKOWNIK" ("ID_UZYTKOWNIKA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Procedure ADD_CLOSE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "ADMIN"."ADD_CLOSE" (
    p_id_uzytkownika    IN zamkniete.id_uzytkownika%TYPE,
    p_id_zgloszenia     IN zgloszenia.id_zgloszenia%TYPE
)
IS

    p_id_zamkniecia RAW(16) := SYS_GUID();

BEGIN

    INSERT INTO ZAMKNIETE ( "ID_ZAMKNIETE", "ID_UZYTKOWNIKA" ) 
    VALUES ( p_id_zamkniecia, p_id_uzytkownika );

    UPDATE zgloszenia SET id_zamkniete=p_id_zamkniecia WHERE id_zgloszenia=p_id_zgloszenia;

    COMMIT;
END;

/
--------------------------------------------------------
--  DDL for Procedure ADD_ISSUE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "ADMIN"."ADD_ISSUE" (
    p_tytul             IN zgloszenia.tytul%TYPE,
    p_opis              IN zgloszenia.opis%TYPE,
    p_typ               IN typ_zgloszenia.nazwa%TYPE,
    p_prioritet         IN prioritet.typ%TYPE,
    p_podsumowanie      IN zgloszenia.podsumowanie%TYPE,
    p_id_projektu       IN zgloszenia.id_projektu%TYPE,
    p_id_uzytkownika    IN uzytkownik.id_uzytkownika%TYPE
)
IS

    p_id_zgloszenia RAW(16) := SYS_GUID();
    p_id_utworzenia RAW(16) := SYS_GUID();
    p_id_typu       typ_zgloszenia.id_typ%TYPE;
    p_id_prioritetu prioritet.id_prioritet%TYPE;

BEGIN

    SELECT ID_TYP INTO p_id_typu FROM typ_zgloszenia WHERE NAZWA=p_typ;

    SELECT ID_PRIORITET INTO p_id_prioritetu FROM prioritet WHERE TYP=p_prioritet;

    INSERT INTO UTWORZONE ( "ID_UTWORZONE", "ID_UZYTKOWNIKA" ) 
    VALUES ( p_id_utworzenia, p_id_uzytkownika );

    INSERT INTO ZGLOSZENIA ( "ID_ZGLOSZENIA", "TYTUL", "OPIS", "ID_TYP", "ID_PRIORITET", "ID_UTWORZONE", "PODSUMOWANIE", "ID_PROJEKTU" )
    VALUES ( p_id_zgloszenia, p_tytul, p_opis, p_id_typu, p_id_prioritetu, p_id_utworzenia, p_podsumowanie, p_id_projektu );

    COMMIT;
END;

/
--------------------------------------------------------
--  DDL for Procedure ADD_PROJECT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "ADMIN"."ADD_PROJECT" (
    p_opis                          IN projekt.opis%TYPE,
    p_czas_modyfikacji              IN projekt.czas_modyfikacji%TYPE,
    p_id_uzytkownika                IN uzytkownik.id_uzytkownika%TYPE
)
IS
        p_id_projektu RAW(16) := SYS_GUID();

BEGIN
    INSERT INTO PROJEKT ( "ID_PROJEKTU", "OPIS", "CZAS_MODYFIKACJI" ) 
    VALUES ( p_id_projektu, p_opis, p_czas_modyfikacji );

    INSERT INTO ZARZADZANIE_PROJEKTEM ( "ID_PROJEKTU", "ID_UZYTKOWNIKA" )
    VALUES ( p_id_projektu, p_id_uzytkownika );

    COMMIT;
END;


/
--------------------------------------------------------
--  DDL for Procedure ADD_USER
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "ADMIN"."ADD_USER" (
    p_imie_nazwisko             IN uzytkownik.imie_nazwisko%TYPE,
    p_nazwa_wyswietlana         IN uzytkownik.nazwa_wyswietlana%TYPE,
    p_email                     IN uzytkownik.email%TYPE,
    p_zezwol_na_powiadomienia   IN uzytkownik.zezwol_na_powiadomienia_email%TYPE
)
IS

BEGIN
    INSERT INTO UZYTKOWNIK ( "ID_UZYTKOWNIKA", "IMIE_NAZWISKO", "NAZWA_WYSWIETLANA", "EMAIL", "ZEZWOL_NA_POWIADOMIENIA_EMAIL" ) 
    VALUES ( SYS_GUID(), p_imie_nazwisko, p_nazwa_wyswietlana, p_email, p_zezwol_na_powiadomienia );

    COMMIT;
END;

/
--------------------------------------------------------
--  DDL for Procedure EDIT_ISSUES_OPIS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "ADMIN"."EDIT_ISSUES_OPIS" (
    p_id_zgloszenia    IN zgloszenia.id_zgloszenia%TYPE,
    p_opis            IN zgloszenia.opis%TYPE
)
IS

BEGIN

    UPDATE zgloszenia SET opis=p_opis WHERE id_zgloszenia=p_id_zgloszenia;

    COMMIT;
END;

/
--------------------------------------------------------
--  DDL for Procedure EDIT_ISSUES_PODSUMOWANIE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "ADMIN"."EDIT_ISSUES_PODSUMOWANIE" (
    p_id_zgloszenia    IN zgloszenia.id_zgloszenia%TYPE,
    p_typ            IN prioritet.typ%TYPE
)
IS

    p_id_prioritet prioritet.typ%TYPE;

BEGIN

    SELECT id_prioritet INTO p_id_prioritet FROM prioritet WHERE typ=p_typ;

    UPDATE zgloszenia SET id_prioritet=p_id_prioritet WHERE id_zgloszenia=p_id_zgloszenia;

    COMMIT;
END;

/
--------------------------------------------------------
--  DDL for Procedure EDIT_ISSUES_TYTUL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "ADMIN"."EDIT_ISSUES_TYTUL" (
    p_id_zgloszenia    IN zgloszenia.id_zgloszenia%TYPE,
    p_tytul            IN zgloszenia.tytul%TYPE
)
IS

BEGIN

    UPDATE zgloszenia SET tytul=p_tytul WHERE id_zgloszenia=p_id_zgloszenia;

    COMMIT;
END;

/
--------------------------------------------------------
--  DDL for Procedure EDIT_PROJECT_OPIS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "ADMIN"."EDIT_PROJECT_OPIS" (
    p_id_projektu    IN projekt.id_projektu%TYPE,
    p_opis           IN projekt.opis%TYPE
)
IS

BEGIN

    UPDATE projekt SET opis=p_opis WHERE id_projektu=p_id_projektu;

    COMMIT;
END;

/
--------------------------------------------------------
--  DDL for Procedure EDIT_USER_EMAIL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "ADMIN"."EDIT_USER_EMAIL" (
    p_id_uzytkownika    IN uzytkownik.id_uzytkownika%TYPE,
    p_email IN uzytkownik.email%TYPE
)
IS

BEGIN

    UPDATE uzytkownik SET email=p_email WHERE id_uzytkownika=p_id_uzytkownika;

    COMMIT;
END;

/
--------------------------------------------------------
--  DDL for Procedure EDIT_USER_EMAIL_NEWSLETTER
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "ADMIN"."EDIT_USER_EMAIL_NEWSLETTER" (
    p_id_uzytkownika    IN uzytkownik.id_uzytkownika%TYPE,
    p_zezwol            IN uzytkownik.zezwol_na_powiadomienia_email%TYPE
)
IS

BEGIN

    UPDATE uzytkownik SET zezwol_na_powiadomienia_email=p_zezwol WHERE id_uzytkownika=p_id_uzytkownika;

    COMMIT;
END;

/
--------------------------------------------------------
--  DDL for Procedure EDIT_USER_IMIE_NAZWISKO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "ADMIN"."EDIT_USER_IMIE_NAZWISKO" (
    p_id_uzytkownika    IN uzytkownik.id_uzytkownika%TYPE,
    p_imie_nazwisko  IN uzytkownik.imie_nazwisko%TYPE
)
IS

BEGIN

    UPDATE uzytkownik SET imie_nazwisko=p_imie_nazwisko WHERE id_uzytkownika=p_id_uzytkownika;

    COMMIT;
END;

/
--------------------------------------------------------
--  DDL for Procedure EDIT_USER_NAZWA_WYSWIETLANA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "ADMIN"."EDIT_USER_NAZWA_WYSWIETLANA" (
    p_id_uzytkownika    IN uzytkownik.id_uzytkownika%TYPE,
    p_nazwa_wyswietlana  IN uzytkownik.nazwa_wyswietlana%TYPE
)
IS

BEGIN

    UPDATE uzytkownik SET nazwa_wyswietlana=p_nazwa_wyswietlana WHERE id_uzytkownika=p_id_uzytkownika;

    COMMIT;
END;

/
--------------------------------------------------------
--  Constraints for Table UZYTKOWNIK
--------------------------------------------------------

  ALTER TABLE "ADMIN"."UZYTKOWNIK" MODIFY ("IMIE_NAZWISKO" NOT NULL ENABLE);
  ALTER TABLE "ADMIN"."UZYTKOWNIK" MODIFY ("NAZWA_WYSWIETLANA" NOT NULL ENABLE);
  ALTER TABLE "ADMIN"."UZYTKOWNIK" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "ADMIN"."UZYTKOWNIK" MODIFY ("ZEZWOL_NA_POWIADOMIENIA_EMAIL" NOT NULL ENABLE);
  ALTER TABLE "ADMIN"."UZYTKOWNIK" ADD UNIQUE ("NAZWA_WYSWIETLANA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "ADMIN"."UZYTKOWNIK" ADD CONSTRAINT "PK_UZYTKOWNIKA" PRIMARY KEY ("ID_UZYTKOWNIKA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ROLE
--------------------------------------------------------

  ALTER TABLE "ADMIN"."ROLE" MODIFY ("ID_UZYTKOWNIKA" NOT NULL ENABLE);
  ALTER TABLE "ADMIN"."ROLE" MODIFY ("ID_POZWOLENIA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table POZWOLENIA
--------------------------------------------------------

  ALTER TABLE "ADMIN"."POZWOLENIA" MODIFY ("NAZWA" NOT NULL ENABLE);
  ALTER TABLE "ADMIN"."POZWOLENIA" MODIFY ("CREATE_ISSUE" NOT NULL ENABLE);
  ALTER TABLE "ADMIN"."POZWOLENIA" MODIFY ("EDIT_OWN_ISSUE" NOT NULL ENABLE);
  ALTER TABLE "ADMIN"."POZWOLENIA" MODIFY ("DELETE_OWN_ISSUE" NOT NULL ENABLE);
  ALTER TABLE "ADMIN"."POZWOLENIA" MODIFY ("EDIT_ANY_ISSUE" NOT NULL ENABLE);
  ALTER TABLE "ADMIN"."POZWOLENIA" MODIFY ("DELETE_ANY_ISSUE" NOT NULL ENABLE);
  ALTER TABLE "ADMIN"."POZWOLENIA" ADD UNIQUE ("NAZWA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "ADMIN"."POZWOLENIA" ADD CONSTRAINT "PK_POZWOLENIA" PRIMARY KEY ("ID_POZWOLENIA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ZARZADZANIE_PROJEKTEM
--------------------------------------------------------

  ALTER TABLE "ADMIN"."ZARZADZANIE_PROJEKTEM" MODIFY ("ID_PROJEKTU" NOT NULL ENABLE);
  ALTER TABLE "ADMIN"."ZARZADZANIE_PROJEKTEM" MODIFY ("ID_UZYTKOWNIKA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table UTWORZONE
--------------------------------------------------------

  ALTER TABLE "ADMIN"."UTWORZONE" MODIFY ("ID_UZYTKOWNIKA" NOT NULL ENABLE);
  ALTER TABLE "ADMIN"."UTWORZONE" MODIFY ("CZAS_UTWORZENIA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TYP_ZGLOSZENIA
--------------------------------------------------------

  ALTER TABLE "ADMIN"."TYP_ZGLOSZENIA" MODIFY ("NAZWA" NOT NULL ENABLE);
  ALTER TABLE "ADMIN"."TYP_ZGLOSZENIA" ADD CONSTRAINT "PK_TYP" PRIMARY KEY ("ID_TYP")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ZAMKNIETE
--------------------------------------------------------

  ALTER TABLE "ADMIN"."ZAMKNIETE" MODIFY ("ID_UZYTKOWNIKA" NOT NULL ENABLE);
  ALTER TABLE "ADMIN"."ZAMKNIETE" MODIFY ("CZAS_ZAMKNIECIA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PROJEKT
--------------------------------------------------------

  ALTER TABLE "ADMIN"."PROJEKT" MODIFY ("OPIS" NOT NULL ENABLE);
  ALTER TABLE "ADMIN"."PROJEKT" MODIFY ("CZAS_MODYFIKACJI" NOT NULL ENABLE);
  ALTER TABLE "ADMIN"."PROJEKT" ADD CONSTRAINT "PK_PROJEKTU" PRIMARY KEY ("ID_PROJEKTU")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ZGLOSZENIA
--------------------------------------------------------

  ALTER TABLE "ADMIN"."ZGLOSZENIA" MODIFY ("TYTUL" NOT NULL ENABLE);
  ALTER TABLE "ADMIN"."ZGLOSZENIA" MODIFY ("OPIS" NOT NULL ENABLE);
  ALTER TABLE "ADMIN"."ZGLOSZENIA" MODIFY ("ID_TYP" NOT NULL ENABLE);
  ALTER TABLE "ADMIN"."ZGLOSZENIA" MODIFY ("ID_PRIORITET" NOT NULL ENABLE);
  ALTER TABLE "ADMIN"."ZGLOSZENIA" MODIFY ("PODSUMOWANIE" NOT NULL ENABLE);
  ALTER TABLE "ADMIN"."ZGLOSZENIA" MODIFY ("ID_PROJEKTU" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PRIORITET
--------------------------------------------------------

  ALTER TABLE "ADMIN"."PRIORITET" MODIFY ("TYP" NOT NULL ENABLE);
  ALTER TABLE "ADMIN"."PRIORITET" ADD CONSTRAINT "PK_PRIORITET" PRIMARY KEY ("ID_PRIORITET")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ROLE
--------------------------------------------------------

  ALTER TABLE "ADMIN"."ROLE" ADD CONSTRAINT "FK_UZYTKOWNIKA" FOREIGN KEY ("ID_UZYTKOWNIKA")
	  REFERENCES "ADMIN"."UZYTKOWNIK" ("ID_UZYTKOWNIKA") ENABLE;
  ALTER TABLE "ADMIN"."ROLE" ADD CONSTRAINT "FK_POZWOLENIA" FOREIGN KEY ("ID_POZWOLENIA")
	  REFERENCES "ADMIN"."POZWOLENIA" ("ID_POZWOLENIA") ENABLE;
