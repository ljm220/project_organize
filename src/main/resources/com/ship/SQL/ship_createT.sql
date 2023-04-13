--alter session set "_oracle_script"=true;
--drop user ship cascade;
--create user ship identified by 1234;
--grant connect, resource, unlimited tablespace to ship;
--conn ship/1234;

set line 500;
set pagesize 20;

-- ȸ������������
DROP TABLE USR cascade constraint;
DROP SEQUENCE USR_SEQ;
PURGE recyclebin;
CREATE TABLE USR (
	USR_NUM NUMBER constraint USR_PK primary key, -- ȸ����ȣ,
	USR_ID VARCHAR2(50) constraint USR_ID_UQ unique NOT NULL, -- ȸ�� ���̵�,
	USR_EMAIL VARCHAR2(50) , -- �̸���,constraint USR_EMAIL_UQ unique
	USR_PHONE VARCHAR2(30) , -- ȸ�� �޴�����ȣ,
	USR_PWD VARCHAR2(50) NOT NULL, -- ��й�ȣ,
	USR_NAME VARCHAR2(50) NOT NULL, -- �̸�,
	USR_NICKNAME VARCHAR2(50) NOT NULL, -- �г���,
	USR_BIRTH DATE NOT NULL, -- �������,
	USR_GENDER VARCHAR2(20) NOT NULL, -- ����,
	USR_PHOTO NUMBER(1) DEFAULT 0 constraint USR_PHOTO_CK CHECK(USR_PHOTO=0 OR USR_PHOTO=1) , -- �����ʻ���,
	USR_CITY NUMBER(2) DEFAULT 0 NOT NULL, --ȸ������
	USR_TOWN NUMBER(2) DEFAULT 0 NOT NULL, --ȸ������
	USR_PHOTO_PATH VARCHAR2(200) DEFAULT 'default'  NOT NULL, -- �����ּ�,
	USR_RDATE DATE DEFAULT SYSDATE NOT NULL -- ���Գ�¥,
);
CREATE SEQUENCE USR_SEQ increment by 1 start with 1 nocache;


DROP TABLE ONLINE_USR;
PURGE recyclebin;
CREATE TABLE ONLINE_USR (
	USR_NUM NUMBER  -- ȸ����ȣ,
);



-- ��忡���Ѹ��(�ؼ�)
DROP TABLE CREW cascade constraint;
DROP SEQUENCE CREW_SEQ;
PURGE recyclebin;
CREATE TABLE CREW (
	CREW_NUM NUMBER constraint CREW_PK primary key, -- �����ȣ,
	USR_NUM NUMBER NOT NULL, -- ȸ����ȣ,
	SHIP_NUM NUMBER NOT NULL, -- ����ȣ,
	CREW_ROLE VARCHAR2(50) DEFAULT 'sailor' NOT NULL, -- ����,
	CREW_BOOKMARK NUMBER(1) DEFAULT 0 constraint CREW_BOOKMARK_CK CHECK(CREW_BOOKMARK=0 OR CREW_BOOKMARK=1), -- ���ã��,
	CREW_JDATE DATE DEFAULT SYSDATE NOT NULL, -- ���Գ�¥,
	CREW_PHOTO VARCHAR2(200) DEFAULT 'default' NOT NULL,
	CREW_NICKNAME VARCHAR2(50) NOT NULL -- �г���
);
CREATE SEQUENCE CREW_SEQ increment by 1 start with 1 nocache;


-- ����
DROP TABLE NOTE cascade constraint;
DROP SEQUENCE NOTE_SEQ;
PURGE recyclebin;
CREATE TABLE NOTE (
	NOTE_NUM NUMBER constraint NOTE_PK primary key, -- ������ȣ,
	NOTE_SENDER NUMBER NOT NULL, -- ��������,
	NOTE_RECEIVER NUMBER NOT NULL, -- �޴���,
	NOTE_CONTENT VARCHAR2(1000) NOT NULL, -- ����,
	NOTE_STATUS NUMBER(1) DEFAULT 0 constraint NOTE_STATUS_CK CHECK(NOTE_STATUS=0 OR NOTE_STATUS=1), -- Ȯ�λ���,
	NOTE_WDATE DATE DEFAULT SYSDATE NOT NULL -- ������¥
);
CREATE SEQUENCE NOTE_SEQ increment by 1 start with 1 nocache;

DROP TABLE NOTICE cascade constraint;
DROP SEQUENCE NOTICE_SEQ;
PURGE recyclebin;

CREATE TABLE NOTICE(
	NOTICE_NUM NUMBER constraint  NOTICE_PK primary key, 
	NOTICE_TITLE VARCHAR2(2000) NOT NULL,
	NOTICE_CONTENT VARCHAR2(4000) ,
	NOTICE_DATE DATE DEFAULT SYSDATE NOT NULL -- ���Գ�¥,
);
CREATE SEQUENCE NOTICE_SEQ increment by 1 start with 1 nocache;


-- ���Խ�û��
DROP TABLE APPLICATION cascade constraint;
DROP SEQUENCE APPLICATION_SEQ;
PURGE recyclebin;
CREATE TABLE APPLICATION (
	APP_NUM NUMBER constraint APPLICATION_PK primary key, -- ��û����ȣ,
	USR_NUM NUMBER NOT NULL, -- ȸ����ȣ,
	SHIP_NUM NUMBER NOT NULL, -- ����ȣ,
	APP_ANSWER VARCHAR2(200) NOT NULL, -- ���Դ亯,
	APP_ADATE DATE DEFAULT SYSDATE NOT NULL, -- ��û��¥,
	APP_STATUS NUMBER(1) DEFAULT 0 constraint APP_STATUS_CK CHECK(APP_STATUS=0 OR APP_STATUS=1) -- ��û��Ȳ(�����ڰ� �о��°� �ƴѰ�)
);
CREATE SEQUENCE APPLICATION_SEQ increment by 1 start with 1 nocache;


-- ����(�׷�/SHIP)
DROP TABLE SHIP cascade constraint;
DROP SEQUENCE SHIP_SEQ;
PURGE recyclebin;
CREATE TABLE SHIP (
	SHIP_NUM NUMBER constraint SHIP_PK primary key, -- ����ȣ,
	SHIP_NAME VARCHAR2(100) NOT NULL, -- �̸�,
	SHIP_TITLE VARCHAR2(100) NOT NULL, -- �Ұ�,
	SHIP_SURVEY VARCHAR2(100) NOT NULL, -- �Ұ�,	
	SHIP_CAPTAIN VARCHAR2(50) NOT NULL, -- ��ǥ��,
	SHIP_SAMPLE NUMBER(1) NOT NULL, -- ���û�뿩��,
	SHIP_SAMPLE_NAME VARCHAR2(200) NOT NULL, -- �����̸�,
	SHIP_PHOTO_NAME VARCHAR2(200) NOT NULL, -- �����̸�,
	SHIP_BANNER_NAME VARCHAR2(200) NOT NULL, -- ���ù���̸�,
	CITY_NUM NUMBER DEFAULT 0 NOT NULL, -- �õ���ȣ,
	TOWN_NUM NUMBER DEFAULT 0 NOT NULL, -- ������ȣ,
	DONG_NUM NUMBER DEFAULT 0 NOT NULL, -- ���鵿��ȣ,
	LIMIT_STATUS NUMBER(1) DEFAULT 0 constraint SHIP_LIMIT_STATUS_CK CHECK(LIMIT_STATUS=0 OR LIMIT_STATUS=1), -- �������ѿ���,
	LIMIT_START DATE NULL, -- �������Ѻ���,
	LIMIT_END DATE NULL, -- �������ѱ���,
	LIMIT_GENDER NUMBER(1) DEFAULT 0 NOT NULL constraint LIMIT_GENDER_CK CHECK(LIMIT_GENDER=0 OR LIMIT_GENDER=1 OR LIMIT_GENDER=2),
	SHIP_CDATE DATE DEFAULT SYSDATE NOT NULL, -- ������¥,
	SHIP_OPEN NUMBER(1) DEFAULT 0 constraint SHIP_OPEN_CK CHECK(SHIP_OPEN=0 OR SHIP_OPEN=1), -- ��������
	SHIP_COUNT NUMBER DEFAULT 1 NOT NULL,
	USR_NUM NUMBER NOT NULL
);
CREATE SEQUENCE SHIP_SEQ increment by 1 start with 1 nocache;



-- ���������ʻ���
DROP TABLE SHIP_PHOTO cascade constraint;
DROP SEQUENCE SHIP_PHOTO_SEQ;
PURGE recyclebin;
CREATE TABLE SHIP_PHOTO (
	SHIP_PHOTO_NUM NUMBER constraint SHIP_PHOTO_PK primary key, -- �����ȣ,
	SHIP_PHOTO_NAME VARCHAR2(200) NOT NULL, -- ȸ����ȣ,
	SHIP_ORIGIN_PHOTO_NAME VARCHAR2(200) NOT NULL, -- ����ȣ,
	SHIP_PHOTO_STATUS NUMBER(1) DEFAULT 0 NOT NULL, -- ����,
	SHIP_PHOTO_LDATE DATE DEFAULT SYSDATE NOT NULL, -- ���ã��,
	SHIP_NUM NUMBER NOT NULL -- ���Գ�¥,
);
CREATE SEQUENCE SHIP_PHOTO_SEQ increment by 1 start with 1 nocache;

-- ���������ʻ���
DROP TABLE SHIP_BANNER cascade constraint;
DROP SEQUENCE SHIP_BANNER_SEQ;
PURGE recyclebin;
CREATE TABLE SHIP_BANNER (
	SHIP_BANNER_NUM NUMBER constraint SHIP_BANNER_PK primary key, -- �����ȣ,
	SHIP_BANNER_NAME VARCHAR2(200) NOT NULL, -- ȸ����ȣ,
	SHIP_ORIGIN_BANNER_NAME VARCHAR2(200) NOT NULL, -- ����ȣ,
	SHIP_BANNER_STATUS NUMBER(1) DEFAULT 0 NOT NULL, -- ����,
	SHIP_BANNER_LDATE DATE DEFAULT SYSDATE NOT NULL, -- ���ã��,
	SHIP_NUM NUMBER NOT NULL -- ���Գ�¥,
);
CREATE SEQUENCE SHIP_BANNER_SEQ increment by 1 start with 1 nocache;


-- ���Լ�������
DROP TABLE SURVEY cascade constraint;
DROP SEQUENCE SURVEY_SEQ;
PURGE recyclebin;
CREATE TABLE SURVEY (
	SURVEY_NUM NUMBER constraint SURVEY_PK primary key, -- ������ȣ,
	SHIP_NUM NUMBER NOT NULL, -- ����ȣ,
	SURVEY_CONTENT VARCHAR2(200) NOT NULL -- ��������
);
CREATE SEQUENCE SURVEY_SEQ increment by 1 start with 1 nocache;


-- ��/��
DROP TABLE CITY cascade constraint;
PURGE recyclebin;
CREATE TABLE CITY (
	CITY_NUM NUMBER constraint CITY_PK primary key, -- �õ���ȣ,
	CITY_NAME VARCHAR2(30) NOT NULL -- �̸�
);


-- ��/��
DROP TABLE TOWN cascade constraint;
PURGE recyclebin;
CREATE TABLE TOWN (
	TOWN_NUM NUMBER constraint TOWN_PK primary key, -- ������ȣ,
	TOWN_NAME VARCHAR2(30) NOT NULL, -- �̸�,
	CITY_NUM NUMBER NOT NULL -- �õ���ȣ
);

-- ��/��/��
DROP TABLE DONG cascade constraint;
DROP SEQUENCE DONG_SEQ;
PURGE recyclebin;
CREATE TABLE DONG (
	DONG_NUM NUMBER constraint DONG_PK primary key, -- ���鵿��ȣ,
	DONG_NAME VARCHAR2(30) NOT NULL, -- �̸�,
	TOWN_NUM NUMBER NOT NULL, -- ������ȣ
	DONG_X NUMBER NOT NULL, -- ����
	DONG_Y NUMBER NOT NULL -- �浵
);
CREATE SEQUENCE DONG_SEQ increment by 1 start with 1 nocache;


-- �Խ���
DROP TABLE BOARD cascade constraint;
DROP SEQUENCE BOARD_SEQ;
PURGE recyclebin;
CREATE TABLE BOARD (
	BOARD_NUM NUMBER constraint BOARD_PK primary key, -- �Խñ۹�ȣ,
	BUNDLE_NUM NUMBER NOT NULL, -- ������ȣ,
	BUNDLE_ORDER NUMBER DEFAULT 0 NOT NULL, -- ����������,DEFAULT 0 constraint SHIP_LIMIT_STATUS_CK CHECK(LIMIT_STATUS=0 OR LIMIT_STATUS=1), -- �������ѿ���,
	BUNDLE_DEPTH NUMBER DEFAULT 0 NOT NULL, -- ����������,
	BOARD_WRITER VARCHAR2(50) NOT NULL, -- �ۼ���,
	BOARD_SUBJECT VARCHAR2(100) NOT NULL, -- ����,
	BOARD_CONTENT VARCHAR2(4000) NOT NULL, -- ����,
	BOARD_CHANGE NUMBER(1) DEFAULT 0 constraint BOARD_CHANGE_CK CHECK(BOARD_CHANGE=0 OR BOARD_CHANGE=1), -- ��������,
	BOARD_WDATE DATE DEFAULT SYSDATE NOT NULL, -- �Խó�¥,
	BOARD_VIEW NUMBER DEFAULT 0 NOT NULL, -- ��ȸ��,
	BOARD_GOOD NUMBER DEFAULT 0 NOT NULL, -- ���ƿ�,
	BOARD_REPLY NUMBER DEFAULT 0 NOT NULL, -- ��ۼ�,
	BOARD_OPEN NUMBER(1) DEFAULT 0 constraint BOARD_OPEN_CK CHECK(BOARD_OPEN=0 OR BOARD_OPEN=1), -- ��ȸ���,
	CREW_NUM NUMBER NOT NULL -- ����ȣ
);
CREATE SEQUENCE BOARD_SEQ increment by 1 start with 1 nocache;



-- �Խ��� ÷������
DROP TABLE BOARD_FILE cascade constraint;
DROP SEQUENCE BOARD_FILE_SEQ;
PURGE recyclebin;
CREATE TABLE BOARD_FILE (
	BOARD_FILE_NUM NUMBER constraint BOARD_FILE_PK primary key, -- �����ȣ,
	BOARD_FILE_NAME VARCHAR2(200) NOT NULL, -- ȸ����ȣ,
	BOARD_FILE_SAVE_NAME VARCHAR2(200) NOT NULL, -- ����ȣ,
	BOARD_FILE_SIZE NUMBER NOT NULL, -- ���� ������,
	BOARD_FILE_UDATE DATE DEFAULT SYSDATE NOT NULL, -- ���ã��,
	BOARD_FILE_STATUS NUMBER NOT NULL,
	BOARD_NUM NUMBER NOT NULL -- �θ�Խñ۹�ȣ,
);
CREATE SEQUENCE BOARD_FILE_SEQ increment by 1 start with 1 nocache;


-- ���
DROP TABLE REPLY cascade constraint;
DROP SEQUENCE REPLY_SEQ;
PURGE recyclebin;
CREATE TABLE REPLY (
	REPLY_NUM NUMBER constraint REPLY_PK primary key, -- ��۹�ȣ,
	CREW_NUM NUMBER NOT NULL, -- �����ȣ,
	BOARD_NUM NUMBER NOT NULL, -- �Խñ۹�ȣ,
	BUNDLE_NUM NUMBER NOT NULL, -- ������ȣ,
	BUNDLE_ORDER NUMBER DEFAULT 0 NOT NULL, -- ����������,
	BUNDLE_DEPTH NUMBER DEFAULT 0 NOT NULL, -- ����������,
	REPLY_CONTENT VARCHAR2(200) NOT NULL, -- ����,
	REPLY_WDATE DATE DEFAULT SYSDATE NOT NULL, -- �ۼ���¥,
	REPLY_CHANGE NUMBER DEFAULT 0 constraint REPLY_CHANGE_CK CHECK(REPLY_CHANGE=0 OR REPLY_CHANGE=1), -- ��������,
	REPLY_CDATE DATE DEFAULT SYSDATE NOT NULL, -- ������¥,
	REPLY_GOOD NUMBER DEFAULT 0 NOT NULL, -- ���ƿ�,
	REPLY_OPEN NUMBER(1) DEFAULT 0 constraint REPLY_OPEN_CK CHECK(REPLY_OPEN=0 OR REPLY_OPEN=1) -- ��ȸ���
);
CREATE SEQUENCE REPLY_SEQ increment by 1 start with 1 nocache;

--select REPLY_NUM,BUNDLE_NUM,BUNDLE_ORDER,BUNDLE_DEPTH,CONTENT,WDATE from REPLY;

-- �Ű�
DROP TABLE REPORT cascade constraint;
DROP SEQUENCE REPORT_SEQ;
PURGE recyclebin;
CREATE TABLE REPORT (
	REPORT_NUM NUMBER constraint REPORT_PK primary key, -- �Ű��ȣ,
	USR_NUM NUMBER NOT NULL, -- ȸ����ȣ,
	SHIP_NUM NUMBER NOT NULL, -- ����ȣ,
	REPORT_CONTENT VARCHAR2(200) NOT NULL, -- �Ű���,
	REPORT_RDATE DATE DEFAULT SYSDATE NOT NULL, -- �Ű�¥,
	REPORT_STATUS NUMBER(1) DEFAULT 0 constraint REPORT_STATUS_CK CHECK(REPORT_STATUS=0 OR REPORT_STATUS=1) -- ó������
);
CREATE SEQUENCE REPORT_SEQ increment by 1 start with 1 nocache;


-- �Խ������ƿ�
DROP TABLE BOARD_GOOD cascade constraint;
DROP SEQUENCE BOARD_GOOD_SEQ;
PURGE recyclebin;
CREATE TABLE BOARD_GOOD (
	BOARD_GOOD_NUM NUMBER constraint BOARD_GOOD_PK primary key, -- ���ƿ��ȣ,
	CREW_NUM NUMBER NOT NULL, -- �����ȣ,
	BOARD_NUM NUMBER NOT NULL -- �Խñ۹�ȣ
);
CREATE SEQUENCE BOARD_GOOD_SEQ increment by 1 start with 1 nocache;


-- ������ƿ�
DROP TABLE REPLY_GOOD cascade constraint;
DROP SEQUENCE REPLY_GOOD_SEQ;
PURGE recyclebin;
CREATE TABLE REPLY_GOOD (
	REPLY_GOOD_NUM NUMBER constraint REPLY_GOOD_PK primary key, -- ������ƿ��ȣ,
	CREW_NUM NUMBER NOT NULL, -- �����ȣ,
	REPLY_NUM NUMBER NOT NULL -- ��۹�ȣ
);
CREATE SEQUENCE REPLY_GOOD_SEQ increment by 1 start with 1 nocache;


-- ����
DROP TABLE MEET cascade constraint;
DROP SEQUENCE MEET_SEQ;
PURGE recyclebin;
CREATE TABLE MEET (
	MEET_NUM NUMBER constraint MEET_PK primary key, -- ������ȣ,
	SHIP_NUM NUMBER NOT NULL, -- ����ȣ,
	MEET_LOC VARCHAR2(200) NOT NULL, -- �������,
	MEET_CONTENT VARCHAR2(200) NOT NULL, -- ��������,
	MEET_MDATE DATE NOT NULL, -- ������¥,
	MEET_WDATE DATE DEFAULT SYSDATE NOT NULL, -- �ۼ���¥,
	MEET_STAUS NUMBER(1) DEFAULT 0 constraint MEET_STAUS_CK CHECK(MEET_STAUS=0 OR MEET_STAUS=1), -- ��������,
	LIMIT_STATUS NUMBER(1) DEFAULT 0 constraint LIMIT_STATUS_CK CHECK(LIMIT_STATUS=0 OR LIMIT_STATUS=1), -- �ο�����
	LIMIT_END NUMBER DEFAULT 500 NOT NULL -- �ο�����
);
CREATE SEQUENCE MEET_SEQ increment by 1 start with 1 nocache;


-- ���ý�û��
DROP TABLE REGISTRATION cascade constraint;
DROP SEQUENCE REGISTRATION_SEQ;
PURGE recyclebin;
CREATE TABLE REGISTRATION (
	REG_NUM NUMBER constraint REGISTRATION_PK primary key, -- ������û����ȣ,
	CREW_NUM NUMBER NOT NULL, -- �����ȣ,
	MEET_NUM NUMBER NOT NULL, -- ������ȣ,
	REG_RDATE DATE NOT NULL -- ������û��¥
);
CREATE SEQUENCE REGISTRATION_SEQ increment by 1 start with 1 nocache;


-- �˸�
DROP TABLE NOTIFICATION cascade constraint;
DROP SEQUENCE NOTIFICATION_SEQ;
PURGE recyclebin;
CREATE TABLE NOTIFICATION (
	NOTI_NUM NUMBER constraint NOTIFICATION_PK primary key, -- �˸���ȣ,
	NOTI_SUBJECT VARCHAR2(50) NOT NULL, -- ����,
	NOTI_CONTENT VARCHAR2(50) NOT NULL, -- ����,
	NOTI_STATUS NUMBER(1) DEFAULT 0 constraint NOTI_STATUS_CK CHECK(NOTI_STATUS=0 OR NOTI_STATUS=1), -- �˸�����,
	NOTI_WDATE DATE NOT NULL, -- �˸���ϳ�¥,
	USR_NUM NUMBER NOT NULL, -- ȸ����ȣ,
	SHIP_NUM NUMBER NOT NULL -- ����ȣ
);
CREATE SEQUENCE NOTIFICATION_SEQ increment by 1 start with 1 nocache;


-------------------------------------------------------------------------------------------------------------------------------------------

-- ��忡���Ѹ��(�ؼ�)
ALTER TABLE CREW
	ADD CONSTRAINT CREW_USR_FK -- ȸ������������ -> ��忡���Ѹ��(�ؼ�)
	FOREIGN KEY (
		USR_NUM -- ȸ����ȣ
	)
	REFERENCES USR ( -- ȸ������������
		USR_NUM -- ȸ����ȣ
	)ON DELETE CASCADE;

-- ��忡���Ѹ��(�ؼ�)
ALTER TABLE CREW
	ADD CONSTRAINT CREW_SHIP_FK -- ����(�׷�/SHIP) -> ��忡���Ѹ��(�ؼ�)
	FOREIGN KEY (
		SHIP_NUM -- ����ȣ
	)
	REFERENCES SHIP ( -- ����(�׷�/SHIP)
		SHIP_NUM -- ����ȣ
	)ON DELETE CASCADE;

-- ���Խ�û��
ALTER TABLE APPLICATION
	ADD CONSTRAINT APPLICATION_USR_FK -- ȸ������������ -> ���Խ�û��
	FOREIGN KEY (
		USR_NUM -- ȸ����ȣ
	)
	REFERENCES USR ( -- ȸ������������
		USR_NUM -- ȸ����ȣ
	)ON DELETE CASCADE;

-- ���Խ�û��
ALTER TABLE APPLICATION
	ADD CONSTRAINT APPLICATION_SHIP_FK -- ����(�׷�/SHIP) -> ���Խ�û��
	FOREIGN KEY (
		SHIP_NUM -- ����ȣ
	)
	REFERENCES SHIP ( -- ����(�׷�/SHIP)
		SHIP_NUM -- ����ȣ
	)ON DELETE CASCADE;

-- ���Լ�������
ALTER TABLE SURVEY
	ADD CONSTRAINT SURVEY_SHIP_FK -- ����(�׷�/SHIP) -> ���Լ�������
	FOREIGN KEY (
		SHIP_NUM -- ����ȣ
	)
	REFERENCES SHIP ( -- ����(�׷�/SHIP)
		SHIP_NUM -- ����ȣ
	)ON DELETE CASCADE;

-- ��/��
ALTER TABLE TOWN
	ADD CONSTRAINT TOWN_CITY_FK -- ��/�� -> ��/��
	FOREIGN KEY (
		CITY_NUM -- �õ���ȣ
	)
	REFERENCES CITY ( -- ��/��
		CITY_NUM -- �õ���ȣ
	)ON DELETE CASCADE;

-- �Խ���
ALTER TABLE BOARD
	ADD CONSTRAINT BOARD_CREW_FK -- ����(�׷�/SHIP) -> �Խ���
	FOREIGN KEY (
		CREW_NUM -- ����ȣ
	)
	REFERENCES CREW ( -- ����(�׷�/SHIP)
		CREW_NUM -- ����ȣ
	)ON DELETE CASCADE;

-- �Խ���÷������
ALTER TABLE BOARD_FILE
	ADD CONSTRAINT BOARD_FILE_FK -- �Խ���÷������(�ڽ�) -> �Խ���(�θ�)
	FOREIGN KEY (
		BOARD_NUM -- ����ȣ
	)
	REFERENCES BOARD ( -- ����(�׷�/SHIP)
		BOARD_NUM -- ����ȣ
	)ON DELETE CASCADE;


-- ���
ALTER TABLE REPLY
	ADD CONSTRAINT REPLY_BOARD_FK -- �Խ��� -> ���
	FOREIGN KEY (
		BOARD_NUM -- �Խñ۹�ȣ
	)
	REFERENCES BOARD ( -- �Խ���
		BOARD_NUM -- �Խñ۹�ȣ
	)ON DELETE CASCADE;

-- ���
ALTER TABLE REPLY
	ADD CONSTRAINT REPLY_CREW_FK -- ��忡���Ѹ��(�ؼ�) -> ���
	FOREIGN KEY (
		CREW_NUM -- �����ȣ
	)
	REFERENCES CREW ( -- ��忡���Ѹ��(�ؼ�)
		CREW_NUM -- �����ȣ
	)ON DELETE CASCADE;

-- �Ű�
ALTER TABLE REPORT
	ADD CONSTRAINT REPORT_USR_FK -- ȸ������������ -> �Ű�
	FOREIGN KEY (
		USR_NUM -- ȸ����ȣ
	)
	REFERENCES USR ( -- ȸ������������
		USR_NUM -- ȸ����ȣ
	)ON DELETE CASCADE;

-- �Ű�
ALTER TABLE REPORT
	ADD CONSTRAINT REPORT_SHIP_FK -- ����(�׷�/SHIP) -> �Ű�
	FOREIGN KEY (
		SHIP_NUM -- ����ȣ
	)
	REFERENCES SHIP ( -- ����(�׷�/SHIP)
		SHIP_NUM -- ����ȣ
	)ON DELETE CASCADE;

-- �Խ������ƿ�
ALTER TABLE BOARD_GOOD
	ADD CONSTRAINT BOARD_GOOD_BOARD_FK -- �Խ��� -> �Խ������ƿ�
	FOREIGN KEY (
		BOARD_NUM -- �Խñ۹�ȣ
	)
	REFERENCES BOARD ( -- �Խ���
		BOARD_NUM -- �Խñ۹�ȣ
	)ON DELETE CASCADE;

-- �Խ������ƿ�
ALTER TABLE BOARD_GOOD
	ADD CONSTRAINT BOARD_GOOD_CREW_FK -- ��忡���Ѹ��(�ؼ�) -> �Խ������ƿ�
	FOREIGN KEY (
		CREW_NUM -- �����ȣ
	)
	REFERENCES CREW ( -- ��忡���Ѹ��(�ؼ�)
		CREW_NUM -- �����ȣ
	)ON DELETE CASCADE;

-- ������ƿ�
ALTER TABLE REPLY_GOOD
	ADD CONSTRAINT REPLY_GOOD_REPLY_FK -- ��� -> ������ƿ�
	FOREIGN KEY (
		REPLY_NUM -- ��۹�ȣ
	)
	REFERENCES REPLY ( -- ���
		REPLY_NUM -- ��۹�ȣ
	)ON DELETE CASCADE;

-- ������ƿ�
ALTER TABLE REPLY_GOOD
	ADD CONSTRAINT REPLY_GOOD_CREW_FK -- ��忡���Ѹ��(�ؼ�) -> ������ƿ�
	FOREIGN KEY (
		CREW_NUM -- �����ȣ
	)
	REFERENCES CREW ( -- ��忡���Ѹ��(�ؼ�)
		CREW_NUM -- �����ȣ
	)ON DELETE CASCADE;

-- ����
ALTER TABLE MEET
	ADD CONSTRAINT MEET_SHIP_FK -- ����(�׷�/SHIP) -> ����
	FOREIGN KEY (
		SHIP_NUM -- ����ȣ
	)
	REFERENCES SHIP ( -- ����(�׷�/SHIP)
		SHIP_NUM -- ����ȣ
	)ON DELETE CASCADE;

-- ���ý�û��
ALTER TABLE REGISTRATION
	ADD CONSTRAINT REGISTRATION_MEET_FK -- ���� -> ���ý�û��
	FOREIGN KEY (
		MEET_NUM -- ������ȣ
	)
	REFERENCES MEET ( -- ����
		MEET_NUM -- ������ȣ
	)ON DELETE CASCADE;

-- ���ý�û��
ALTER TABLE REGISTRATION
	ADD CONSTRAINT REGISTRATION_CREW_FK -- ��忡���Ѹ��(�ؼ�) -> ���ý�û��
	FOREIGN KEY (
		CREW_NUM -- �����ȣ
	)
	REFERENCES CREW ( -- ��忡���Ѹ��(�ؼ�)
		CREW_NUM -- �����ȣ
	)ON DELETE CASCADE;

-- �˸�
ALTER TABLE NOTIFICATION
	ADD CONSTRAINT NOTIFICATION_USR_FK -- ȸ������������ -> �˸�
	FOREIGN KEY (
		USR_NUM -- ȸ����ȣ
	)
	REFERENCES USR ( -- ȸ������������
		USR_NUM -- ȸ����ȣ
	)ON DELETE CASCADE;

-- �˸�
ALTER TABLE NOTIFICATION
	ADD CONSTRAINT NOTIFICATION_SHIP_FK -- ����(�׷�/SHIP) -> �˸�
	FOREIGN KEY (
		SHIP_NUM -- ����ȣ
	)
	REFERENCES SHIP ( -- ����(�׷�/SHIP)
		SHIP_NUM -- ����ȣ
	)ON DELETE CASCADE;

-- SHIP
ALTER TABLE SHIP
	ADD CONSTRAINT SHIP_USR_FK -- ȸ������������ -> ����(�׷�/SHIP)
	FOREIGN KEY (
		USR_NUM -- ������ȣ
	)
	REFERENCES USR ( -- ȸ������������
		USR_NUM -- ������ȣ
	)ON DELETE CASCADE;

commit;



----------------------------------------------------------------------------------------------------------------------------------
--����


-- ����
--DROP TABLE USER_PHOTO cascade constraint;
--DROP SEQUENCE USER_PHOTO_SEQ;
--PURGE recyclebin;
--CREATE TABLE USER_PHOTO (
--	USER_PHOTO_NUM NUMBER constraint USER_PHOTO_PK primary key, -- �����ȣ,
--	USER_PHOTO_NAME VARCHAR2(50) constraint USER_PHOTO_NAME_UQ unique, -- �����̸�,
--	USER_PHOTO_ORIGIN_NAME VARCHAR2(50) NOT NULL, -- �����̸�,
--	USER_PHOTO_PROFILE_SIZE NUMBER NOT NULL, -- �뷮,
--	USER_PHOTO_LDATE DATE NOT NULL, -- �ֱٻ�볯¥,
--	USER_PHOTO_STATUS NUMBER NOT NULL, -- ������λ���,
--	USR_NUM NUMBER NOT NULL -- ȸ����ȣ
--);
--CREATE SEQUENCE USER_PHOTO_SEQ increment by 1 start with 1 nocache;

-- ���Ӵ�ǥ����
--DROP TABLE SHIP_PHOTO cascade constraint;
--DROP SEQUENCE SHIP_PHOTO_SEQ;
--PURGE recyclebin;
--CREATE TABLE SHIP_PHOTO (
--	BPHOTO_NUM NUMBER constraint SHIP_PHOTO_PK primary key, -- ��ǥ������ȣ,
--	NAME VARCHAR2(20) constraint SHIP_PHOTO_UQ unique, -- �����̸�,
--	ORIGIN_NAME VARCHAR2(20) NOT NULL, -- �����̸�,
--	BPHOTO_SIZE NUMBER NOT NULL, -- �뷮,
--	SHIP_NUM NUMBER NOT NULL -- ����ȣ
--);
--CREATE SEQUENCE SHIP_PHOTO_SEQ increment by 1 start with 1 nocache;

-- ����
--ALTER TABLE USER_PHOTO
--	ADD CONSTRAINT USER_PHOTO_USR_FK -- ȸ������������ -> ����
--	FOREIGN KEY (
--		USR_NUM -- ȸ����ȣ
--	)
--	REFERENCES USR ( -- ȸ������������
--		USR_NUM -- ȸ����ȣ
--	);

-- ���Ӵ�ǥ����
--ALTER TABLE SHIP_PHOTO
--	ADD CONSTRAINT SHIP_PHOTO_SHIP_FK -- ����(�׷�/SHIP) -> ���Ӵ�ǥ����
--	FOREIGN KEY (
--		SHIP_NUM -- ����ȣ
--	)
--	REFERENCES SHIP ( -- ����(�׷�/SHIP)
--		SHIP_NUM -- ����ȣ
--	);

ALTER TABLE SHIP_PHOTO
	ADD CONSTRAINT SHIP_PHOTO_FK -- ���� -> ä��
	FOREIGN KEY (
		SHIP_NUM -- ȸ����ȣ
	)
	REFERENCES SHIP ( -- ����
		SHIP_NUM -- ȸ����ȣ
	)ON DELETE CASCADE;

ALTER TABLE SHIP_BANNER
	ADD CONSTRAINT SHIP_BANNER_FK -- ���� -> ä��
	FOREIGN KEY (
		SHIP_NUM -- ȸ����ȣ
	)
	REFERENCES SHIP ( -- ����
		SHIP_NUM -- ȸ����ȣ
	)ON DELETE CASCADE;
DROP TABLE ROOM cascade constraint;
DROP TABLE CHATTING cascade constraint;
DROP TABLE CALENDAR cascade constraint;
DROP SEQUENCE ROOM_SEQ;
DROP SEQUENCE CHATTING_SEQ;
DROP SEQUENCE CALENDAR_SEQ;
DROP SEQUENCE CALENDAR_GROUP_ID_SEQ;
PURGE recyclebin;	

CREATE TABLE ROOM (
	ROOM_NUM NUMBER constraint ROOM_PK primary key,
	ROOM_ID NUMBER, -- �� ��ȣ,
	ROOM_NAME VARCHAR2(200),  -- �� �̸�,
	ROOM_MEMBER   NUMBER NOT NULL -- ä�� ���
);
CREATE SEQUENCE ROOM_SEQ increment by 1 start with 1 nocache;

CREATE TABLE CHATTING (
	CHAT_ID NUMBER constraint CHAT_ID_PK primary key, -- ä�� ���̵�,
	ROOM_ID  NUMBER, -- �� ���̵�,
	CHAT_SENDER NUMBER NOT NULL, -- ��������,
	CHAT_CONTENT VARCHAR2(200) NOT NULL, -- ����,
	USR_PHOTO_PATH VARCHAR2(200) NOT NULL, -- ����,
	CHAT_WDATE DATE DEFAULT SYSDATE NOT NULL -- ������¥
);
CREATE SEQUENCE CHATTING_SEQ increment by 1 start with 1 nocache;

CREATE TABLE CALENDAR (
	CALENDAR_ID NUMBER constraint CALENDAR_ID_PK primary key,
	CALENDAR_GROUP_ID NUMBER,
	SHIP_NUM NUMBER,
	USR_NUM NUMBER,
	CALENDAR_TITLE VARCHAR2(50),
	CALENDAR_WRITER VARCHAR2(50),
	CALENDAR_CONTENT VARCHAR2(1000),
	CALENDAR_START1 DATE,
	CALENDAR_END1 DATE,
	CALENDAR_ALL_DAY NUMBER(1),
	CALENDAR_TEXT_COLOR VARCHAR(50),
	CALENDAR_BACKGROUND_COLOR VARCHAR2(50),
	CALENDAR_BORDER_COLOR VARCHAR2(50)
);
CREATE SEQUENCE CALENDAR_SEQ increment by 1 start with 1 nocache;
CREATE SEQUENCE CALENDAR_GROUP_ID_SEQ increment by 1 start with 1 nocache;

ALTER TABLE CHATTING 
	ADD CONSTRAINT CHAT_SENDER_FK -- ���� -> ä��
	FOREIGN KEY (
		CHAT_SENDER-- ȸ����ȣ
	)
	REFERENCES USR ( -- ����
		USR_NUM -- ȸ����ȣ
	);

ALTER TABLE ROOM
	ADD CONSTRAINT ROOM_MEMBER_FK -- ���� -> ä��
	FOREIGN KEY (
		ROOM_MEMBER -- ȸ����ȣ
	)
	REFERENCES USR ( -- ����
		USR_NUM -- ȸ����ȣ
	);

commit;
