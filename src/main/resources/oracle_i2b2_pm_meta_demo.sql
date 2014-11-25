
--------------------------------------------------------
--  File created - Monday-November-24-2014   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Type REPCAT$_OBJECT_NULL_VECTOR
--------------------------------------------------------

  CREATE OR REPLACE TYPE "SYSTEM"."REPCAT$_OBJECT_NULL_VECTOR" AS OBJECT
(
  -- type owner, name, hashcode for the type represented by null_vector
  type_owner      VARCHAR2(30),
  type_name       VARCHAR2(30),
  type_hashcode   RAW(17),
  -- null_vector for a particular object instance
  -- ROBJ REVISIT: should only contain the null image, and not version#
  null_vector     RAW(2000)
)

/
--------------------------------------------------------
--  DDL for Sequence PM_PARAMS
--------------------------------------------------------

   CREATE SEQUENCE  "I2B2PM"."PM_PARAMS"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table PM_APPROVALS
--------------------------------------------------------

  CREATE TABLE "I2B2PM"."PM_APPROVALS" 
   (	"APPROVAL_ID" VARCHAR2(50 BYTE), 
	"APPROVAL_NAME" VARCHAR2(255 BYTE), 
	"APPROVAL_DESCRIPTION" VARCHAR2(2000 BYTE), 
	"APPROVAL_ACTIVATION_DATE" DATE, 
	"APPROVAL_EXPIRATION_DATE" DATE, 
	"OBJECT_CD" VARCHAR2(50 BYTE), 
	"CHANGE_DATE" DATE, 
	"ENTRY_DATE" DATE, 
	"CHANGEBY_CHAR" VARCHAR2(50 BYTE), 
	"STATUS_CD" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PM_APPROVALS_PARAMS
--------------------------------------------------------

  CREATE TABLE "I2B2PM"."PM_APPROVALS_PARAMS" 
   (	"ID" NUMBER, 
	"APPROVAL_ID" VARCHAR2(50 BYTE), 
	"PARAM_NAME_CD" VARCHAR2(50 BYTE), 
	"VALUE" CLOB, 
	"ACTIVATION_DATE" DATE, 
	"EXPIRATION_DATE" DATE, 
	"DATATYPE_CD" VARCHAR2(50 BYTE), 
	"OBJECT_CD" VARCHAR2(50 BYTE), 
	"CHANGE_DATE" DATE, 
	"ENTRY_DATE" DATE, 
	"CHANGEBY_CHAR" VARCHAR2(50 BYTE), 
	"STATUS_CD" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("VALUE") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) ;
--------------------------------------------------------
--  DDL for Table PM_CELL_DATA
--------------------------------------------------------

  CREATE TABLE "I2B2PM"."PM_CELL_DATA" 
   (	"CELL_ID" VARCHAR2(50 BYTE), 
	"PROJECT_PATH" VARCHAR2(255 BYTE), 
	"NAME" VARCHAR2(255 BYTE), 
	"METHOD_CD" VARCHAR2(255 BYTE), 
	"URL" VARCHAR2(255 BYTE), 
	"CAN_OVERRIDE" NUMBER(1,0), 
	"CHANGE_DATE" DATE, 
	"ENTRY_DATE" DATE, 
	"CHANGEBY_CHAR" VARCHAR2(50 BYTE), 
	"STATUS_CD" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PM_CELL_PARAMS
--------------------------------------------------------

  CREATE TABLE "I2B2PM"."PM_CELL_PARAMS" 
   (	"ID" NUMBER, 
	"DATATYPE_CD" VARCHAR2(50 BYTE), 
	"CELL_ID" VARCHAR2(50 BYTE), 
	"PROJECT_PATH" VARCHAR2(255 BYTE), 
	"PARAM_NAME_CD" VARCHAR2(50 BYTE), 
	"VALUE" CLOB, 
	"CAN_OVERRIDE" NUMBER(1,0), 
	"CHANGE_DATE" DATE, 
	"ENTRY_DATE" DATE, 
	"CHANGEBY_CHAR" VARCHAR2(50 BYTE), 
	"STATUS_CD" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("VALUE") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) ;
--------------------------------------------------------
--  DDL for Table PM_GLOBAL_PARAMS
--------------------------------------------------------

  CREATE TABLE "I2B2PM"."PM_GLOBAL_PARAMS" 
   (	"ID" NUMBER, 
	"DATATYPE_CD" VARCHAR2(50 BYTE), 
	"PARAM_NAME_CD" VARCHAR2(50 BYTE), 
	"PROJECT_PATH" VARCHAR2(255 BYTE), 
	"VALUE" CLOB, 
	"CAN_OVERRIDE" NUMBER(1,0), 
	"CHANGE_DATE" DATE, 
	"ENTRY_DATE" DATE, 
	"CHANGEBY_CHAR" VARCHAR2(50 BYTE), 
	"STATUS_CD" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("VALUE") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) ;
--------------------------------------------------------
--  DDL for Table PM_HIVE_DATA
--------------------------------------------------------

  CREATE TABLE "I2B2PM"."PM_HIVE_DATA" 
   (	"DOMAIN_ID" VARCHAR2(50 BYTE), 
	"HELPURL" VARCHAR2(255 BYTE), 
	"DOMAIN_NAME" VARCHAR2(255 BYTE), 
	"ENVIRONMENT_CD" VARCHAR2(255 BYTE), 
	"ACTIVE" NUMBER(1,0), 
	"CHANGE_DATE" DATE, 
	"ENTRY_DATE" DATE, 
	"CHANGEBY_CHAR" VARCHAR2(50 BYTE), 
	"STATUS_CD" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PM_HIVE_PARAMS
--------------------------------------------------------

  CREATE TABLE "I2B2PM"."PM_HIVE_PARAMS" 
   (	"ID" NUMBER, 
	"DATATYPE_CD" VARCHAR2(50 BYTE), 
	"DOMAIN_ID" VARCHAR2(50 BYTE), 
	"PARAM_NAME_CD" VARCHAR2(50 BYTE), 
	"VALUE" CLOB, 
	"CHANGE_DATE" DATE, 
	"ENTRY_DATE" DATE, 
	"CHANGEBY_CHAR" VARCHAR2(50 BYTE), 
	"STATUS_CD" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("VALUE") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) ;
--------------------------------------------------------
--  DDL for Table PM_PROJECT_DATA
--------------------------------------------------------

  CREATE TABLE "I2B2PM"."PM_PROJECT_DATA" 
   (	"PROJECT_ID" VARCHAR2(50 BYTE), 
	"PROJECT_NAME" VARCHAR2(255 BYTE), 
	"PROJECT_WIKI" VARCHAR2(255 BYTE), 
	"PROJECT_KEY" VARCHAR2(255 BYTE), 
	"PROJECT_PATH" VARCHAR2(255 BYTE), 
	"PROJECT_DESCRIPTION" VARCHAR2(2000 BYTE), 
	"CHANGE_DATE" DATE, 
	"ENTRY_DATE" DATE, 
	"CHANGEBY_CHAR" VARCHAR2(50 BYTE), 
	"STATUS_CD" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PM_PROJECT_PARAMS
--------------------------------------------------------

  CREATE TABLE "I2B2PM"."PM_PROJECT_PARAMS" 
   (	"ID" NUMBER, 
	"DATATYPE_CD" VARCHAR2(50 BYTE), 
	"PROJECT_ID" VARCHAR2(50 BYTE), 
	"PARAM_NAME_CD" VARCHAR2(50 BYTE), 
	"VALUE" CLOB, 
	"CHANGE_DATE" DATE, 
	"ENTRY_DATE" DATE, 
	"CHANGEBY_CHAR" VARCHAR2(50 BYTE), 
	"STATUS_CD" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("VALUE") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) ;
--------------------------------------------------------
--  DDL for Table PM_PROJECT_REQUEST
--------------------------------------------------------

  CREATE TABLE "I2B2PM"."PM_PROJECT_REQUEST" 
   (	"ID" NUMBER, 
	"TITLE" VARCHAR2(255 BYTE), 
	"REQUEST_XML" CLOB, 
	"CHANGE_DATE" DATE, 
	"ENTRY_DATE" DATE, 
	"CHANGEBY_CHAR" VARCHAR2(50 BYTE), 
	"STATUS_CD" VARCHAR2(50 BYTE), 
	"PROJECT_ID" VARCHAR2(50 BYTE), 
	"SUBMIT_CHAR" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("REQUEST_XML") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) ;
--------------------------------------------------------
--  DDL for Table PM_PROJECT_USER_PARAMS
--------------------------------------------------------

  CREATE TABLE "I2B2PM"."PM_PROJECT_USER_PARAMS" 
   (	"ID" NUMBER, 
	"DATATYPE_CD" VARCHAR2(50 BYTE), 
	"PROJECT_ID" VARCHAR2(50 BYTE), 
	"USER_ID" VARCHAR2(50 BYTE), 
	"PARAM_NAME_CD" VARCHAR2(50 BYTE), 
	"VALUE" CLOB, 
	"CHANGE_DATE" DATE, 
	"ENTRY_DATE" DATE, 
	"CHANGEBY_CHAR" VARCHAR2(50 BYTE), 
	"STATUS_CD" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("VALUE") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) ;
--------------------------------------------------------
--  DDL for Table PM_PROJECT_USER_ROLES
--------------------------------------------------------

  CREATE TABLE "I2B2PM"."PM_PROJECT_USER_ROLES" 
   (	"PROJECT_ID" VARCHAR2(50 BYTE), 
	"USER_ID" VARCHAR2(50 BYTE), 
	"USER_ROLE_CD" VARCHAR2(255 BYTE), 
	"CHANGE_DATE" DATE, 
	"ENTRY_DATE" DATE, 
	"CHANGEBY_CHAR" VARCHAR2(50 BYTE), 
	"STATUS_CD" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PM_ROLE_REQUIREMENT
--------------------------------------------------------

  CREATE TABLE "I2B2PM"."PM_ROLE_REQUIREMENT" 
   (	"TABLE_CD" VARCHAR2(50 BYTE), 
	"COLUMN_CD" VARCHAR2(50 BYTE), 
	"READ_HIVEMGMT_CD" VARCHAR2(50 BYTE), 
	"WRITE_HIVEMGMT_CD" VARCHAR2(50 BYTE), 
	"NAME_CHAR" VARCHAR2(2000 BYTE), 
	"CHANGE_DATE" DATE, 
	"ENTRY_DATE" DATE, 
	"CHANGEBY_CHAR" VARCHAR2(50 BYTE), 
	"STATUS_CD" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PM_USER_DATA
--------------------------------------------------------

  CREATE TABLE "I2B2PM"."PM_USER_DATA" 
   (	"USER_ID" VARCHAR2(50 BYTE), 
	"FULL_NAME" VARCHAR2(255 BYTE), 
	"PASSWORD" VARCHAR2(255 BYTE), 
	"EMAIL" VARCHAR2(255 BYTE), 
	"CHANGE_DATE" DATE, 
	"ENTRY_DATE" DATE, 
	"CHANGEBY_CHAR" VARCHAR2(50 BYTE), 
	"STATUS_CD" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PM_USER_LOGIN
--------------------------------------------------------

  CREATE TABLE "I2B2PM"."PM_USER_LOGIN" 
   (	"USER_ID" VARCHAR2(50 BYTE), 
	"ATTEMPT_CD" VARCHAR2(50 BYTE), 
	"ENTRY_DATE" TIMESTAMP (6), 
	"CHANGEBY_CHAR" VARCHAR2(50 BYTE), 
	"STATUS_CD" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PM_USER_PARAMS
--------------------------------------------------------

  CREATE TABLE "I2B2PM"."PM_USER_PARAMS" 
   (	"ID" NUMBER, 
	"DATATYPE_CD" VARCHAR2(50 BYTE), 
	"USER_ID" VARCHAR2(50 BYTE), 
	"PARAM_NAME_CD" VARCHAR2(50 BYTE), 
	"VALUE" CLOB, 
	"CHANGE_DATE" DATE, 
	"ENTRY_DATE" DATE, 
	"CHANGEBY_CHAR" VARCHAR2(50 BYTE), 
	"STATUS_CD" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("VALUE") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) ;
--------------------------------------------------------
--  DDL for Table PM_USER_SESSION
--------------------------------------------------------

  CREATE TABLE "I2B2PM"."PM_USER_SESSION" 
   (	"USER_ID" VARCHAR2(50 BYTE), 
	"SESSION_ID" VARCHAR2(50 BYTE), 
	"EXPIRED_DATE" DATE, 
	"CHANGE_DATE" DATE, 
	"ENTRY_DATE" DATE, 
	"CHANGEBY_CHAR" VARCHAR2(50 BYTE), 
	"STATUS_CD" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for View AQ$DEF$_AQCALL
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."AQ$DEF$_AQCALL" ("QUEUE", "MSG_ID", "CORR_ID", "MSG_PRIORITY", "MSG_STATE", "DELAY", "DELAY_TIMESTAMP", "EXPIRATION", "ENQ_TIME", "ENQ_TIMESTAMP", "ENQ_USER_ID", "ENQ_TXN_ID", "DEQ_TIME", "DEQ_TIMESTAMP", "DEQ_USER_ID", "DEQ_TXN_ID", "RETRY_COUNT", "EXCEPTION_QUEUE_OWNER", "EXCEPTION_QUEUE", "USER_DATA", "ORIGINAL_QUEUE_NAME", "ORIGINAL_QUEUE_OWNER", "EXPIRATION_REASON") AS 
  SELECT q_name QUEUE, msgid MSG_ID, corrid CORR_ID, priority MSG_PRIORITY, decode(state, 0,   'READY',
                                1,   'WAIT',
                                2,   'PROCESSED',
                                3,   'EXPIRED',
                                10,  'BUFFERED_EXPIRED') MSG_STATE, cast(FROM_TZ(delay, '00:00')
                  at time zone sessiontimezone as date) DELAY, cast(FROM_TZ(delay, '00:00')
               at time zone sessiontimezone as timestamp) DELAY_TIMESTAMP, expiration, cast(FROM_TZ(enq_time, '00:00')
                  at time zone sessiontimezone as date) ENQ_TIME, cast(FROM_TZ(enq_time, '00:00')
                  at time zone sessiontimezone as timestamp) 
                  ENQ_TIMESTAMP, enq_uid ENQ_USER_ID, enq_tid ENQ_TXN_ID, cast(FROM_TZ(deq_time, '00:00')
                  at time zone sessiontimezone as date) DEQ_TIME, cast(FROM_TZ(deq_time, '00:00')
                  at time zone sessiontimezone as timestamp) 
                  DEQ_TIMESTAMP, deq_uid DEQ_USER_ID, deq_tid DEQ_TXN_ID, retry_count,  decode (state, 0, exception_qschema, 
                                  1, exception_qschema, 
                                  2, exception_qschema,  
                                  NULL) EXCEPTION_QUEUE_OWNER,  decode (state, 0, exception_queue, 
                                  1, exception_queue, 
                                  2, exception_queue,  
                                  NULL) EXCEPTION_QUEUE,  user_data,  decode (state, 3, 
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL, 
                             exception_queue), NULL)
                                ORIGINAL_QUEUE_NAME,  decode (state, 3, 
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL, 
                             exception_qschema), NULL)
                                ORIGINAL_QUEUE_OWNER,  decode(state, 3, 
                     decode(deq_time, NULL, 
                       decode(deq_tid, NULL,
                       decode (expiration , NULL , 'MAX_RETRY_EXCEEDED',
                            'TIME_EXPIRATION'),
                              'INVALID_TRANSACTION', NULL,
                              'MAX_RETRY_EXCEEDED'), NULL), NULL) 
                             EXPIRATION_REASON  FROM "DEF$_AQCALL" WHERE state != 7 AND   state != 9 WITH READ ONLY;
--------------------------------------------------------
--  DDL for View AQ$DEF$_AQERROR
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."AQ$DEF$_AQERROR" ("QUEUE", "MSG_ID", "CORR_ID", "MSG_PRIORITY", "MSG_STATE", "DELAY", "DELAY_TIMESTAMP", "EXPIRATION", "ENQ_TIME", "ENQ_TIMESTAMP", "ENQ_USER_ID", "ENQ_TXN_ID", "DEQ_TIME", "DEQ_TIMESTAMP", "DEQ_USER_ID", "DEQ_TXN_ID", "RETRY_COUNT", "EXCEPTION_QUEUE_OWNER", "EXCEPTION_QUEUE", "USER_DATA", "ORIGINAL_QUEUE_NAME", "ORIGINAL_QUEUE_OWNER", "EXPIRATION_REASON") AS 
  SELECT q_name QUEUE, msgid MSG_ID, corrid CORR_ID, priority MSG_PRIORITY, decode(state, 0,   'READY',
                                1,   'WAIT',
                                2,   'PROCESSED',
                                3,   'EXPIRED',
                                10,  'BUFFERED_EXPIRED') MSG_STATE, cast(FROM_TZ(delay, '00:00')
                  at time zone sessiontimezone as date) DELAY, cast(FROM_TZ(delay, '00:00')
               at time zone sessiontimezone as timestamp) DELAY_TIMESTAMP, expiration, cast(FROM_TZ(enq_time, '00:00')
                  at time zone sessiontimezone as date) ENQ_TIME, cast(FROM_TZ(enq_time, '00:00')
                  at time zone sessiontimezone as timestamp) 
                  ENQ_TIMESTAMP, enq_uid ENQ_USER_ID, enq_tid ENQ_TXN_ID, cast(FROM_TZ(deq_time, '00:00')
                  at time zone sessiontimezone as date) DEQ_TIME, cast(FROM_TZ(deq_time, '00:00')
                  at time zone sessiontimezone as timestamp) 
                  DEQ_TIMESTAMP, deq_uid DEQ_USER_ID, deq_tid DEQ_TXN_ID, retry_count,  decode (state, 0, exception_qschema, 
                                  1, exception_qschema, 
                                  2, exception_qschema,  
                                  NULL) EXCEPTION_QUEUE_OWNER,  decode (state, 0, exception_queue, 
                                  1, exception_queue, 
                                  2, exception_queue,  
                                  NULL) EXCEPTION_QUEUE,  user_data,  decode (state, 3, 
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL, 
                             exception_queue), NULL)
                                ORIGINAL_QUEUE_NAME,  decode (state, 3, 
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL, 
                             exception_qschema), NULL)
                                ORIGINAL_QUEUE_OWNER,  decode(state, 3, 
                     decode(deq_time, NULL, 
                       decode(deq_tid, NULL,
                       decode (expiration , NULL , 'MAX_RETRY_EXCEEDED',
                            'TIME_EXPIRATION'),
                              'INVALID_TRANSACTION', NULL,
                              'MAX_RETRY_EXCEEDED'), NULL), NULL) 
                             EXPIRATION_REASON  FROM "DEF$_AQERROR" WHERE state != 7 AND   state != 9 WITH READ ONLY;
--------------------------------------------------------
--  DDL for View AQ$_DEF$_AQCALL_F
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."AQ$_DEF$_AQCALL_F" ("Q_NAME", "ROW_ID", "MSGID", "CORRID", "PRIORITY", "STATE", "DELAY", "EXPIRATION", "ENQ_TIME", "ENQ_UID", "ENQ_TID", "DEQ_TIME", "DEQ_UID", "DEQ_TID", "RETRY_COUNT", "EXCEPTION_QSCHEMA", "EXCEPTION_QUEUE", "CSCN", "DSCN", "CHAIN_NO", "LOCAL_ORDER_NO", "TIME_MANAGER_INFO", "STEP_NO", "USER_DATA", "QUEUE_ID") AS 
  SELECT  /*+ NO_MERGE (qo) USE_NL(qt) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, '00:00') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, '00:00') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, '00:00') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, '00:00') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA , qo.qid QUEUE_ID  FROM "DEF$_AQCALL" qt, SYS.ALL_INT_DEQUEUE_QUEUES  qo  WHERE qt.q_name = qo.name AND qo.owner = 'SYSTEM' WITH READ ONLY;
--------------------------------------------------------
--  DDL for View AQ$_DEF$_AQERROR_F
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."AQ$_DEF$_AQERROR_F" ("Q_NAME", "ROW_ID", "MSGID", "CORRID", "PRIORITY", "STATE", "DELAY", "EXPIRATION", "ENQ_TIME", "ENQ_UID", "ENQ_TID", "DEQ_TIME", "DEQ_UID", "DEQ_TID", "RETRY_COUNT", "EXCEPTION_QSCHEMA", "EXCEPTION_QUEUE", "CSCN", "DSCN", "CHAIN_NO", "LOCAL_ORDER_NO", "TIME_MANAGER_INFO", "STEP_NO", "USER_DATA", "QUEUE_ID") AS 
  SELECT  /*+ NO_MERGE (qo) USE_NL(qt) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, '00:00') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, '00:00') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, '00:00') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, '00:00') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA , qo.qid QUEUE_ID  FROM "DEF$_AQERROR" qt, SYS.ALL_INT_DEQUEUE_QUEUES  qo  WHERE qt.q_name = qo.name AND qo.owner = 'SYSTEM' WITH READ ONLY;
--------------------------------------------------------
--  DDL for View MVIEW_EVALUATIONS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_EVALUATIONS" ("RUNID", "MVIEW_OWNER", "MVIEW_NAME", "RANK", "STORAGE_IN_BYTES", "FREQUENCY", "CUMULATIVE_BENEFIT", "BENEFIT_TO_COST_RATIO") AS 
  select
  t1.runid# as runid,
  summary_owner AS mview_owner,
  summary_name AS mview_name,
  rank# as rank,
  storage_in_bytes,
  frequency,
  cumulative_benefit,
  benefit_to_cost_ratio
from SYSTEM.MVIEW$_ADV_OUTPUT t1, SYSTEM.MVIEW$_ADV_LOG t2, ALL_USERS u
where
  t1.runid# = t2.runid# and
  u.username = t2.uname and
  u.user_id = userenv('SCHEMAID') and
  t1.output_type = 1
order by t1.rank#;

   COMMENT ON TABLE "SYSTEM"."MVIEW_EVALUATIONS"  IS 'This view gives DBA access to summary evaluation output';
--------------------------------------------------------
--  DDL for View MVIEW_EXCEPTIONS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_EXCEPTIONS" ("RUNID", "OWNER", "TABLE_NAME", "DIMENSION_NAME", "RELATIONSHIP", "BAD_ROWID") AS 
  select
  t1.runid# as runid,
  owner,
  table_name,
  dimension_name,
  relationship,
  bad_rowid
from SYSTEM.MVIEW$_ADV_EXCEPTIONS t1, SYSTEM.MVIEW$_ADV_LOG t2, ALL_USERS u
where
  t1.runid# = t2.runid# and
  u.username = t2.uname and
  u.user_id = userenv('SCHEMAID');

   COMMENT ON TABLE "SYSTEM"."MVIEW_EXCEPTIONS"  IS 'This view gives DBA access to dimension validation results';
--------------------------------------------------------
--  DDL for View MVIEW_FILTER
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_FILTER" ("FILTERID", "SUBFILTERNUM", "SUBFILTERTYPE", "STR_VALUE", "NUM_VALUE1", "NUM_VALUE2", "DATE_VALUE1", "DATE_VALUE2") AS 
  select
      a.filterid# as filterid,
      a.subfilternum# as subfilternum,
      decode(a.subfiltertype,1,'APPLICATION',2,'CARDINALITY',3,'LASTUSE',
                             4,'FREQUENCY',5,'USER',6,'PRIORITY',7,'BASETABLE',
                             8,'RESPONSETIME',9,'COLLECTIONID',10,'TRACENAME',
                             11,'SCHEMA','UNKNOWN') AS subfiltertype,
      a.str_value,
      to_number(decode(a.num_value1,-999,NULL,a.num_value1)) AS num_value1,
      to_number(decode(a.num_value2,-999,NULL,a.num_value2)) AS num_value2,
      a.date_value1,
      a.date_value2
   from system.mview$_adv_filter a, system.mview$_adv_log b, ALL_USERS u
   WHERE a.filterid# = b.runid#
   AND b.uname = u.username
   AND u.user_id = userenv('SCHEMAID');

   COMMENT ON TABLE "SYSTEM"."MVIEW_FILTER"  IS 'Workload filter records';
--------------------------------------------------------
--  DDL for View MVIEW_FILTERINSTANCE
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_FILTERINSTANCE" ("RUNID", "FILTERID", "SUBFILTERNUM", "SUBFILTERTYPE", "STR_VALUE", "NUM_VALUE1", "NUM_VALUE2", "DATE_VALUE1", "DATE_VALUE2") AS 
  select
      a.runid# as runid,
      a.filterid# as filterid,
      a.subfilternum# as subfilternum,
      decode(a.subfiltertype,1,'APPLICATION',2,'CARDINALITY',3,'LASTUSE',
                             4,'FREQUENCY',5,'USER',6,'PRIORITY',7,'BASETABLE',
                             8,'RESPONSETIME',9,'COLLECTIONID',10,'TRACENAME',
                             11,'SCHEMA','UNKNOWN') AS subfiltertype,
      a.str_value,
      to_number(decode(a.num_value1,-999,NULL,a.num_value1)) AS num_value1,
      to_number(decode(a.num_value2,-999,NULL,a.num_value2)) AS num_value2,
      a.date_value1,
      a.date_value2
   from system.mview$_adv_filterinstance a;

   COMMENT ON TABLE "SYSTEM"."MVIEW_FILTERINSTANCE"  IS 'Workload filter instance records';
--------------------------------------------------------
--  DDL for View MVIEW_LOG
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_LOG" ("ID", "FILTERID", "RUN_BEGIN", "RUN_END", "TYPE", "STATUS", "MESSAGE", "COMPLETED", "TOTAL", "ERROR_CODE") AS 
  select
      m.runid# as id,
      m.filterid# as filterid,
      m.run_begin,
      m.run_end,
      decode(m.run_type,1,'EVALUATE',2,'EVALUATE_W',3,'RECOMMEND',
                      4,'RECOMMEND_W',5,'VALIDATE',6,'WORKLOAD',
                      7,'FILTER','UNKNOWN') AS type,
      decode(m.status,0,'UNUSED',1,'CANCELLED',2,'IN_PROGRESS',3,'COMPLETED',
                    4,'ERROR','UNKNOWN') AS status,
      m.message,
      m.completed,
      m.total,
      m.error_code
   from system.mview$_adv_log m, all_users u
   where m.uname = u.username
   and   u.user_id = userenv('SCHEMAID');

   COMMENT ON TABLE "SYSTEM"."MVIEW_LOG"  IS 'Advisor session log';
--------------------------------------------------------
--  DDL for View MVIEW_RECOMMENDATIONS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_RECOMMENDATIONS" ("RUNID", "ALL_TABLES", "FACT_TABLES", "GROUPING_LEVELS", "QUERY_TEXT", "RECOMMENDATION_NUMBER", "RECOMMENDED_ACTION", "MVIEW_OWNER", "MVIEW_NAME", "STORAGE_IN_BYTES", "PCT_PERFORMANCE_GAIN", "BENEFIT_TO_COST_RATIO") AS 
  select
  t1.runid# as runid,
  t1.from_clause as all_tables,
  fact_tables,
  grouping_levels,
  query_text,
  rank# as recommendation_number,
  action_type as recommended_action,
  summary_owner as mview_owner,
  summary_name as mview_name,
  storage_in_bytes,
  pct_performance_gain,
  benefit_to_cost_ratio
from SYSTEM.MVIEW$_ADV_OUTPUT t1, SYSTEM.MVIEW$_ADV_LOG t2, ALL_USERS u
where
  t1.runid# = t2.runid# and
  u.username = t2.uname and
  u.user_id = userenv('SCHEMAID') and
  t1.output_type = 0
order by t1.rank#;

   COMMENT ON TABLE "SYSTEM"."MVIEW_RECOMMENDATIONS"  IS 'This view gives DBA access to summary recommendations';
--------------------------------------------------------
--  DDL for View MVIEW_WORKLOAD
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_WORKLOAD" ("WORKLOADID", "IMPORT_TIME", "QUERYID", "APPLICATION", "CARDINALITY", "RESULTSIZE", "LASTUSE", "FREQUENCY", "OWNER", "PRIORITY", "QUERY", "RESPONSETIME") AS 
  select
  a.collectionid# as workloadid,
  a.collecttime as import_time,
  a.queryid# as queryid,
  a.application,
  a.cardinality,
  a.resultsize,
  a.qdate as lastuse,
  a.frequency,
  a.uname as owner,
  a.priority,
  a.sql_text as query,
  a.exec_time as responsetime
from SYSTEM.MVIEW$_ADV_WORKLOAD A, SYSTEM.MVIEW$_ADV_LOG B, ALL_USERS D
WHERE a.collectionid# = b.runid#
AND b.uname = d.username
AND d.user_id = userenv('SCHEMAID');

   COMMENT ON TABLE "SYSTEM"."MVIEW_WORKLOAD"  IS 'This view gives DBA access to shared workload';
--------------------------------------------------------
--  DDL for View PRODUCT_PRIVS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."PRODUCT_PRIVS" ("PRODUCT", "USERID", "ATTRIBUTE", "SCOPE", "NUMERIC_VALUE", "CHAR_VALUE", "DATE_VALUE", "LONG_VALUE") AS 
  SELECT PRODUCT, USERID, ATTRIBUTE, SCOPE,
         NUMERIC_VALUE, CHAR_VALUE, DATE_VALUE, LONG_VALUE
  FROM SQLPLUS_PRODUCT_PROFILE
  WHERE USERID = 'PUBLIC' OR USER LIKE USERID;
--------------------------------------------------------
--  DDL for Index SYS_C0034709
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2PM"."SYS_C0034709" ON "I2B2PM"."PM_CELL_PARAMS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0034712
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2PM"."SYS_C0034712" ON "I2B2PM"."PM_GLOBAL_PARAMS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0034716
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2PM"."SYS_C0034716" ON "I2B2PM"."PM_HIVE_PARAMS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0034720
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2PM"."SYS_C0034720" ON "I2B2PM"."PM_PROJECT_PARAMS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0034724
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2PM"."SYS_C0034724" ON "I2B2PM"."PM_PROJECT_USER_PARAMS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0034731
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2PM"."SYS_C0034731" ON "I2B2PM"."PM_USER_PARAMS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0034742
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2PM"."SYS_C0034742" ON "I2B2PM"."PM_PROJECT_REQUEST" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0034746
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2PM"."SYS_C0034746" ON "I2B2PM"."PM_APPROVALS_PARAMS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0034747
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2PM"."SYS_C0034747" ON "I2B2PM"."PM_USER_SESSION" ("SESSION_ID", "USER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0034748
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2PM"."SYS_C0034748" ON "I2B2PM"."PM_USER_LOGIN" ("ENTRY_DATE", "USER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0034749
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2PM"."SYS_C0034749" ON "I2B2PM"."PM_CELL_DATA" ("CELL_ID", "PROJECT_PATH") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0034750
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2PM"."SYS_C0034750" ON "I2B2PM"."PM_HIVE_DATA" ("DOMAIN_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0034751
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2PM"."SYS_C0034751" ON "I2B2PM"."PM_PROJECT_DATA" ("PROJECT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0034752
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2PM"."SYS_C0034752" ON "I2B2PM"."PM_PROJECT_USER_ROLES" ("PROJECT_ID", "USER_ID", "USER_ROLE_CD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0034753
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2PM"."SYS_C0034753" ON "I2B2PM"."PM_ROLE_REQUIREMENT" ("TABLE_CD", "COLUMN_CD", "READ_HIVEMGMT_CD", "WRITE_HIVEMGMT_CD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0034754
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2PM"."SYS_C0034754" ON "I2B2PM"."PM_USER_DATA" ("USER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table PM_APPROVALS
--------------------------------------------------------

  ALTER TABLE "I2B2PM"."PM_APPROVALS" MODIFY ("APPROVAL_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PM_APPROVALS_PARAMS
--------------------------------------------------------

  ALTER TABLE "I2B2PM"."PM_APPROVALS_PARAMS" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "I2B2PM"."PM_APPROVALS_PARAMS" MODIFY ("PARAM_NAME_CD" NOT NULL ENABLE);
  ALTER TABLE "I2B2PM"."PM_APPROVALS_PARAMS" MODIFY ("APPROVAL_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PM_CELL_DATA
--------------------------------------------------------

  ALTER TABLE "I2B2PM"."PM_CELL_DATA" ADD PRIMARY KEY ("CELL_ID", "PROJECT_PATH")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "I2B2PM"."PM_CELL_DATA" MODIFY ("PROJECT_PATH" NOT NULL ENABLE);
  ALTER TABLE "I2B2PM"."PM_CELL_DATA" MODIFY ("CELL_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PM_CELL_PARAMS
--------------------------------------------------------

  ALTER TABLE "I2B2PM"."PM_CELL_PARAMS" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "I2B2PM"."PM_CELL_PARAMS" MODIFY ("PARAM_NAME_CD" NOT NULL ENABLE);
  ALTER TABLE "I2B2PM"."PM_CELL_PARAMS" MODIFY ("PROJECT_PATH" NOT NULL ENABLE);
  ALTER TABLE "I2B2PM"."PM_CELL_PARAMS" MODIFY ("CELL_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PM_GLOBAL_PARAMS
--------------------------------------------------------

  ALTER TABLE "I2B2PM"."PM_GLOBAL_PARAMS" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "I2B2PM"."PM_GLOBAL_PARAMS" MODIFY ("PROJECT_PATH" NOT NULL ENABLE);
  ALTER TABLE "I2B2PM"."PM_GLOBAL_PARAMS" MODIFY ("PARAM_NAME_CD" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PM_HIVE_DATA
--------------------------------------------------------

  ALTER TABLE "I2B2PM"."PM_HIVE_DATA" ADD PRIMARY KEY ("DOMAIN_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "I2B2PM"."PM_HIVE_DATA" MODIFY ("DOMAIN_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PM_HIVE_PARAMS
--------------------------------------------------------

  ALTER TABLE "I2B2PM"."PM_HIVE_PARAMS" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "I2B2PM"."PM_HIVE_PARAMS" MODIFY ("PARAM_NAME_CD" NOT NULL ENABLE);
  ALTER TABLE "I2B2PM"."PM_HIVE_PARAMS" MODIFY ("DOMAIN_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PM_PROJECT_DATA
--------------------------------------------------------

  ALTER TABLE "I2B2PM"."PM_PROJECT_DATA" ADD PRIMARY KEY ("PROJECT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "I2B2PM"."PM_PROJECT_DATA" MODIFY ("PROJECT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PM_PROJECT_PARAMS
--------------------------------------------------------

  ALTER TABLE "I2B2PM"."PM_PROJECT_PARAMS" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "I2B2PM"."PM_PROJECT_PARAMS" MODIFY ("PARAM_NAME_CD" NOT NULL ENABLE);
  ALTER TABLE "I2B2PM"."PM_PROJECT_PARAMS" MODIFY ("PROJECT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PM_PROJECT_REQUEST
--------------------------------------------------------

  ALTER TABLE "I2B2PM"."PM_PROJECT_REQUEST" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "I2B2PM"."PM_PROJECT_REQUEST" MODIFY ("REQUEST_XML" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PM_PROJECT_USER_PARAMS
--------------------------------------------------------

  ALTER TABLE "I2B2PM"."PM_PROJECT_USER_PARAMS" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "I2B2PM"."PM_PROJECT_USER_PARAMS" MODIFY ("PARAM_NAME_CD" NOT NULL ENABLE);
  ALTER TABLE "I2B2PM"."PM_PROJECT_USER_PARAMS" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "I2B2PM"."PM_PROJECT_USER_PARAMS" MODIFY ("PROJECT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PM_PROJECT_USER_ROLES
--------------------------------------------------------

  ALTER TABLE "I2B2PM"."PM_PROJECT_USER_ROLES" ADD PRIMARY KEY ("PROJECT_ID", "USER_ID", "USER_ROLE_CD")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "I2B2PM"."PM_PROJECT_USER_ROLES" MODIFY ("USER_ROLE_CD" NOT NULL ENABLE);
  ALTER TABLE "I2B2PM"."PM_PROJECT_USER_ROLES" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "I2B2PM"."PM_PROJECT_USER_ROLES" MODIFY ("PROJECT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PM_ROLE_REQUIREMENT
--------------------------------------------------------

  ALTER TABLE "I2B2PM"."PM_ROLE_REQUIREMENT" ADD PRIMARY KEY ("TABLE_CD", "COLUMN_CD", "READ_HIVEMGMT_CD", "WRITE_HIVEMGMT_CD")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "I2B2PM"."PM_ROLE_REQUIREMENT" MODIFY ("WRITE_HIVEMGMT_CD" NOT NULL ENABLE);
  ALTER TABLE "I2B2PM"."PM_ROLE_REQUIREMENT" MODIFY ("READ_HIVEMGMT_CD" NOT NULL ENABLE);
  ALTER TABLE "I2B2PM"."PM_ROLE_REQUIREMENT" MODIFY ("COLUMN_CD" NOT NULL ENABLE);
  ALTER TABLE "I2B2PM"."PM_ROLE_REQUIREMENT" MODIFY ("TABLE_CD" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PM_USER_DATA
--------------------------------------------------------

  ALTER TABLE "I2B2PM"."PM_USER_DATA" ADD PRIMARY KEY ("USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "I2B2PM"."PM_USER_DATA" MODIFY ("USER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PM_USER_LOGIN
--------------------------------------------------------

  ALTER TABLE "I2B2PM"."PM_USER_LOGIN" ADD PRIMARY KEY ("ENTRY_DATE", "USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "I2B2PM"."PM_USER_LOGIN" MODIFY ("ENTRY_DATE" NOT NULL ENABLE);
  ALTER TABLE "I2B2PM"."PM_USER_LOGIN" MODIFY ("ATTEMPT_CD" NOT NULL ENABLE);
  ALTER TABLE "I2B2PM"."PM_USER_LOGIN" MODIFY ("USER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PM_USER_PARAMS
--------------------------------------------------------

  ALTER TABLE "I2B2PM"."PM_USER_PARAMS" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "I2B2PM"."PM_USER_PARAMS" MODIFY ("PARAM_NAME_CD" NOT NULL ENABLE);
  ALTER TABLE "I2B2PM"."PM_USER_PARAMS" MODIFY ("USER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PM_USER_SESSION
--------------------------------------------------------

  ALTER TABLE "I2B2PM"."PM_USER_SESSION" ADD PRIMARY KEY ("SESSION_ID", "USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "I2B2PM"."PM_USER_SESSION" MODIFY ("SESSION_ID" NOT NULL ENABLE);
  ALTER TABLE "I2B2PM"."PM_USER_SESSION" MODIFY ("USER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  DDL for Trigger PM_CELL_PARAMS_INC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "I2B2PM"."PM_CELL_PARAMS_INC" 
	BEFORE INSERT
	ON PM_CELL_PARAMS
	FOR EACH ROW
	BEGIN
	SELECT PM_PARAMS.NEXTVAL INTO :NEW.ID FROM DUAL;
END;

/
ALTER TRIGGER "I2B2PM"."PM_CELL_PARAMS_INC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PM_GLOBAL_PARAMS_INC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "I2B2PM"."PM_GLOBAL_PARAMS_INC" 
	BEFORE INSERT
	ON PM_GLOBAL_PARAMS
	REFERENCING NEW AS NEW
	FOR EACH ROW
	BEGIN
	SELECT PM_PARAMS.NEXTVAL INTO :NEW.ID FROM DUAL;
END;

/
ALTER TRIGGER "I2B2PM"."PM_GLOBAL_PARAMS_INC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PM_HIVE_PARAMS_INC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "I2B2PM"."PM_HIVE_PARAMS_INC" 
	BEFORE INSERT
	ON PM_HIVE_PARAMS
	FOR EACH ROW
	BEGIN
	SELECT PM_PARAMS.NEXTVAL INTO :NEW.ID FROM DUAL;
END;

/
ALTER TRIGGER "I2B2PM"."PM_HIVE_PARAMS_INC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PM_PROJECT_PARAMS_INC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "I2B2PM"."PM_PROJECT_PARAMS_INC" 
	BEFORE INSERT
	ON PM_PROJECT_PARAMS
	FOR EACH ROW
	BEGIN
	SELECT PM_PARAMS.NEXTVAL INTO :NEW.ID FROM DUAL;
END;

/
ALTER TRIGGER "I2B2PM"."PM_PROJECT_PARAMS_INC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PM_PROJECT_REQUEST_INC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "I2B2PM"."PM_PROJECT_REQUEST_INC" 
	BEFORE INSERT
	ON PM_PROJECT_REQUEST
	FOR EACH ROW
	BEGIN
	SELECT PM_PARAMS.NEXTVAL INTO :NEW.ID FROM DUAL;
END;

/
ALTER TRIGGER "I2B2PM"."PM_PROJECT_REQUEST_INC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PM_PROJECT_USER_PARAMS_INC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "I2B2PM"."PM_PROJECT_USER_PARAMS_INC" 
	BEFORE INSERT
	ON PM_PROJECT_USER_PARAMS
	FOR EACH ROW
	BEGIN
	SELECT PM_PARAMS.NEXTVAL INTO :NEW.ID FROM DUAL;
END;

/
ALTER TRIGGER "I2B2PM"."PM_PROJECT_USER_PARAMS_INC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PM_USER_PARAMS_INC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "I2B2PM"."PM_USER_PARAMS_INC" 
	BEFORE INSERT
	ON PM_USER_PARAMS
	FOR EACH ROW
	BEGIN
	SELECT PM_PARAMS.NEXTVAL INTO :NEW.ID FROM DUAL;
END;

/
ALTER TRIGGER "I2B2PM"."PM_USER_PARAMS_INC" ENABLE;
--------------------------------------------------------
--  DDL for Package DBMS_REPCAT_AUTH
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "SYSTEM"."DBMS_REPCAT_AUTH" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
9
bf d6
0cfc6e4Sm6mfaMYwsbW2JygBepcwg/BKmJ4VZy/pO06UXsVUMejsissTcGWYR4qeK4TPqfDK
q7UPH+SmKP6nW9zmxMZnuK1VDzM0Iv9O4E4SvvsnHWn+EPF9hR+oBFe3fEro6RQ5R5Ejd1nr
e+fAK010dExf76gg/c6ZB3YxGPHDOqkGI4lV6HNsd57gKLwTd0bxan5UwJriIpt7Vjc=

/
--------------------------------------------------------
--  DDL for Package Body DBMS_REPCAT_AUTH
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "SYSTEM"."DBMS_REPCAT_AUTH" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
b
b9d 39c
PBMGkNCh5NDAdLezCHsLvZaVi/swg5UrNSCDfI4Zvp0VB6GpRld+By6E2nVdlFHT2g2kK9zM
8jSnsuee7mkmJD+W3Mo36HQvUfOe7jH5vP7tu1i0jDykzR0pUhJZUcY6xVrSwNPoNVPcT72N
eHhGwyRBj2+0vKbgTmcZKBMJzETRfOl2YGDDVB3FvKBSixMMqfWSX8uh3wPGOi8W9vOASC3z
0UvPqL7KR78SykUEoBCxpMGmE8pgElC/dagmVpIIt7QA6sneMlNb2OO/1zTN44ACRsm+2JAo
zD41TcuGaNUqDYNDRbPEKzeRZeXxrx1UvOWsYTNaO6icaV/NrtZbmXpDuGA/sqnz4jnKFK8S
0VC+Yjh2iJEV5edD2+8pyMgx44NVDiAQ+sjjDkpGc0IxXrm/v52yduhnj/xnkualIm/RyAv0
Q/YzRAHy7NvyavbajIvCFoZWpbO3Jw8NwkoU25ysfgvXZJrw4vPjh4hHR4Mpto6jFMM+dZPW
3N9HL971bTBgyAL0BjASEFXe83D+IoBYX0VQVk5+t7p7iUsmfyK5t+cECNpNOL6UaACcsAYB
Le+yLOAqFHSvCXlWcECxG7wXjAA2/XmBwvKBNLcggXKVp3i9cNzab0Mq9qSAcIYgRFxRdAOe
sTDZNOx6HkJTbCRKCMiJzgjQQW476DlOZD+9Gwh+AA/Y3PIDOfyhlvXT6HsjW33mASJUuORB
la5Jb3rB4syO6QO2a5vSHu26Gwib2EflS8bqC1hZhpHsvM+mAaWJ2x72JyrPe8V7Ohjbre49
gRsjAtspIYfP5958sSnHdkz32nGAXnrEY95lEHGwkuXLlj9y6I21aAyd3/lJkuEAEBxzZVnm
IaNJBwl8u33+SqGLZzILy1QxmA+pF8yUaQ+yRU/5+3n1mY4=

/
--------------------------------------------------------
--  DDL for Procedure ORA$_SYS_REP_AUTH
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "SYSTEM"."ORA$_SYS_REP_AUTH" as
begin
  EXECUTE IMMEDIATE 'GRANT SELECT ON SYSTEM.repcat$_repschema TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON SYSTEM.repcat$_repprop TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON SYSTEM.def$_aqcall TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON SYSTEM.def$_calldest TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON SYSTEM.def$_error TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON SYSTEM.def$_destination TO SYS ' ||
                 'WITH GRANT OPTION';
end;

/
--------------------------------------------------------
--  DDL for Synonymn CATALOG
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."CATALOG" FOR "SYS"."CATALOG";
--------------------------------------------------------
--  DDL for Synonymn COL
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."COL" FOR "SYS"."COL";
--------------------------------------------------------
--  DDL for Synonymn PRODUCT_USER_PROFILE
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."PRODUCT_USER_PROFILE" FOR "SYSTEM"."SQLPLUS_PRODUCT_PROFILE";
--------------------------------------------------------
--  DDL for Synonymn PUBLICSYN
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."PUBLICSYN" FOR "SYS"."PUBLICSYN";
--------------------------------------------------------
--  DDL for Synonymn SYSCATALOG
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."SYSCATALOG" FOR "SYS"."SYSCATALOG";
--------------------------------------------------------
--  DDL for Synonymn SYSFILES
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."SYSFILES" FOR "SYS"."SYSFILES";
--------------------------------------------------------
--  DDL for Synonymn TAB
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."TAB" FOR "SYS"."TAB";
--------------------------------------------------------
--  DDL for Synonymn TABQUOTAS
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."TABQUOTAS" FOR "SYS"."TABQUOTAS";
--------------------------------------------------------
--  DDL for Queue DEF$_AQERROR
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE(
     Queue_name          => 'SYSTEM.DEF$_AQERROR',
     Queue_table         => 'SYSTEM.DEF$_AQERROR',
     Queue_type          =>  0,
     Max_retries         =>  5,
     Retry_delay         =>  0,
     dependency_tracking =>  TRUE,
     comment             => 'Error Queue for Deferred RPCs');
  END;
--------------------------------------------------------
--  DDL for Queue DEF$_AQCALL
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE(
     Queue_name          => 'SYSTEM.DEF$_AQCALL',
     Queue_table         => 'SYSTEM.DEF$_AQCALL',
     Queue_type          =>  0,
     Max_retries         =>  5,
     Retry_delay         =>  0,
     dependency_tracking =>  TRUE,
     comment             => 'Deferred RPC Queue');
  END;
--------------------------------------------------------
--  DDL for Queue Table DEF$_AQCALL
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE_TABLE(
     Queue_table        => '"SYSTEM"."DEF$_AQCALL"',
     Queue_payload_type => 'VARIANT',
     storage_clause     => 'PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 TABLESPACE SYSTEM',
     Sort_list          => 'ENQ_TIME',
     Compatible         => '8.0.3');
  END;
--------------------------------------------------------
--  DDL for Queue Table DEF$_AQERROR
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE_TABLE(
     Queue_table        => '"SYSTEM"."DEF$_AQERROR"',
     Queue_payload_type => 'VARIANT',
     storage_clause     => 'PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 TABLESPACE SYSTEM',
     Sort_list          => 'ENQ_TIME',
     Compatible         => '8.0.3');
  END;





--------------------------------------------------------
--  File created - Monday-November-24-2014   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Type REPCAT$_OBJECT_NULL_VECTOR
--------------------------------------------------------

  CREATE OR REPLACE TYPE "SYSTEM"."REPCAT$_OBJECT_NULL_VECTOR" AS OBJECT
(
  -- type owner, name, hashcode for the type represented by null_vector
  type_owner      VARCHAR2(30),
  type_name       VARCHAR2(30),
  type_hashcode   RAW(17),
  -- null_vector for a particular object instance
  -- ROBJ REVISIT: should only contain the null image, and not version#
  null_vector     RAW(2000)
)

/
--------------------------------------------------------
--  DDL for Sequence ONT_SQ_PS_PRID
--------------------------------------------------------

   CREATE SEQUENCE  "I2B2METADATA"."ONT_SQ_PS_PRID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table BIRN
--------------------------------------------------------

  CREATE TABLE "I2B2METADATA"."BIRN" 
   (	"C_HLEVEL" NUMBER(22,0), 
	"C_FULLNAME" VARCHAR2(700 BYTE), 
	"C_NAME" VARCHAR2(2000 BYTE), 
	"C_SYNONYM_CD" CHAR(1 BYTE), 
	"C_VISUALATTRIBUTES" CHAR(3 BYTE), 
	"C_TOTALNUM" NUMBER(22,0), 
	"C_BASECODE" VARCHAR2(50 BYTE), 
	"C_METADATAXML" CLOB, 
	"C_FACTTABLECOLUMN" VARCHAR2(50 BYTE), 
	"C_TABLENAME" VARCHAR2(50 BYTE), 
	"C_COLUMNNAME" VARCHAR2(50 BYTE), 
	"C_COLUMNDATATYPE" VARCHAR2(50 BYTE), 
	"C_OPERATOR" VARCHAR2(10 BYTE), 
	"C_DIMCODE" VARCHAR2(700 BYTE), 
	"C_COMMENT" CLOB, 
	"C_TOOLTIP" VARCHAR2(900 BYTE), 
	"M_APPLIED_PATH" VARCHAR2(700 BYTE), 
	"UPDATE_DATE" DATE, 
	"DOWNLOAD_DATE" DATE, 
	"IMPORT_DATE" DATE, 
	"SOURCESYSTEM_CD" VARCHAR2(50 BYTE), 
	"VALUETYPE_CD" VARCHAR2(50 BYTE), 
	"M_EXCLUSION_CD" VARCHAR2(25 BYTE), 
	"C_PATH" VARCHAR2(700 BYTE), 
	"C_SYMBOL" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("C_METADATAXML") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) 
 LOB ("C_COMMENT") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table CUSTOM_META
--------------------------------------------------------

  CREATE TABLE "I2B2METADATA"."CUSTOM_META" 
   (	"C_HLEVEL" NUMBER(22,0), 
	"C_FULLNAME" VARCHAR2(700 BYTE), 
	"C_NAME" VARCHAR2(2000 BYTE), 
	"C_SYNONYM_CD" CHAR(1 BYTE), 
	"C_VISUALATTRIBUTES" CHAR(3 BYTE), 
	"C_TOTALNUM" NUMBER(22,0), 
	"C_BASECODE" VARCHAR2(50 BYTE), 
	"C_METADATAXML" CLOB, 
	"C_FACTTABLECOLUMN" VARCHAR2(50 BYTE), 
	"C_TABLENAME" VARCHAR2(50 BYTE), 
	"C_COLUMNNAME" VARCHAR2(50 BYTE), 
	"C_COLUMNDATATYPE" VARCHAR2(50 BYTE), 
	"C_OPERATOR" VARCHAR2(10 BYTE), 
	"C_DIMCODE" VARCHAR2(700 BYTE), 
	"C_COMMENT" CLOB, 
	"C_TOOLTIP" VARCHAR2(900 BYTE), 
	"M_APPLIED_PATH" VARCHAR2(700 BYTE), 
	"UPDATE_DATE" DATE, 
	"DOWNLOAD_DATE" DATE, 
	"IMPORT_DATE" DATE, 
	"SOURCESYSTEM_CD" VARCHAR2(50 BYTE), 
	"VALUETYPE_CD" VARCHAR2(50 BYTE), 
	"M_EXCLUSION_CD" VARCHAR2(25 BYTE), 
	"C_PATH" VARCHAR2(700 BYTE), 
	"C_SYMBOL" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("C_METADATAXML") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) 
 LOB ("C_COMMENT") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table I2B2
--------------------------------------------------------

  CREATE TABLE "I2B2METADATA"."I2B2" 
   (	"C_HLEVEL" NUMBER(22,0), 
	"C_FULLNAME" VARCHAR2(700 BYTE), 
	"C_NAME" VARCHAR2(2000 BYTE), 
	"C_SYNONYM_CD" CHAR(1 BYTE), 
	"C_VISUALATTRIBUTES" CHAR(3 BYTE), 
	"C_TOTALNUM" NUMBER(22,0), 
	"C_BASECODE" VARCHAR2(50 BYTE), 
	"C_METADATAXML" CLOB, 
	"C_FACTTABLECOLUMN" VARCHAR2(50 BYTE), 
	"C_TABLENAME" VARCHAR2(50 BYTE), 
	"C_COLUMNNAME" VARCHAR2(50 BYTE), 
	"C_COLUMNDATATYPE" VARCHAR2(50 BYTE), 
	"C_OPERATOR" VARCHAR2(10 BYTE), 
	"C_DIMCODE" VARCHAR2(700 BYTE), 
	"C_COMMENT" CLOB, 
	"C_TOOLTIP" VARCHAR2(900 BYTE), 
	"M_APPLIED_PATH" VARCHAR2(700 BYTE), 
	"UPDATE_DATE" DATE, 
	"DOWNLOAD_DATE" DATE, 
	"IMPORT_DATE" DATE, 
	"SOURCESYSTEM_CD" VARCHAR2(50 BYTE), 
	"VALUETYPE_CD" VARCHAR2(50 BYTE), 
	"M_EXCLUSION_CD" VARCHAR2(25 BYTE), 
	"C_PATH" VARCHAR2(700 BYTE), 
	"C_SYMBOL" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("C_METADATAXML") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) 
 LOB ("C_COMMENT") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table ICD10_ICD9
--------------------------------------------------------

  CREATE TABLE "I2B2METADATA"."ICD10_ICD9" 
   (	"C_HLEVEL" NUMBER(22,0), 
	"C_FULLNAME" VARCHAR2(700 BYTE), 
	"C_NAME" VARCHAR2(2000 BYTE), 
	"C_SYNONYM_CD" CHAR(1 BYTE), 
	"C_VISUALATTRIBUTES" CHAR(3 BYTE), 
	"C_TOTALNUM" NUMBER(22,0), 
	"C_BASECODE" VARCHAR2(50 BYTE), 
	"C_METADATAXML" CLOB, 
	"C_FACTTABLECOLUMN" VARCHAR2(50 BYTE), 
	"C_TABLENAME" VARCHAR2(50 BYTE), 
	"C_COLUMNNAME" VARCHAR2(50 BYTE), 
	"C_COLUMNDATATYPE" VARCHAR2(50 BYTE), 
	"C_OPERATOR" VARCHAR2(10 BYTE), 
	"C_DIMCODE" VARCHAR2(700 BYTE), 
	"C_COMMENT" CLOB, 
	"C_TOOLTIP" VARCHAR2(900 BYTE), 
	"M_APPLIED_PATH" VARCHAR2(700 BYTE), 
	"UPDATE_DATE" DATE, 
	"DOWNLOAD_DATE" DATE, 
	"IMPORT_DATE" DATE, 
	"SOURCESYSTEM_CD" VARCHAR2(50 BYTE), 
	"VALUETYPE_CD" VARCHAR2(50 BYTE), 
	"M_EXCLUSION_CD" VARCHAR2(25 BYTE), 
	"C_PATH" VARCHAR2(700 BYTE), 
	"C_SYMBOL" VARCHAR2(50 BYTE), 
	"PLAIN_CODE" VARCHAR2(25 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("C_METADATAXML") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) 
 LOB ("C_COMMENT") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table ONT_PROCESS_STATUS
--------------------------------------------------------

  CREATE TABLE "I2B2METADATA"."ONT_PROCESS_STATUS" 
   (	"PROCESS_ID" NUMBER(5,0), 
	"PROCESS_TYPE_CD" VARCHAR2(50 BYTE), 
	"START_DATE" DATE, 
	"END_DATE" DATE, 
	"PROCESS_STEP_CD" VARCHAR2(50 BYTE), 
	"PROCESS_STATUS_CD" VARCHAR2(50 BYTE), 
	"CRC_UPLOAD_ID" NUMBER(38,0), 
	"STATUS_CD" VARCHAR2(50 BYTE), 
	"MESSAGE" CLOB, 
	"ENTRY_DATE" DATE, 
	"CHANGE_DATE" DATE, 
	"CHANGEDBY_CHAR" CHAR(50 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("MESSAGE") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) ;
--------------------------------------------------------
--  DDL for Table SCHEMES
--------------------------------------------------------

  CREATE TABLE "I2B2METADATA"."SCHEMES" 
   (	"C_KEY" VARCHAR2(50 BYTE), 
	"C_NAME" VARCHAR2(50 BYTE), 
	"C_DESCRIPTION" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TABLE_ACCESS
--------------------------------------------------------

  CREATE TABLE "I2B2METADATA"."TABLE_ACCESS" 
   (	"C_TABLE_CD" VARCHAR2(50 BYTE), 
	"C_TABLE_NAME" VARCHAR2(50 BYTE), 
	"C_PROTECTED_ACCESS" CHAR(1 BYTE), 
	"C_HLEVEL" NUMBER(22,0), 
	"C_FULLNAME" VARCHAR2(700 BYTE), 
	"C_NAME" VARCHAR2(2000 BYTE), 
	"C_SYNONYM_CD" CHAR(1 BYTE), 
	"C_VISUALATTRIBUTES" CHAR(3 BYTE), 
	"C_TOTALNUM" NUMBER(22,0), 
	"C_BASECODE" VARCHAR2(50 BYTE), 
	"C_METADATAXML" CLOB, 
	"C_FACTTABLECOLUMN" VARCHAR2(50 BYTE), 
	"C_DIMTABLENAME" VARCHAR2(50 BYTE), 
	"C_COLUMNNAME" VARCHAR2(50 BYTE), 
	"C_COLUMNDATATYPE" VARCHAR2(50 BYTE), 
	"C_OPERATOR" VARCHAR2(10 BYTE), 
	"C_DIMCODE" VARCHAR2(700 BYTE), 
	"C_COMMENT" CLOB, 
	"C_TOOLTIP" VARCHAR2(900 BYTE), 
	"C_ENTRY_DATE" DATE, 
	"C_CHANGE_DATE" DATE, 
	"C_STATUS_CD" CHAR(1 BYTE), 
	"VALUETYPE_CD" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("C_METADATAXML") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) 
 LOB ("C_COMMENT") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for View AQ$DEF$_AQCALL
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."AQ$DEF$_AQCALL" ("QUEUE", "MSG_ID", "CORR_ID", "MSG_PRIORITY", "MSG_STATE", "DELAY", "DELAY_TIMESTAMP", "EXPIRATION", "ENQ_TIME", "ENQ_TIMESTAMP", "ENQ_USER_ID", "ENQ_TXN_ID", "DEQ_TIME", "DEQ_TIMESTAMP", "DEQ_USER_ID", "DEQ_TXN_ID", "RETRY_COUNT", "EXCEPTION_QUEUE_OWNER", "EXCEPTION_QUEUE", "USER_DATA", "ORIGINAL_QUEUE_NAME", "ORIGINAL_QUEUE_OWNER", "EXPIRATION_REASON") AS 
  SELECT q_name QUEUE, msgid MSG_ID, corrid CORR_ID, priority MSG_PRIORITY, decode(state, 0,   'READY',
                                1,   'WAIT',
                                2,   'PROCESSED',
                                3,   'EXPIRED',
                                10,  'BUFFERED_EXPIRED') MSG_STATE, cast(FROM_TZ(delay, '00:00')
                  at time zone sessiontimezone as date) DELAY, cast(FROM_TZ(delay, '00:00')
               at time zone sessiontimezone as timestamp) DELAY_TIMESTAMP, expiration, cast(FROM_TZ(enq_time, '00:00')
                  at time zone sessiontimezone as date) ENQ_TIME, cast(FROM_TZ(enq_time, '00:00')
                  at time zone sessiontimezone as timestamp) 
                  ENQ_TIMESTAMP, enq_uid ENQ_USER_ID, enq_tid ENQ_TXN_ID, cast(FROM_TZ(deq_time, '00:00')
                  at time zone sessiontimezone as date) DEQ_TIME, cast(FROM_TZ(deq_time, '00:00')
                  at time zone sessiontimezone as timestamp) 
                  DEQ_TIMESTAMP, deq_uid DEQ_USER_ID, deq_tid DEQ_TXN_ID, retry_count,  decode (state, 0, exception_qschema, 
                                  1, exception_qschema, 
                                  2, exception_qschema,  
                                  NULL) EXCEPTION_QUEUE_OWNER,  decode (state, 0, exception_queue, 
                                  1, exception_queue, 
                                  2, exception_queue,  
                                  NULL) EXCEPTION_QUEUE,  user_data,  decode (state, 3, 
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL, 
                             exception_queue), NULL)
                                ORIGINAL_QUEUE_NAME,  decode (state, 3, 
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL, 
                             exception_qschema), NULL)
                                ORIGINAL_QUEUE_OWNER,  decode(state, 3, 
                     decode(deq_time, NULL, 
                       decode(deq_tid, NULL,
                       decode (expiration , NULL , 'MAX_RETRY_EXCEEDED',
                            'TIME_EXPIRATION'),
                              'INVALID_TRANSACTION', NULL,
                              'MAX_RETRY_EXCEEDED'), NULL), NULL) 
                             EXPIRATION_REASON  FROM "DEF$_AQCALL" WHERE state != 7 AND   state != 9 WITH READ ONLY;
--------------------------------------------------------
--  DDL for View AQ$DEF$_AQERROR
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."AQ$DEF$_AQERROR" ("QUEUE", "MSG_ID", "CORR_ID", "MSG_PRIORITY", "MSG_STATE", "DELAY", "DELAY_TIMESTAMP", "EXPIRATION", "ENQ_TIME", "ENQ_TIMESTAMP", "ENQ_USER_ID", "ENQ_TXN_ID", "DEQ_TIME", "DEQ_TIMESTAMP", "DEQ_USER_ID", "DEQ_TXN_ID", "RETRY_COUNT", "EXCEPTION_QUEUE_OWNER", "EXCEPTION_QUEUE", "USER_DATA", "ORIGINAL_QUEUE_NAME", "ORIGINAL_QUEUE_OWNER", "EXPIRATION_REASON") AS 
  SELECT q_name QUEUE, msgid MSG_ID, corrid CORR_ID, priority MSG_PRIORITY, decode(state, 0,   'READY',
                                1,   'WAIT',
                                2,   'PROCESSED',
                                3,   'EXPIRED',
                                10,  'BUFFERED_EXPIRED') MSG_STATE, cast(FROM_TZ(delay, '00:00')
                  at time zone sessiontimezone as date) DELAY, cast(FROM_TZ(delay, '00:00')
               at time zone sessiontimezone as timestamp) DELAY_TIMESTAMP, expiration, cast(FROM_TZ(enq_time, '00:00')
                  at time zone sessiontimezone as date) ENQ_TIME, cast(FROM_TZ(enq_time, '00:00')
                  at time zone sessiontimezone as timestamp) 
                  ENQ_TIMESTAMP, enq_uid ENQ_USER_ID, enq_tid ENQ_TXN_ID, cast(FROM_TZ(deq_time, '00:00')
                  at time zone sessiontimezone as date) DEQ_TIME, cast(FROM_TZ(deq_time, '00:00')
                  at time zone sessiontimezone as timestamp) 
                  DEQ_TIMESTAMP, deq_uid DEQ_USER_ID, deq_tid DEQ_TXN_ID, retry_count,  decode (state, 0, exception_qschema, 
                                  1, exception_qschema, 
                                  2, exception_qschema,  
                                  NULL) EXCEPTION_QUEUE_OWNER,  decode (state, 0, exception_queue, 
                                  1, exception_queue, 
                                  2, exception_queue,  
                                  NULL) EXCEPTION_QUEUE,  user_data,  decode (state, 3, 
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL, 
                             exception_queue), NULL)
                                ORIGINAL_QUEUE_NAME,  decode (state, 3, 
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL, 
                             exception_qschema), NULL)
                                ORIGINAL_QUEUE_OWNER,  decode(state, 3, 
                     decode(deq_time, NULL, 
                       decode(deq_tid, NULL,
                       decode (expiration , NULL , 'MAX_RETRY_EXCEEDED',
                            'TIME_EXPIRATION'),
                              'INVALID_TRANSACTION', NULL,
                              'MAX_RETRY_EXCEEDED'), NULL), NULL) 
                             EXPIRATION_REASON  FROM "DEF$_AQERROR" WHERE state != 7 AND   state != 9 WITH READ ONLY;
--------------------------------------------------------
--  DDL for View AQ$_DEF$_AQCALL_F
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."AQ$_DEF$_AQCALL_F" ("Q_NAME", "ROW_ID", "MSGID", "CORRID", "PRIORITY", "STATE", "DELAY", "EXPIRATION", "ENQ_TIME", "ENQ_UID", "ENQ_TID", "DEQ_TIME", "DEQ_UID", "DEQ_TID", "RETRY_COUNT", "EXCEPTION_QSCHEMA", "EXCEPTION_QUEUE", "CSCN", "DSCN", "CHAIN_NO", "LOCAL_ORDER_NO", "TIME_MANAGER_INFO", "STEP_NO", "USER_DATA", "QUEUE_ID") AS 
  SELECT  /*+ NO_MERGE (qo) USE_NL(qt) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, '00:00') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, '00:00') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, '00:00') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, '00:00') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA , qo.qid QUEUE_ID  FROM "DEF$_AQCALL" qt, SYS.ALL_INT_DEQUEUE_QUEUES  qo  WHERE qt.q_name = qo.name AND qo.owner = 'SYSTEM' WITH READ ONLY;
--------------------------------------------------------
--  DDL for View AQ$_DEF$_AQERROR_F
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."AQ$_DEF$_AQERROR_F" ("Q_NAME", "ROW_ID", "MSGID", "CORRID", "PRIORITY", "STATE", "DELAY", "EXPIRATION", "ENQ_TIME", "ENQ_UID", "ENQ_TID", "DEQ_TIME", "DEQ_UID", "DEQ_TID", "RETRY_COUNT", "EXCEPTION_QSCHEMA", "EXCEPTION_QUEUE", "CSCN", "DSCN", "CHAIN_NO", "LOCAL_ORDER_NO", "TIME_MANAGER_INFO", "STEP_NO", "USER_DATA", "QUEUE_ID") AS 
  SELECT  /*+ NO_MERGE (qo) USE_NL(qt) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, '00:00') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, '00:00') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, '00:00') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, '00:00') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA , qo.qid QUEUE_ID  FROM "DEF$_AQERROR" qt, SYS.ALL_INT_DEQUEUE_QUEUES  qo  WHERE qt.q_name = qo.name AND qo.owner = 'SYSTEM' WITH READ ONLY;
--------------------------------------------------------
--  DDL for View MVIEW_EVALUATIONS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_EVALUATIONS" ("RUNID", "MVIEW_OWNER", "MVIEW_NAME", "RANK", "STORAGE_IN_BYTES", "FREQUENCY", "CUMULATIVE_BENEFIT", "BENEFIT_TO_COST_RATIO") AS 
  select
  t1.runid# as runid,
  summary_owner AS mview_owner,
  summary_name AS mview_name,
  rank# as rank,
  storage_in_bytes,
  frequency,
  cumulative_benefit,
  benefit_to_cost_ratio
from SYSTEM.MVIEW$_ADV_OUTPUT t1, SYSTEM.MVIEW$_ADV_LOG t2, ALL_USERS u
where
  t1.runid# = t2.runid# and
  u.username = t2.uname and
  u.user_id = userenv('SCHEMAID') and
  t1.output_type = 1
order by t1.rank#;

   COMMENT ON TABLE "SYSTEM"."MVIEW_EVALUATIONS"  IS 'This view gives DBA access to summary evaluation output';
--------------------------------------------------------
--  DDL for View MVIEW_EXCEPTIONS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_EXCEPTIONS" ("RUNID", "OWNER", "TABLE_NAME", "DIMENSION_NAME", "RELATIONSHIP", "BAD_ROWID") AS 
  select
  t1.runid# as runid,
  owner,
  table_name,
  dimension_name,
  relationship,
  bad_rowid
from SYSTEM.MVIEW$_ADV_EXCEPTIONS t1, SYSTEM.MVIEW$_ADV_LOG t2, ALL_USERS u
where
  t1.runid# = t2.runid# and
  u.username = t2.uname and
  u.user_id = userenv('SCHEMAID');

   COMMENT ON TABLE "SYSTEM"."MVIEW_EXCEPTIONS"  IS 'This view gives DBA access to dimension validation results';
--------------------------------------------------------
--  DDL for View MVIEW_FILTER
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_FILTER" ("FILTERID", "SUBFILTERNUM", "SUBFILTERTYPE", "STR_VALUE", "NUM_VALUE1", "NUM_VALUE2", "DATE_VALUE1", "DATE_VALUE2") AS 
  select
      a.filterid# as filterid,
      a.subfilternum# as subfilternum,
      decode(a.subfiltertype,1,'APPLICATION',2,'CARDINALITY',3,'LASTUSE',
                             4,'FREQUENCY',5,'USER',6,'PRIORITY',7,'BASETABLE',
                             8,'RESPONSETIME',9,'COLLECTIONID',10,'TRACENAME',
                             11,'SCHEMA','UNKNOWN') AS subfiltertype,
      a.str_value,
      to_number(decode(a.num_value1,-999,NULL,a.num_value1)) AS num_value1,
      to_number(decode(a.num_value2,-999,NULL,a.num_value2)) AS num_value2,
      a.date_value1,
      a.date_value2
   from system.mview$_adv_filter a, system.mview$_adv_log b, ALL_USERS u
   WHERE a.filterid# = b.runid#
   AND b.uname = u.username
   AND u.user_id = userenv('SCHEMAID');

   COMMENT ON TABLE "SYSTEM"."MVIEW_FILTER"  IS 'Workload filter records';
--------------------------------------------------------
--  DDL for View MVIEW_FILTERINSTANCE
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_FILTERINSTANCE" ("RUNID", "FILTERID", "SUBFILTERNUM", "SUBFILTERTYPE", "STR_VALUE", "NUM_VALUE1", "NUM_VALUE2", "DATE_VALUE1", "DATE_VALUE2") AS 
  select
      a.runid# as runid,
      a.filterid# as filterid,
      a.subfilternum# as subfilternum,
      decode(a.subfiltertype,1,'APPLICATION',2,'CARDINALITY',3,'LASTUSE',
                             4,'FREQUENCY',5,'USER',6,'PRIORITY',7,'BASETABLE',
                             8,'RESPONSETIME',9,'COLLECTIONID',10,'TRACENAME',
                             11,'SCHEMA','UNKNOWN') AS subfiltertype,
      a.str_value,
      to_number(decode(a.num_value1,-999,NULL,a.num_value1)) AS num_value1,
      to_number(decode(a.num_value2,-999,NULL,a.num_value2)) AS num_value2,
      a.date_value1,
      a.date_value2
   from system.mview$_adv_filterinstance a;

   COMMENT ON TABLE "SYSTEM"."MVIEW_FILTERINSTANCE"  IS 'Workload filter instance records';
--------------------------------------------------------
--  DDL for View MVIEW_LOG
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_LOG" ("ID", "FILTERID", "RUN_BEGIN", "RUN_END", "TYPE", "STATUS", "MESSAGE", "COMPLETED", "TOTAL", "ERROR_CODE") AS 
  select
      m.runid# as id,
      m.filterid# as filterid,
      m.run_begin,
      m.run_end,
      decode(m.run_type,1,'EVALUATE',2,'EVALUATE_W',3,'RECOMMEND',
                      4,'RECOMMEND_W',5,'VALIDATE',6,'WORKLOAD',
                      7,'FILTER','UNKNOWN') AS type,
      decode(m.status,0,'UNUSED',1,'CANCELLED',2,'IN_PROGRESS',3,'COMPLETED',
                    4,'ERROR','UNKNOWN') AS status,
      m.message,
      m.completed,
      m.total,
      m.error_code
   from system.mview$_adv_log m, all_users u
   where m.uname = u.username
   and   u.user_id = userenv('SCHEMAID');

   COMMENT ON TABLE "SYSTEM"."MVIEW_LOG"  IS 'Advisor session log';
--------------------------------------------------------
--  DDL for View MVIEW_RECOMMENDATIONS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_RECOMMENDATIONS" ("RUNID", "ALL_TABLES", "FACT_TABLES", "GROUPING_LEVELS", "QUERY_TEXT", "RECOMMENDATION_NUMBER", "RECOMMENDED_ACTION", "MVIEW_OWNER", "MVIEW_NAME", "STORAGE_IN_BYTES", "PCT_PERFORMANCE_GAIN", "BENEFIT_TO_COST_RATIO") AS 
  select
  t1.runid# as runid,
  t1.from_clause as all_tables,
  fact_tables,
  grouping_levels,
  query_text,
  rank# as recommendation_number,
  action_type as recommended_action,
  summary_owner as mview_owner,
  summary_name as mview_name,
  storage_in_bytes,
  pct_performance_gain,
  benefit_to_cost_ratio
from SYSTEM.MVIEW$_ADV_OUTPUT t1, SYSTEM.MVIEW$_ADV_LOG t2, ALL_USERS u
where
  t1.runid# = t2.runid# and
  u.username = t2.uname and
  u.user_id = userenv('SCHEMAID') and
  t1.output_type = 0
order by t1.rank#;

   COMMENT ON TABLE "SYSTEM"."MVIEW_RECOMMENDATIONS"  IS 'This view gives DBA access to summary recommendations';
--------------------------------------------------------
--  DDL for View MVIEW_WORKLOAD
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_WORKLOAD" ("WORKLOADID", "IMPORT_TIME", "QUERYID", "APPLICATION", "CARDINALITY", "RESULTSIZE", "LASTUSE", "FREQUENCY", "OWNER", "PRIORITY", "QUERY", "RESPONSETIME") AS 
  select
  a.collectionid# as workloadid,
  a.collecttime as import_time,
  a.queryid# as queryid,
  a.application,
  a.cardinality,
  a.resultsize,
  a.qdate as lastuse,
  a.frequency,
  a.uname as owner,
  a.priority,
  a.sql_text as query,
  a.exec_time as responsetime
from SYSTEM.MVIEW$_ADV_WORKLOAD A, SYSTEM.MVIEW$_ADV_LOG B, ALL_USERS D
WHERE a.collectionid# = b.runid#
AND b.uname = d.username
AND d.user_id = userenv('SCHEMAID');

   COMMENT ON TABLE "SYSTEM"."MVIEW_WORKLOAD"  IS 'This view gives DBA access to shared workload';
--------------------------------------------------------
--  DDL for View PRODUCT_PRIVS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."PRODUCT_PRIVS" ("PRODUCT", "USERID", "ATTRIBUTE", "SCOPE", "NUMERIC_VALUE", "CHAR_VALUE", "DATE_VALUE", "LONG_VALUE") AS 
  SELECT PRODUCT, USERID, ATTRIBUTE, SCOPE,
         NUMERIC_VALUE, CHAR_VALUE, DATE_VALUE, LONG_VALUE
  FROM SQLPLUS_PRODUCT_PROFILE
  WHERE USERID = 'PUBLIC' OR USER LIKE USERID;
--------------------------------------------------------
--  DDL for Index META_APPLIED_PATH_BIRN_IDX
--------------------------------------------------------

  CREATE INDEX "I2B2METADATA"."META_APPLIED_PATH_BIRN_IDX" ON "I2B2METADATA"."BIRN" ("M_APPLIED_PATH") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index META_APPLIED_PATH_CUSTOM_IDX
--------------------------------------------------------

  CREATE INDEX "I2B2METADATA"."META_APPLIED_PATH_CUSTOM_IDX" ON "I2B2METADATA"."CUSTOM_META" ("M_APPLIED_PATH") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index META_APPLIED_PATH_I2B2_IDX
--------------------------------------------------------

  CREATE INDEX "I2B2METADATA"."META_APPLIED_PATH_I2B2_IDX" ON "I2B2METADATA"."I2B2" ("M_APPLIED_PATH") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index META_APPL_PATH_ICD10_ICD9_IDX
--------------------------------------------------------

  CREATE INDEX "I2B2METADATA"."META_APPL_PATH_ICD10_ICD9_IDX" ON "I2B2METADATA"."ICD10_ICD9" ("M_APPLIED_PATH") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index META_EXCLUSION_I2B2_IDX
--------------------------------------------------------

  CREATE INDEX "I2B2METADATA"."META_EXCLUSION_I2B2_IDX" ON "I2B2METADATA"."I2B2" ("M_EXCLUSION_CD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index META_EXCLUSION_ICD19_ICD9_IDX
--------------------------------------------------------

  CREATE INDEX "I2B2METADATA"."META_EXCLUSION_ICD19_ICD9_IDX" ON "I2B2METADATA"."ICD10_ICD9" ("M_EXCLUSION_CD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index META_FULLNAME_BIRN_IDX
--------------------------------------------------------

  CREATE INDEX "I2B2METADATA"."META_FULLNAME_BIRN_IDX" ON "I2B2METADATA"."BIRN" ("C_FULLNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index META_FULLNAME_CUSTOM_IDX
--------------------------------------------------------

  CREATE INDEX "I2B2METADATA"."META_FULLNAME_CUSTOM_IDX" ON "I2B2METADATA"."CUSTOM_META" ("C_FULLNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index META_FULLNAME_I2B2_IDX
--------------------------------------------------------

  CREATE INDEX "I2B2METADATA"."META_FULLNAME_I2B2_IDX" ON "I2B2METADATA"."I2B2" ("C_FULLNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index META_FULLNAME_ICD10_ICD9_IDX
--------------------------------------------------------

  CREATE INDEX "I2B2METADATA"."META_FULLNAME_ICD10_ICD9_IDX" ON "I2B2METADATA"."ICD10_ICD9" ("C_FULLNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index META_HLEVEL_I2B2_IDX
--------------------------------------------------------

  CREATE INDEX "I2B2METADATA"."META_HLEVEL_I2B2_IDX" ON "I2B2METADATA"."I2B2" ("C_HLEVEL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index META_HLEVEL_ICD10_ICD9_IDX
--------------------------------------------------------

  CREATE INDEX "I2B2METADATA"."META_HLEVEL_ICD10_ICD9_IDX" ON "I2B2METADATA"."ICD10_ICD9" ("C_HLEVEL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index META_SYNONYM_I2B2_IDX
--------------------------------------------------------

  CREATE INDEX "I2B2METADATA"."META_SYNONYM_I2B2_IDX" ON "I2B2METADATA"."I2B2" ("C_SYNONYM_CD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index META_SYNONYM_ICD10_ICD9_IDX
--------------------------------------------------------

  CREATE INDEX "I2B2METADATA"."META_SYNONYM_ICD10_ICD9_IDX" ON "I2B2METADATA"."ICD10_ICD9" ("C_SYNONYM_CD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SCHEMES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2METADATA"."SCHEMES_PK" ON "I2B2METADATA"."SCHEMES" ("C_KEY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0034690
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2METADATA"."SYS_C0034690" ON "I2B2METADATA"."ONT_PROCESS_STATUS" ("PROCESS_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table BIRN
--------------------------------------------------------

  ALTER TABLE "I2B2METADATA"."BIRN" MODIFY ("UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."BIRN" MODIFY ("M_APPLIED_PATH" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."BIRN" MODIFY ("C_DIMCODE" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."BIRN" MODIFY ("C_OPERATOR" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."BIRN" MODIFY ("C_COLUMNDATATYPE" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."BIRN" MODIFY ("C_COLUMNNAME" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."BIRN" MODIFY ("C_TABLENAME" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."BIRN" MODIFY ("C_FACTTABLECOLUMN" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."BIRN" MODIFY ("C_VISUALATTRIBUTES" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."BIRN" MODIFY ("C_SYNONYM_CD" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."BIRN" MODIFY ("C_NAME" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."BIRN" MODIFY ("C_FULLNAME" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."BIRN" MODIFY ("C_HLEVEL" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CUSTOM_META
--------------------------------------------------------

  ALTER TABLE "I2B2METADATA"."CUSTOM_META" MODIFY ("UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."CUSTOM_META" MODIFY ("M_APPLIED_PATH" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."CUSTOM_META" MODIFY ("C_DIMCODE" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."CUSTOM_META" MODIFY ("C_OPERATOR" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."CUSTOM_META" MODIFY ("C_COLUMNDATATYPE" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."CUSTOM_META" MODIFY ("C_COLUMNNAME" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."CUSTOM_META" MODIFY ("C_TABLENAME" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."CUSTOM_META" MODIFY ("C_FACTTABLECOLUMN" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."CUSTOM_META" MODIFY ("C_VISUALATTRIBUTES" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."CUSTOM_META" MODIFY ("C_SYNONYM_CD" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."CUSTOM_META" MODIFY ("C_NAME" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."CUSTOM_META" MODIFY ("C_FULLNAME" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."CUSTOM_META" MODIFY ("C_HLEVEL" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table I2B2
--------------------------------------------------------

  ALTER TABLE "I2B2METADATA"."I2B2" MODIFY ("UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."I2B2" MODIFY ("M_APPLIED_PATH" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."I2B2" MODIFY ("C_DIMCODE" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."I2B2" MODIFY ("C_OPERATOR" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."I2B2" MODIFY ("C_COLUMNDATATYPE" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."I2B2" MODIFY ("C_COLUMNNAME" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."I2B2" MODIFY ("C_TABLENAME" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."I2B2" MODIFY ("C_FACTTABLECOLUMN" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."I2B2" MODIFY ("C_VISUALATTRIBUTES" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."I2B2" MODIFY ("C_SYNONYM_CD" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."I2B2" MODIFY ("C_NAME" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."I2B2" MODIFY ("C_FULLNAME" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."I2B2" MODIFY ("C_HLEVEL" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ICD10_ICD9
--------------------------------------------------------

  ALTER TABLE "I2B2METADATA"."ICD10_ICD9" MODIFY ("UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."ICD10_ICD9" MODIFY ("M_APPLIED_PATH" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."ICD10_ICD9" MODIFY ("C_DIMCODE" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."ICD10_ICD9" MODIFY ("C_OPERATOR" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."ICD10_ICD9" MODIFY ("C_COLUMNDATATYPE" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."ICD10_ICD9" MODIFY ("C_COLUMNNAME" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."ICD10_ICD9" MODIFY ("C_TABLENAME" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."ICD10_ICD9" MODIFY ("C_FACTTABLECOLUMN" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."ICD10_ICD9" MODIFY ("C_VISUALATTRIBUTES" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."ICD10_ICD9" MODIFY ("C_SYNONYM_CD" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."ICD10_ICD9" MODIFY ("C_NAME" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."ICD10_ICD9" MODIFY ("C_FULLNAME" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."ICD10_ICD9" MODIFY ("C_HLEVEL" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ONT_PROCESS_STATUS
--------------------------------------------------------

  ALTER TABLE "I2B2METADATA"."ONT_PROCESS_STATUS" ADD PRIMARY KEY ("PROCESS_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCHEMES
--------------------------------------------------------

  ALTER TABLE "I2B2METADATA"."SCHEMES" ADD CONSTRAINT "SCHEMES_PK" PRIMARY KEY ("C_KEY")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "I2B2METADATA"."SCHEMES" MODIFY ("C_NAME" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."SCHEMES" MODIFY ("C_KEY" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TABLE_ACCESS
--------------------------------------------------------

  ALTER TABLE "I2B2METADATA"."TABLE_ACCESS" MODIFY ("C_DIMCODE" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."TABLE_ACCESS" MODIFY ("C_OPERATOR" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."TABLE_ACCESS" MODIFY ("C_COLUMNDATATYPE" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."TABLE_ACCESS" MODIFY ("C_COLUMNNAME" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."TABLE_ACCESS" MODIFY ("C_DIMTABLENAME" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."TABLE_ACCESS" MODIFY ("C_FACTTABLECOLUMN" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."TABLE_ACCESS" MODIFY ("C_VISUALATTRIBUTES" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."TABLE_ACCESS" MODIFY ("C_SYNONYM_CD" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."TABLE_ACCESS" MODIFY ("C_NAME" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."TABLE_ACCESS" MODIFY ("C_FULLNAME" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."TABLE_ACCESS" MODIFY ("C_HLEVEL" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."TABLE_ACCESS" MODIFY ("C_TABLE_NAME" NOT NULL ENABLE);
  ALTER TABLE "I2B2METADATA"."TABLE_ACCESS" MODIFY ("C_TABLE_CD" NOT NULL ENABLE);
--------------------------------------------------------
--  DDL for Package DBMS_REPCAT_AUTH
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "SYSTEM"."DBMS_REPCAT_AUTH" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
9
bf d6
0cfc6e4Sm6mfaMYwsbW2JygBepcwg/BKmJ4VZy/pO06UXsVUMejsissTcGWYR4qeK4TPqfDK
q7UPH+SmKP6nW9zmxMZnuK1VDzM0Iv9O4E4SvvsnHWn+EPF9hR+oBFe3fEro6RQ5R5Ejd1nr
e+fAK010dExf76gg/c6ZB3YxGPHDOqkGI4lV6HNsd57gKLwTd0bxan5UwJriIpt7Vjc=

/
--------------------------------------------------------
--  DDL for Package Body DBMS_REPCAT_AUTH
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "SYSTEM"."DBMS_REPCAT_AUTH" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
b
b9d 39c
PBMGkNCh5NDAdLezCHsLvZaVi/swg5UrNSCDfI4Zvp0VB6GpRld+By6E2nVdlFHT2g2kK9zM
8jSnsuee7mkmJD+W3Mo36HQvUfOe7jH5vP7tu1i0jDykzR0pUhJZUcY6xVrSwNPoNVPcT72N
eHhGwyRBj2+0vKbgTmcZKBMJzETRfOl2YGDDVB3FvKBSixMMqfWSX8uh3wPGOi8W9vOASC3z
0UvPqL7KR78SykUEoBCxpMGmE8pgElC/dagmVpIIt7QA6sneMlNb2OO/1zTN44ACRsm+2JAo
zD41TcuGaNUqDYNDRbPEKzeRZeXxrx1UvOWsYTNaO6icaV/NrtZbmXpDuGA/sqnz4jnKFK8S
0VC+Yjh2iJEV5edD2+8pyMgx44NVDiAQ+sjjDkpGc0IxXrm/v52yduhnj/xnkualIm/RyAv0
Q/YzRAHy7NvyavbajIvCFoZWpbO3Jw8NwkoU25ysfgvXZJrw4vPjh4hHR4Mpto6jFMM+dZPW
3N9HL971bTBgyAL0BjASEFXe83D+IoBYX0VQVk5+t7p7iUsmfyK5t+cECNpNOL6UaACcsAYB
Le+yLOAqFHSvCXlWcECxG7wXjAA2/XmBwvKBNLcggXKVp3i9cNzab0Mq9qSAcIYgRFxRdAOe
sTDZNOx6HkJTbCRKCMiJzgjQQW476DlOZD+9Gwh+AA/Y3PIDOfyhlvXT6HsjW33mASJUuORB
la5Jb3rB4syO6QO2a5vSHu26Gwib2EflS8bqC1hZhpHsvM+mAaWJ2x72JyrPe8V7Ohjbre49
gRsjAtspIYfP5958sSnHdkz32nGAXnrEY95lEHGwkuXLlj9y6I21aAyd3/lJkuEAEBxzZVnm
IaNJBwl8u33+SqGLZzILy1QxmA+pF8yUaQ+yRU/5+3n1mY4=

/
--------------------------------------------------------
--  DDL for Procedure ORA$_SYS_REP_AUTH
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "SYSTEM"."ORA$_SYS_REP_AUTH" as
begin
  EXECUTE IMMEDIATE 'GRANT SELECT ON SYSTEM.repcat$_repschema TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON SYSTEM.repcat$_repprop TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON SYSTEM.def$_aqcall TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON SYSTEM.def$_calldest TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON SYSTEM.def$_error TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON SYSTEM.def$_destination TO SYS ' ||
                 'WITH GRANT OPTION';
end;

/
--------------------------------------------------------
--  DDL for Synonymn CATALOG
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."CATALOG" FOR "SYS"."CATALOG";
--------------------------------------------------------
--  DDL for Synonymn COL
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."COL" FOR "SYS"."COL";
--------------------------------------------------------
--  DDL for Synonymn PRODUCT_USER_PROFILE
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."PRODUCT_USER_PROFILE" FOR "SYSTEM"."SQLPLUS_PRODUCT_PROFILE";
--------------------------------------------------------
--  DDL for Synonymn PUBLICSYN
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."PUBLICSYN" FOR "SYS"."PUBLICSYN";
--------------------------------------------------------
--  DDL for Synonymn SYSCATALOG
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."SYSCATALOG" FOR "SYS"."SYSCATALOG";
--------------------------------------------------------
--  DDL for Synonymn SYSFILES
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."SYSFILES" FOR "SYS"."SYSFILES";
--------------------------------------------------------
--  DDL for Synonymn TAB
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."TAB" FOR "SYS"."TAB";
--------------------------------------------------------
--  DDL for Synonymn TABQUOTAS
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."TABQUOTAS" FOR "SYS"."TABQUOTAS";
--------------------------------------------------------
--  DDL for Queue DEF$_AQERROR
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE(
     Queue_name          => 'SYSTEM.DEF$_AQERROR',
     Queue_table         => 'SYSTEM.DEF$_AQERROR',
     Queue_type          =>  0,
     Max_retries         =>  5,
     Retry_delay         =>  0,
     dependency_tracking =>  TRUE,
     comment             => 'Error Queue for Deferred RPCs');
  END;
--------------------------------------------------------
--  DDL for Queue DEF$_AQCALL
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE(
     Queue_name          => 'SYSTEM.DEF$_AQCALL',
     Queue_table         => 'SYSTEM.DEF$_AQCALL',
     Queue_type          =>  0,
     Max_retries         =>  5,
     Retry_delay         =>  0,
     dependency_tracking =>  TRUE,
     comment             => 'Deferred RPC Queue');
  END;
--------------------------------------------------------
--  DDL for Queue Table DEF$_AQCALL
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE_TABLE(
     Queue_table        => '"SYSTEM"."DEF$_AQCALL"',
     Queue_payload_type => 'VARIANT',
     storage_clause     => 'PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 TABLESPACE SYSTEM',
     Sort_list          => 'ENQ_TIME',
     Compatible         => '8.0.3');
  END;
--------------------------------------------------------
--  DDL for Queue Table DEF$_AQERROR
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE_TABLE(
     Queue_table        => '"SYSTEM"."DEF$_AQERROR"',
     Queue_payload_type => 'VARIANT',
     storage_clause     => 'PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 TABLESPACE SYSTEM',
     Sort_list          => 'ENQ_TIME',
     Compatible         => '8.0.3');
  END;




--------------------------------------------------------
--  File created - Monday-November-24-2014   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Type QT_PDO_QRY_INT_ARRAY
--------------------------------------------------------

  CREATE OR REPLACE TYPE "I2B2DEMODATA"."QT_PDO_QRY_INT_ARRAY" AS varray(100000) of  NUMBER(20) 

/
--------------------------------------------------------
--  DDL for Type QT_PDO_QRY_STRING_ARRAY
--------------------------------------------------------

  CREATE OR REPLACE TYPE "I2B2DEMODATA"."QT_PDO_QRY_STRING_ARRAY" AS varray(100000) of  VARCHAR2(150) 

/
--------------------------------------------------------
--  DDL for Sequence QT_SQ_PQM_QMID
--------------------------------------------------------

   CREATE SEQUENCE  "I2B2DEMODATA"."QT_SQ_PQM_QMID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence QT_SQ_QI_QIID
--------------------------------------------------------

   CREATE SEQUENCE  "I2B2DEMODATA"."QT_SQ_QI_QIID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence QT_SQ_QM_QMID
--------------------------------------------------------

   CREATE SEQUENCE  "I2B2DEMODATA"."QT_SQ_QM_QMID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence QT_SQ_QPER_PECID
--------------------------------------------------------

   CREATE SEQUENCE  "I2B2DEMODATA"."QT_SQ_QPER_PECID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence QT_SQ_QPR_PCID
--------------------------------------------------------

   CREATE SEQUENCE  "I2B2DEMODATA"."QT_SQ_QPR_PCID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence QT_SQ_QRI_QRIID
--------------------------------------------------------

   CREATE SEQUENCE  "I2B2DEMODATA"."QT_SQ_QRI_QRIID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence QT_SQ_QR_QRID
--------------------------------------------------------

   CREATE SEQUENCE  "I2B2DEMODATA"."QT_SQ_QR_QRID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence QT_SQ_QS_QSID
--------------------------------------------------------

   CREATE SEQUENCE  "I2B2DEMODATA"."QT_SQ_QS_QSID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence QT_SQ_QXR_XRID
--------------------------------------------------------

   CREATE SEQUENCE  "I2B2DEMODATA"."QT_SQ_QXR_XRID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SQ_UPLOADSTATUS_UPLOADID
--------------------------------------------------------

   CREATE SEQUENCE  "I2B2DEMODATA"."SQ_UPLOADSTATUS_UPLOADID"  MINVALUE 1 MAXVALUE 9999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SQ_UP_ENCDIM_ENCOUNTERNUM
--------------------------------------------------------

   CREATE SEQUENCE  "I2B2DEMODATA"."SQ_UP_ENCDIM_ENCOUNTERNUM"  MINVALUE 1 MAXVALUE 9999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SQ_UP_PATDIM_PATIENTNUM
--------------------------------------------------------

   CREATE SEQUENCE  "I2B2DEMODATA"."SQ_UP_PATDIM_PATIENTNUM"  MINVALUE 1 MAXVALUE 9999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table ARCHIVE_OBSERVATION_FACT
--------------------------------------------------------

  CREATE TABLE "I2B2DEMODATA"."ARCHIVE_OBSERVATION_FACT" 
   (	"ENCOUNTER_NUM" NUMBER(38,0), 
	"PATIENT_NUM" NUMBER(38,0), 
	"CONCEPT_CD" VARCHAR2(50 BYTE), 
	"PROVIDER_ID" VARCHAR2(50 BYTE), 
	"START_DATE" DATE, 
	"MODIFIER_CD" VARCHAR2(100 BYTE), 
	"INSTANCE_NUM" NUMBER(18,0), 
	"VALTYPE_CD" VARCHAR2(50 BYTE), 
	"TVAL_CHAR" VARCHAR2(255 BYTE), 
	"NVAL_NUM" NUMBER(18,5), 
	"VALUEFLAG_CD" VARCHAR2(50 BYTE), 
	"QUANTITY_NUM" NUMBER(18,5), 
	"UNITS_CD" VARCHAR2(50 BYTE), 
	"END_DATE" DATE, 
	"LOCATION_CD" VARCHAR2(50 BYTE), 
	"OBSERVATION_BLOB" CLOB, 
	"CONFIDENCE_NUM" NUMBER(18,5), 
	"UPDATE_DATE" DATE, 
	"DOWNLOAD_DATE" DATE, 
	"IMPORT_DATE" DATE, 
	"SOURCESYSTEM_CD" VARCHAR2(50 BYTE), 
	"UPLOAD_ID" NUMBER(38,0), 
	"ARCHIVE_UPLOAD_ID" NUMBER(22,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING
  TABLESPACE "USERS" 
 LOB ("OBSERVATION_BLOB") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) ;
--------------------------------------------------------
--  DDL for Table CODE_LOOKUP
--------------------------------------------------------

  CREATE TABLE "I2B2DEMODATA"."CODE_LOOKUP" 
   (	"TABLE_CD" VARCHAR2(100 BYTE), 
	"COLUMN_CD" VARCHAR2(100 BYTE), 
	"CODE_CD" VARCHAR2(50 BYTE), 
	"NAME_CHAR" VARCHAR2(650 BYTE), 
	"LOOKUP_BLOB" CLOB, 
	"UPLOAD_DATE" DATE, 
	"UPDATE_DATE" DATE, 
	"DOWNLOAD_DATE" DATE, 
	"IMPORT_DATE" DATE, 
	"SOURCESYSTEM_CD" VARCHAR2(50 BYTE), 
	"UPLOAD_ID" NUMBER(38,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("LOOKUP_BLOB") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table CONCEPT_DIMENSION
--------------------------------------------------------

  CREATE TABLE "I2B2DEMODATA"."CONCEPT_DIMENSION" 
   (	"CONCEPT_PATH" VARCHAR2(700 BYTE), 
	"CONCEPT_CD" VARCHAR2(50 BYTE), 
	"NAME_CHAR" VARCHAR2(2000 BYTE), 
	"CONCEPT_BLOB" CLOB, 
	"UPDATE_DATE" DATE, 
	"DOWNLOAD_DATE" DATE, 
	"IMPORT_DATE" DATE, 
	"SOURCESYSTEM_CD" VARCHAR2(50 BYTE), 
	"UPLOAD_ID" NUMBER(38,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("CONCEPT_BLOB") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table DATAMART_REPORT
--------------------------------------------------------

  CREATE TABLE "I2B2DEMODATA"."DATAMART_REPORT" 
   (	"TOTAL_PATIENT" NUMBER(38,0), 
	"TOTAL_OBSERVATIONFACT" NUMBER(38,0), 
	"TOTAL_EVENT" NUMBER(38,0), 
	"REPORT_DATE" DATE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table DR$OF_CTX_BLOB$I
--------------------------------------------------------

  CREATE TABLE "I2B2DEMODATA"."DR$OF_CTX_BLOB$I" 
   (	"TOKEN_TEXT" VARCHAR2(64 BYTE), 
	"TOKEN_TYPE" NUMBER(10,0), 
	"TOKEN_FIRST" NUMBER(10,0), 
	"TOKEN_LAST" NUMBER(10,0), 
	"TOKEN_COUNT" NUMBER(10,0), 
	"TOKEN_INFO" BLOB
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("TOKEN_INFO") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) 
  MONITORING ;
--------------------------------------------------------
--  DDL for Table DR$OF_CTX_BLOB$K
--------------------------------------------------------

  CREATE TABLE "I2B2DEMODATA"."DR$OF_CTX_BLOB$K" 
   (	"DOCID" NUMBER(38,0), 
	"TEXTKEY" ROWID, 
	 PRIMARY KEY ("TEXTKEY") ENABLE
   ) ORGANIZATION INDEX NOCOMPRESS PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 PCTTHRESHOLD 50
  MONITORING ;
--------------------------------------------------------
--  DDL for Table DR$OF_CTX_BLOB$N
--------------------------------------------------------

  CREATE TABLE "I2B2DEMODATA"."DR$OF_CTX_BLOB$N" 
   (	"NLT_DOCID" NUMBER(38,0), 
	"NLT_MARK" CHAR(1 BYTE), 
	 PRIMARY KEY ("NLT_DOCID") ENABLE
   ) ORGANIZATION INDEX NOCOMPRESS PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 PCTTHRESHOLD 50
  MONITORING ;
--------------------------------------------------------
--  DDL for Table DR$OF_CTX_BLOB$R
--------------------------------------------------------

  CREATE TABLE "I2B2DEMODATA"."DR$OF_CTX_BLOB$R" 
   (	"ROW_NO" NUMBER(3,0), 
	"DATA" BLOB
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("DATA") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) 
  MONITORING ;
--------------------------------------------------------
--  DDL for Table DX
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "I2B2DEMODATA"."DX" 
   (	"ENCOUNTER_NUM" NUMBER(38,0), 
	"INSTANCE_NUM" NUMBER(38,0), 
	"PATIENT_NUM" NUMBER(38,0), 
	"CONCEPT_CD" VARCHAR2(50 BYTE), 
	"START_DATE" DATE, 
	"PROVIDER_ID" VARCHAR2(50 BYTE), 
	"TEMPORAL_START_DATE" DATE, 
	"TEMPORAL_END_DATE" DATE
   ) ON COMMIT PRESERVE ROWS ;
--------------------------------------------------------
--  DDL for Table ENCOUNTER_MAPPING
--------------------------------------------------------

  CREATE TABLE "I2B2DEMODATA"."ENCOUNTER_MAPPING" 
   (	"ENCOUNTER_IDE" VARCHAR2(200 BYTE), 
	"ENCOUNTER_IDE_SOURCE" VARCHAR2(50 BYTE), 
	"PROJECT_ID" VARCHAR2(50 BYTE), 
	"ENCOUNTER_NUM" NUMBER(38,0), 
	"PATIENT_IDE" VARCHAR2(200 BYTE), 
	"PATIENT_IDE_SOURCE" VARCHAR2(50 BYTE), 
	"ENCOUNTER_IDE_STATUS" VARCHAR2(50 BYTE), 
	"UPLOAD_DATE" DATE, 
	"UPDATE_DATE" DATE, 
	"DOWNLOAD_DATE" DATE, 
	"IMPORT_DATE" DATE, 
	"SOURCESYSTEM_CD" VARCHAR2(50 BYTE), 
	"UPLOAD_ID" NUMBER(38,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table GLOBAL_TEMP_FACT_PARAM_TABLE
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "I2B2DEMODATA"."GLOBAL_TEMP_FACT_PARAM_TABLE" 
   (	"SET_INDEX" NUMBER(*,0), 
	"CHAR_PARAM1" VARCHAR2(500 BYTE), 
	"CHAR_PARAM2" VARCHAR2(500 BYTE), 
	"NUM_PARAM1" NUMBER(*,0), 
	"NUM_PARAM2" NUMBER(*,0)
   ) ON COMMIT PRESERVE ROWS ;
--------------------------------------------------------
--  DDL for Table GLOBAL_TEMP_PARAM_TABLE
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "I2B2DEMODATA"."GLOBAL_TEMP_PARAM_TABLE" 
   (	"SET_INDEX" NUMBER(*,0), 
	"CHAR_PARAM1" VARCHAR2(500 BYTE), 
	"CHAR_PARAM2" VARCHAR2(500 BYTE), 
	"NUM_PARAM1" NUMBER(*,0), 
	"NUM_PARAM2" NUMBER(*,0)
   ) ON COMMIT PRESERVE ROWS ;
--------------------------------------------------------
--  DDL for Table MASTER_QUERY_GLOBAL_TEMP
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "I2B2DEMODATA"."MASTER_QUERY_GLOBAL_TEMP" 
   (	"ENCOUNTER_NUM" NUMBER(38,0), 
	"PATIENT_NUM" NUMBER(38,0), 
	"INSTANCE_NUM" NUMBER(18,0), 
	"CONCEPT_CD" VARCHAR2(50 BYTE), 
	"START_DATE" DATE, 
	"PROVIDER_ID" VARCHAR2(50 BYTE), 
	"MASTER_ID" VARCHAR2(50 BYTE), 
	"LEVEL_NO" NUMBER(5,0), 
	"TEMPORAL_START_DATE" DATE, 
	"TEMPORAL_END_DATE" DATE
   ) ON COMMIT PRESERVE ROWS ;
--------------------------------------------------------
--  DDL for Table MODIFIER_DIMENSION
--------------------------------------------------------

  CREATE TABLE "I2B2DEMODATA"."MODIFIER_DIMENSION" 
   (	"MODIFIER_PATH" VARCHAR2(700 BYTE), 
	"MODIFIER_CD" VARCHAR2(50 BYTE), 
	"NAME_CHAR" VARCHAR2(2000 BYTE), 
	"MODIFIER_BLOB" CLOB, 
	"UPDATE_DATE" DATE, 
	"DOWNLOAD_DATE" DATE, 
	"IMPORT_DATE" DATE, 
	"SOURCESYSTEM_CD" VARCHAR2(50 BYTE), 
	"UPLOAD_ID" NUMBER(38,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("MODIFIER_BLOB") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table OBSERVATION_FACT
--------------------------------------------------------

  CREATE TABLE "I2B2DEMODATA"."OBSERVATION_FACT" 
   (	"ENCOUNTER_NUM" NUMBER(38,0), 
	"PATIENT_NUM" NUMBER(38,0), 
	"CONCEPT_CD" VARCHAR2(50 BYTE), 
	"PROVIDER_ID" VARCHAR2(50 BYTE), 
	"START_DATE" DATE, 
	"MODIFIER_CD" VARCHAR2(100 BYTE) DEFAULT '@', 
	"INSTANCE_NUM" NUMBER(18,0) DEFAULT '1', 
	"VALTYPE_CD" VARCHAR2(50 BYTE), 
	"TVAL_CHAR" VARCHAR2(255 BYTE), 
	"NVAL_NUM" NUMBER(18,5), 
	"VALUEFLAG_CD" VARCHAR2(50 BYTE), 
	"QUANTITY_NUM" NUMBER(18,5), 
	"UNITS_CD" VARCHAR2(50 BYTE), 
	"END_DATE" DATE, 
	"LOCATION_CD" VARCHAR2(50 BYTE), 
	"OBSERVATION_BLOB" CLOB, 
	"CONFIDENCE_NUM" NUMBER(18,5), 
	"UPDATE_DATE" DATE, 
	"DOWNLOAD_DATE" DATE, 
	"IMPORT_DATE" DATE, 
	"SOURCESYSTEM_CD" VARCHAR2(50 BYTE), 
	"UPLOAD_ID" NUMBER(38,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("OBSERVATION_BLOB") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table PATIENT_DIMENSION
--------------------------------------------------------

  CREATE TABLE "I2B2DEMODATA"."PATIENT_DIMENSION" 
   (	"PATIENT_NUM" NUMBER(38,0), 
	"VITAL_STATUS_CD" VARCHAR2(50 BYTE), 
	"BIRTH_DATE" DATE, 
	"DEATH_DATE" DATE, 
	"SEX_CD" VARCHAR2(50 BYTE), 
	"AGE_IN_YEARS_NUM" NUMBER(38,0), 
	"LANGUAGE_CD" VARCHAR2(50 BYTE), 
	"RACE_CD" VARCHAR2(50 BYTE), 
	"MARITAL_STATUS_CD" VARCHAR2(50 BYTE), 
	"RELIGION_CD" VARCHAR2(50 BYTE), 
	"ZIP_CD" VARCHAR2(10 BYTE), 
	"STATECITYZIP_PATH" VARCHAR2(700 BYTE), 
	"INCOME_CD" VARCHAR2(50 BYTE), 
	"PATIENT_BLOB" CLOB, 
	"UPDATE_DATE" DATE, 
	"DOWNLOAD_DATE" DATE, 
	"IMPORT_DATE" DATE, 
	"SOURCESYSTEM_CD" VARCHAR2(50 BYTE), 
	"UPLOAD_ID" NUMBER(38,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("PATIENT_BLOB") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table PATIENT_MAPPING
--------------------------------------------------------

  CREATE TABLE "I2B2DEMODATA"."PATIENT_MAPPING" 
   (	"PATIENT_IDE" VARCHAR2(200 BYTE), 
	"PATIENT_IDE_SOURCE" VARCHAR2(50 BYTE), 
	"PATIENT_NUM" NUMBER(38,0), 
	"PATIENT_IDE_STATUS" VARCHAR2(50 BYTE), 
	"PROJECT_ID" VARCHAR2(50 BYTE), 
	"UPLOAD_DATE" DATE, 
	"UPDATE_DATE" DATE, 
	"DOWNLOAD_DATE" DATE, 
	"IMPORT_DATE" DATE, 
	"SOURCESYSTEM_CD" VARCHAR2(50 BYTE), 
	"UPLOAD_ID" NUMBER(38,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PROVIDER_DIMENSION
--------------------------------------------------------

  CREATE TABLE "I2B2DEMODATA"."PROVIDER_DIMENSION" 
   (	"PROVIDER_ID" VARCHAR2(50 BYTE), 
	"PROVIDER_PATH" VARCHAR2(700 BYTE), 
	"NAME_CHAR" VARCHAR2(850 BYTE), 
	"PROVIDER_BLOB" CLOB, 
	"UPDATE_DATE" DATE, 
	"DOWNLOAD_DATE" DATE, 
	"IMPORT_DATE" DATE, 
	"SOURCESYSTEM_CD" VARCHAR2(50 BYTE), 
	"UPLOAD_ID" NUMBER(38,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("PROVIDER_BLOB") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table QT_ANALYSIS_PLUGIN
--------------------------------------------------------

  CREATE TABLE "I2B2DEMODATA"."QT_ANALYSIS_PLUGIN" 
   (	"PLUGIN_ID" NUMBER(10,0), 
	"PLUGIN_NAME" VARCHAR2(2000 BYTE), 
	"DESCRIPTION" VARCHAR2(2000 BYTE), 
	"VERSION_CD" VARCHAR2(50 BYTE), 
	"PARAMETER_INFO" CLOB, 
	"PARAMETER_INFO_XSD" CLOB, 
	"COMMAND_LINE" CLOB, 
	"WORKING_FOLDER" CLOB, 
	"COMMANDOPTION_CD" CLOB, 
	"PLUGIN_ICON" CLOB, 
	"STATUS_CD" VARCHAR2(50 BYTE), 
	"USER_ID" VARCHAR2(50 BYTE), 
	"GROUP_ID" VARCHAR2(50 BYTE), 
	"CREATE_DATE" DATE, 
	"UPDATE_DATE" DATE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("PARAMETER_INFO") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) 
 LOB ("PARAMETER_INFO_XSD") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) 
 LOB ("COMMAND_LINE") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) 
 LOB ("WORKING_FOLDER") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) 
 LOB ("COMMANDOPTION_CD") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) 
 LOB ("PLUGIN_ICON") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) ;
--------------------------------------------------------
--  DDL for Table QT_ANALYSIS_PLUGIN_RESULT_TYPE
--------------------------------------------------------

  CREATE TABLE "I2B2DEMODATA"."QT_ANALYSIS_PLUGIN_RESULT_TYPE" 
   (	"PLUGIN_ID" NUMBER(10,0), 
	"RESULT_TYPE_ID" NUMBER(10,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table QT_BREAKDOWN_PATH
--------------------------------------------------------

  CREATE TABLE "I2B2DEMODATA"."QT_BREAKDOWN_PATH" 
   (	"NAME" VARCHAR2(100 BYTE), 
	"VALUE" VARCHAR2(2000 BYTE), 
	"CREATE_DATE" DATE, 
	"UPDATE_DATE" DATE, 
	"USER_ID" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table QT_PATIENT_ENC_COLLECTION
--------------------------------------------------------

  CREATE TABLE "I2B2DEMODATA"."QT_PATIENT_ENC_COLLECTION" 
   (	"PATIENT_ENC_COLL_ID" NUMBER(10,0), 
	"RESULT_INSTANCE_ID" NUMBER(5,0), 
	"SET_INDEX" NUMBER(10,0), 
	"PATIENT_NUM" NUMBER(38,0), 
	"ENCOUNTER_NUM" NUMBER(38,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table QT_PATIENT_SET_COLLECTION
--------------------------------------------------------

  CREATE TABLE "I2B2DEMODATA"."QT_PATIENT_SET_COLLECTION" 
   (	"PATIENT_SET_COLL_ID" NUMBER(10,0), 
	"RESULT_INSTANCE_ID" NUMBER(5,0), 
	"SET_INDEX" NUMBER(10,0), 
	"PATIENT_NUM" NUMBER(38,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table QT_PDO_QUERY_MASTER
--------------------------------------------------------

  CREATE TABLE "I2B2DEMODATA"."QT_PDO_QUERY_MASTER" 
   (	"QUERY_MASTER_ID" NUMBER(5,0), 
	"USER_ID" VARCHAR2(50 BYTE), 
	"GROUP_ID" VARCHAR2(50 BYTE), 
	"CREATE_DATE" DATE, 
	"REQUEST_XML" CLOB, 
	"I2B2_REQUEST_XML" CLOB
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("REQUEST_XML") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) 
 LOB ("I2B2_REQUEST_XML") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) ;
--------------------------------------------------------
--  DDL for Table QT_PRIVILEGE
--------------------------------------------------------

  CREATE TABLE "I2B2DEMODATA"."QT_PRIVILEGE" 
   (	"PROTECTION_LABEL_CD" VARCHAR2(1500 BYTE), 
	"DATAPROT_CD" VARCHAR2(1000 BYTE), 
	"HIVEMGMT_CD" VARCHAR2(1000 BYTE), 
	"PLUGIN_ID" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table QT_QUERY_INSTANCE
--------------------------------------------------------

  CREATE TABLE "I2B2DEMODATA"."QT_QUERY_INSTANCE" 
   (	"QUERY_INSTANCE_ID" NUMBER(5,0), 
	"QUERY_MASTER_ID" NUMBER(5,0), 
	"USER_ID" VARCHAR2(50 BYTE), 
	"GROUP_ID" VARCHAR2(50 BYTE), 
	"BATCH_MODE" VARCHAR2(50 BYTE), 
	"START_DATE" DATE, 
	"END_DATE" DATE, 
	"DELETE_FLAG" VARCHAR2(3 BYTE), 
	"STATUS_TYPE_ID" NUMBER(5,0), 
	"MESSAGE" CLOB
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("MESSAGE") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) ;
--------------------------------------------------------
--  DDL for Table QT_QUERY_MASTER
--------------------------------------------------------

  CREATE TABLE "I2B2DEMODATA"."QT_QUERY_MASTER" 
   (	"QUERY_MASTER_ID" NUMBER(5,0), 
	"NAME" VARCHAR2(250 BYTE), 
	"USER_ID" VARCHAR2(50 BYTE), 
	"GROUP_ID" VARCHAR2(50 BYTE), 
	"MASTER_TYPE_CD" VARCHAR2(2000 BYTE), 
	"PLUGIN_ID" NUMBER(10,0), 
	"CREATE_DATE" DATE, 
	"DELETE_DATE" DATE, 
	"DELETE_FLAG" VARCHAR2(3 BYTE), 
	"GENERATED_SQL" CLOB, 
	"REQUEST_XML" CLOB, 
	"I2B2_REQUEST_XML" CLOB, 
	"PM_XML" CLOB
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("GENERATED_SQL") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) 
 LOB ("REQUEST_XML") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) 
 LOB ("I2B2_REQUEST_XML") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) 
 LOB ("PM_XML") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) ;
--------------------------------------------------------
--  DDL for Table QT_QUERY_RESULT_INSTANCE
--------------------------------------------------------

  CREATE TABLE "I2B2DEMODATA"."QT_QUERY_RESULT_INSTANCE" 
   (	"RESULT_INSTANCE_ID" NUMBER(5,0), 
	"QUERY_INSTANCE_ID" NUMBER(5,0), 
	"RESULT_TYPE_ID" NUMBER(3,0), 
	"SET_SIZE" NUMBER(10,0), 
	"START_DATE" DATE, 
	"END_DATE" DATE, 
	"DELETE_FLAG" VARCHAR2(3 BYTE), 
	"STATUS_TYPE_ID" NUMBER(3,0), 
	"MESSAGE" CLOB, 
	"DESCRIPTION" VARCHAR2(200 BYTE), 
	"REAL_SET_SIZE" NUMBER(10,0), 
	"OBFUSC_METHOD" VARCHAR2(500 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("MESSAGE") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) ;
--------------------------------------------------------
--  DDL for Table QT_QUERY_RESULT_TYPE
--------------------------------------------------------

  CREATE TABLE "I2B2DEMODATA"."QT_QUERY_RESULT_TYPE" 
   (	"RESULT_TYPE_ID" NUMBER(3,0), 
	"NAME" VARCHAR2(100 BYTE), 
	"DESCRIPTION" VARCHAR2(200 BYTE), 
	"DISPLAY_TYPE_ID" VARCHAR2(500 BYTE), 
	"VISUAL_ATTRIBUTE_TYPE_ID" VARCHAR2(3 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table QT_QUERY_STATUS_TYPE
--------------------------------------------------------

  CREATE TABLE "I2B2DEMODATA"."QT_QUERY_STATUS_TYPE" 
   (	"STATUS_TYPE_ID" NUMBER(3,0), 
	"NAME" VARCHAR2(100 BYTE), 
	"DESCRIPTION" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table QT_XML_RESULT
--------------------------------------------------------

  CREATE TABLE "I2B2DEMODATA"."QT_XML_RESULT" 
   (	"XML_RESULT_ID" NUMBER(5,0), 
	"RESULT_INSTANCE_ID" NUMBER(5,0), 
	"XML_VALUE" CLOB
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("XML_VALUE") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) ;
--------------------------------------------------------
--  DDL for Table QUERY_GLOBAL_TEMP
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "I2B2DEMODATA"."QUERY_GLOBAL_TEMP" 
   (	"ENCOUNTER_NUM" NUMBER(38,0), 
	"PATIENT_NUM" NUMBER(38,0), 
	"INSTANCE_NUM" NUMBER(18,0), 
	"CONCEPT_CD" VARCHAR2(50 BYTE), 
	"START_DATE" DATE, 
	"PROVIDER_ID" VARCHAR2(50 BYTE), 
	"PANEL_COUNT" NUMBER(5,0), 
	"FACT_COUNT" NUMBER(22,0), 
	"FACT_PANELS" NUMBER(5,0)
   ) ON COMMIT PRESERVE ROWS ;
--------------------------------------------------------
--  DDL for Table SET_TYPE
--------------------------------------------------------

  CREATE TABLE "I2B2DEMODATA"."SET_TYPE" 
   (	"ID" NUMBER(*,0), 
	"NAME" VARCHAR2(500 BYTE), 
	"CREATE_DATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table SET_UPLOAD_STATUS
--------------------------------------------------------

  CREATE TABLE "I2B2DEMODATA"."SET_UPLOAD_STATUS" 
   (	"UPLOAD_ID" NUMBER, 
	"SET_TYPE_ID" NUMBER(*,0), 
	"SOURCE_CD" VARCHAR2(50 BYTE), 
	"NO_OF_RECORD" NUMBER, 
	"LOADED_RECORD" NUMBER, 
	"DELETED_RECORD" NUMBER, 
	"LOAD_DATE" DATE, 
	"END_DATE" DATE, 
	"LOAD_STATUS" VARCHAR2(100 BYTE), 
	"MESSAGE" CLOB, 
	"INPUT_FILE_NAME" CLOB, 
	"LOG_FILE_NAME" CLOB, 
	"TRANSFORM_NAME" VARCHAR2(500 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("MESSAGE") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) 
 LOB ("INPUT_FILE_NAME") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) 
 LOB ("LOG_FILE_NAME") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) ;
--------------------------------------------------------
--  DDL for Table SOURCE_MASTER
--------------------------------------------------------

  CREATE TABLE "I2B2DEMODATA"."SOURCE_MASTER" 
   (	"SOURCE_CD" VARCHAR2(50 BYTE), 
	"DESCRIPTION" VARCHAR2(300 BYTE), 
	"CREATE_DATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TEMP_PDO_INPUTLIST
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "I2B2DEMODATA"."TEMP_PDO_INPUTLIST" 
   (	"CHAR_PARAM1" VARCHAR2(100 BYTE)
   ) ON COMMIT PRESERVE ROWS ;
--------------------------------------------------------
--  DDL for Table UPLOAD_STATUS
--------------------------------------------------------

  CREATE TABLE "I2B2DEMODATA"."UPLOAD_STATUS" 
   (	"UPLOAD_ID" NUMBER(38,0), 
	"UPLOAD_LABEL" VARCHAR2(500 BYTE), 
	"USER_ID" VARCHAR2(100 BYTE), 
	"SOURCE_CD" VARCHAR2(50 BYTE), 
	"NO_OF_RECORD" NUMBER, 
	"LOADED_RECORD" NUMBER, 
	"DELETED_RECORD" NUMBER, 
	"LOAD_DATE" DATE, 
	"END_DATE" DATE, 
	"LOAD_STATUS" VARCHAR2(100 BYTE), 
	"MESSAGE" CLOB, 
	"INPUT_FILE_NAME" CLOB, 
	"LOG_FILE_NAME" CLOB, 
	"TRANSFORM_NAME" VARCHAR2(500 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("MESSAGE") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) 
 LOB ("INPUT_FILE_NAME") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) 
 LOB ("LOG_FILE_NAME") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) ;
--------------------------------------------------------
--  DDL for Table VISIT_DIMENSION
--------------------------------------------------------

  CREATE TABLE "I2B2DEMODATA"."VISIT_DIMENSION" 
   (	"ENCOUNTER_NUM" NUMBER(38,0), 
	"PATIENT_NUM" NUMBER(38,0), 
	"ACTIVE_STATUS_CD" VARCHAR2(50 BYTE), 
	"START_DATE" DATE, 
	"END_DATE" DATE, 
	"INOUT_CD" VARCHAR2(50 BYTE), 
	"LOCATION_CD" VARCHAR2(50 BYTE), 
	"LOCATION_PATH" VARCHAR2(900 BYTE), 
	"LENGTH_OF_STAY" NUMBER(38,0), 
	"VISIT_BLOB" CLOB, 
	"UPDATE_DATE" DATE, 
	"DOWNLOAD_DATE" DATE, 
	"IMPORT_DATE" DATE, 
	"SOURCESYSTEM_CD" VARCHAR2(50 BYTE), 
	"UPLOAD_ID" NUMBER(38,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("VISIT_BLOB") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for View AQ$DEF$_AQCALL
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."AQ$DEF$_AQCALL" ("QUEUE", "MSG_ID", "CORR_ID", "MSG_PRIORITY", "MSG_STATE", "DELAY", "DELAY_TIMESTAMP", "EXPIRATION", "ENQ_TIME", "ENQ_TIMESTAMP", "ENQ_USER_ID", "ENQ_TXN_ID", "DEQ_TIME", "DEQ_TIMESTAMP", "DEQ_USER_ID", "DEQ_TXN_ID", "RETRY_COUNT", "EXCEPTION_QUEUE_OWNER", "EXCEPTION_QUEUE", "USER_DATA", "ORIGINAL_QUEUE_NAME", "ORIGINAL_QUEUE_OWNER", "EXPIRATION_REASON") AS 
  SELECT q_name QUEUE, msgid MSG_ID, corrid CORR_ID, priority MSG_PRIORITY, decode(state, 0,   'READY',
                                1,   'WAIT',
                                2,   'PROCESSED',
                                3,   'EXPIRED',
                                10,  'BUFFERED_EXPIRED') MSG_STATE, cast(FROM_TZ(delay, '00:00')
                  at time zone sessiontimezone as date) DELAY, cast(FROM_TZ(delay, '00:00')
               at time zone sessiontimezone as timestamp) DELAY_TIMESTAMP, expiration, cast(FROM_TZ(enq_time, '00:00')
                  at time zone sessiontimezone as date) ENQ_TIME, cast(FROM_TZ(enq_time, '00:00')
                  at time zone sessiontimezone as timestamp) 
                  ENQ_TIMESTAMP, enq_uid ENQ_USER_ID, enq_tid ENQ_TXN_ID, cast(FROM_TZ(deq_time, '00:00')
                  at time zone sessiontimezone as date) DEQ_TIME, cast(FROM_TZ(deq_time, '00:00')
                  at time zone sessiontimezone as timestamp) 
                  DEQ_TIMESTAMP, deq_uid DEQ_USER_ID, deq_tid DEQ_TXN_ID, retry_count,  decode (state, 0, exception_qschema, 
                                  1, exception_qschema, 
                                  2, exception_qschema,  
                                  NULL) EXCEPTION_QUEUE_OWNER,  decode (state, 0, exception_queue, 
                                  1, exception_queue, 
                                  2, exception_queue,  
                                  NULL) EXCEPTION_QUEUE,  user_data,  decode (state, 3, 
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL, 
                             exception_queue), NULL)
                                ORIGINAL_QUEUE_NAME,  decode (state, 3, 
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL, 
                             exception_qschema), NULL)
                                ORIGINAL_QUEUE_OWNER,  decode(state, 3, 
                     decode(deq_time, NULL, 
                       decode(deq_tid, NULL,
                       decode (expiration , NULL , 'MAX_RETRY_EXCEEDED',
                            'TIME_EXPIRATION'),
                              'INVALID_TRANSACTION', NULL,
                              'MAX_RETRY_EXCEEDED'), NULL), NULL) 
                             EXPIRATION_REASON  FROM "DEF$_AQCALL" WHERE state != 7 AND   state != 9 WITH READ ONLY;
--------------------------------------------------------
--  DDL for View AQ$DEF$_AQERROR
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."AQ$DEF$_AQERROR" ("QUEUE", "MSG_ID", "CORR_ID", "MSG_PRIORITY", "MSG_STATE", "DELAY", "DELAY_TIMESTAMP", "EXPIRATION", "ENQ_TIME", "ENQ_TIMESTAMP", "ENQ_USER_ID", "ENQ_TXN_ID", "DEQ_TIME", "DEQ_TIMESTAMP", "DEQ_USER_ID", "DEQ_TXN_ID", "RETRY_COUNT", "EXCEPTION_QUEUE_OWNER", "EXCEPTION_QUEUE", "USER_DATA", "ORIGINAL_QUEUE_NAME", "ORIGINAL_QUEUE_OWNER", "EXPIRATION_REASON") AS 
  SELECT q_name QUEUE, msgid MSG_ID, corrid CORR_ID, priority MSG_PRIORITY, decode(state, 0,   'READY',
                                1,   'WAIT',
                                2,   'PROCESSED',
                                3,   'EXPIRED',
                                10,  'BUFFERED_EXPIRED') MSG_STATE, cast(FROM_TZ(delay, '00:00')
                  at time zone sessiontimezone as date) DELAY, cast(FROM_TZ(delay, '00:00')
               at time zone sessiontimezone as timestamp) DELAY_TIMESTAMP, expiration, cast(FROM_TZ(enq_time, '00:00')
                  at time zone sessiontimezone as date) ENQ_TIME, cast(FROM_TZ(enq_time, '00:00')
                  at time zone sessiontimezone as timestamp) 
                  ENQ_TIMESTAMP, enq_uid ENQ_USER_ID, enq_tid ENQ_TXN_ID, cast(FROM_TZ(deq_time, '00:00')
                  at time zone sessiontimezone as date) DEQ_TIME, cast(FROM_TZ(deq_time, '00:00')
                  at time zone sessiontimezone as timestamp) 
                  DEQ_TIMESTAMP, deq_uid DEQ_USER_ID, deq_tid DEQ_TXN_ID, retry_count,  decode (state, 0, exception_qschema, 
                                  1, exception_qschema, 
                                  2, exception_qschema,  
                                  NULL) EXCEPTION_QUEUE_OWNER,  decode (state, 0, exception_queue, 
                                  1, exception_queue, 
                                  2, exception_queue,  
                                  NULL) EXCEPTION_QUEUE,  user_data,  decode (state, 3, 
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL, 
                             exception_queue), NULL)
                                ORIGINAL_QUEUE_NAME,  decode (state, 3, 
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL, 
                             exception_qschema), NULL)
                                ORIGINAL_QUEUE_OWNER,  decode(state, 3, 
                     decode(deq_time, NULL, 
                       decode(deq_tid, NULL,
                       decode (expiration , NULL , 'MAX_RETRY_EXCEEDED',
                            'TIME_EXPIRATION'),
                              'INVALID_TRANSACTION', NULL,
                              'MAX_RETRY_EXCEEDED'), NULL), NULL) 
                             EXPIRATION_REASON  FROM "DEF$_AQERROR" WHERE state != 7 AND   state != 9 WITH READ ONLY;
--------------------------------------------------------
--  DDL for View AQ$_DEF$_AQCALL_F
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."AQ$_DEF$_AQCALL_F" ("Q_NAME", "ROW_ID", "MSGID", "CORRID", "PRIORITY", "STATE", "DELAY", "EXPIRATION", "ENQ_TIME", "ENQ_UID", "ENQ_TID", "DEQ_TIME", "DEQ_UID", "DEQ_TID", "RETRY_COUNT", "EXCEPTION_QSCHEMA", "EXCEPTION_QUEUE", "CSCN", "DSCN", "CHAIN_NO", "LOCAL_ORDER_NO", "TIME_MANAGER_INFO", "STEP_NO", "USER_DATA", "QUEUE_ID") AS 
  SELECT  /*+ NO_MERGE (qo) USE_NL(qt) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, '00:00') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, '00:00') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, '00:00') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, '00:00') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA , qo.qid QUEUE_ID  FROM "DEF$_AQCALL" qt, SYS.ALL_INT_DEQUEUE_QUEUES  qo  WHERE qt.q_name = qo.name AND qo.owner = 'SYSTEM' WITH READ ONLY;
--------------------------------------------------------
--  DDL for View AQ$_DEF$_AQERROR_F
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."AQ$_DEF$_AQERROR_F" ("Q_NAME", "ROW_ID", "MSGID", "CORRID", "PRIORITY", "STATE", "DELAY", "EXPIRATION", "ENQ_TIME", "ENQ_UID", "ENQ_TID", "DEQ_TIME", "DEQ_UID", "DEQ_TID", "RETRY_COUNT", "EXCEPTION_QSCHEMA", "EXCEPTION_QUEUE", "CSCN", "DSCN", "CHAIN_NO", "LOCAL_ORDER_NO", "TIME_MANAGER_INFO", "STEP_NO", "USER_DATA", "QUEUE_ID") AS 
  SELECT  /*+ NO_MERGE (qo) USE_NL(qt) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, '00:00') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, '00:00') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, '00:00') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, '00:00') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA , qo.qid QUEUE_ID  FROM "DEF$_AQERROR" qt, SYS.ALL_INT_DEQUEUE_QUEUES  qo  WHERE qt.q_name = qo.name AND qo.owner = 'SYSTEM' WITH READ ONLY;
--------------------------------------------------------
--  DDL for View MVIEW_EVALUATIONS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_EVALUATIONS" ("RUNID", "MVIEW_OWNER", "MVIEW_NAME", "RANK", "STORAGE_IN_BYTES", "FREQUENCY", "CUMULATIVE_BENEFIT", "BENEFIT_TO_COST_RATIO") AS 
  select
  t1.runid# as runid,
  summary_owner AS mview_owner,
  summary_name AS mview_name,
  rank# as rank,
  storage_in_bytes,
  frequency,
  cumulative_benefit,
  benefit_to_cost_ratio
from SYSTEM.MVIEW$_ADV_OUTPUT t1, SYSTEM.MVIEW$_ADV_LOG t2, ALL_USERS u
where
  t1.runid# = t2.runid# and
  u.username = t2.uname and
  u.user_id = userenv('SCHEMAID') and
  t1.output_type = 1
order by t1.rank#;

   COMMENT ON TABLE "SYSTEM"."MVIEW_EVALUATIONS"  IS 'This view gives DBA access to summary evaluation output';
--------------------------------------------------------
--  DDL for View MVIEW_EXCEPTIONS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_EXCEPTIONS" ("RUNID", "OWNER", "TABLE_NAME", "DIMENSION_NAME", "RELATIONSHIP", "BAD_ROWID") AS 
  select
  t1.runid# as runid,
  owner,
  table_name,
  dimension_name,
  relationship,
  bad_rowid
from SYSTEM.MVIEW$_ADV_EXCEPTIONS t1, SYSTEM.MVIEW$_ADV_LOG t2, ALL_USERS u
where
  t1.runid# = t2.runid# and
  u.username = t2.uname and
  u.user_id = userenv('SCHEMAID');

   COMMENT ON TABLE "SYSTEM"."MVIEW_EXCEPTIONS"  IS 'This view gives DBA access to dimension validation results';
--------------------------------------------------------
--  DDL for View MVIEW_FILTER
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_FILTER" ("FILTERID", "SUBFILTERNUM", "SUBFILTERTYPE", "STR_VALUE", "NUM_VALUE1", "NUM_VALUE2", "DATE_VALUE1", "DATE_VALUE2") AS 
  select
      a.filterid# as filterid,
      a.subfilternum# as subfilternum,
      decode(a.subfiltertype,1,'APPLICATION',2,'CARDINALITY',3,'LASTUSE',
                             4,'FREQUENCY',5,'USER',6,'PRIORITY',7,'BASETABLE',
                             8,'RESPONSETIME',9,'COLLECTIONID',10,'TRACENAME',
                             11,'SCHEMA','UNKNOWN') AS subfiltertype,
      a.str_value,
      to_number(decode(a.num_value1,-999,NULL,a.num_value1)) AS num_value1,
      to_number(decode(a.num_value2,-999,NULL,a.num_value2)) AS num_value2,
      a.date_value1,
      a.date_value2
   from system.mview$_adv_filter a, system.mview$_adv_log b, ALL_USERS u
   WHERE a.filterid# = b.runid#
   AND b.uname = u.username
   AND u.user_id = userenv('SCHEMAID');

   COMMENT ON TABLE "SYSTEM"."MVIEW_FILTER"  IS 'Workload filter records';
--------------------------------------------------------
--  DDL for View MVIEW_FILTERINSTANCE
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_FILTERINSTANCE" ("RUNID", "FILTERID", "SUBFILTERNUM", "SUBFILTERTYPE", "STR_VALUE", "NUM_VALUE1", "NUM_VALUE2", "DATE_VALUE1", "DATE_VALUE2") AS 
  select
      a.runid# as runid,
      a.filterid# as filterid,
      a.subfilternum# as subfilternum,
      decode(a.subfiltertype,1,'APPLICATION',2,'CARDINALITY',3,'LASTUSE',
                             4,'FREQUENCY',5,'USER',6,'PRIORITY',7,'BASETABLE',
                             8,'RESPONSETIME',9,'COLLECTIONID',10,'TRACENAME',
                             11,'SCHEMA','UNKNOWN') AS subfiltertype,
      a.str_value,
      to_number(decode(a.num_value1,-999,NULL,a.num_value1)) AS num_value1,
      to_number(decode(a.num_value2,-999,NULL,a.num_value2)) AS num_value2,
      a.date_value1,
      a.date_value2
   from system.mview$_adv_filterinstance a;

   COMMENT ON TABLE "SYSTEM"."MVIEW_FILTERINSTANCE"  IS 'Workload filter instance records';
--------------------------------------------------------
--  DDL for View MVIEW_LOG
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_LOG" ("ID", "FILTERID", "RUN_BEGIN", "RUN_END", "TYPE", "STATUS", "MESSAGE", "COMPLETED", "TOTAL", "ERROR_CODE") AS 
  select
      m.runid# as id,
      m.filterid# as filterid,
      m.run_begin,
      m.run_end,
      decode(m.run_type,1,'EVALUATE',2,'EVALUATE_W',3,'RECOMMEND',
                      4,'RECOMMEND_W',5,'VALIDATE',6,'WORKLOAD',
                      7,'FILTER','UNKNOWN') AS type,
      decode(m.status,0,'UNUSED',1,'CANCELLED',2,'IN_PROGRESS',3,'COMPLETED',
                    4,'ERROR','UNKNOWN') AS status,
      m.message,
      m.completed,
      m.total,
      m.error_code
   from system.mview$_adv_log m, all_users u
   where m.uname = u.username
   and   u.user_id = userenv('SCHEMAID');

   COMMENT ON TABLE "SYSTEM"."MVIEW_LOG"  IS 'Advisor session log';
--------------------------------------------------------
--  DDL for View MVIEW_RECOMMENDATIONS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_RECOMMENDATIONS" ("RUNID", "ALL_TABLES", "FACT_TABLES", "GROUPING_LEVELS", "QUERY_TEXT", "RECOMMENDATION_NUMBER", "RECOMMENDED_ACTION", "MVIEW_OWNER", "MVIEW_NAME", "STORAGE_IN_BYTES", "PCT_PERFORMANCE_GAIN", "BENEFIT_TO_COST_RATIO") AS 
  select
  t1.runid# as runid,
  t1.from_clause as all_tables,
  fact_tables,
  grouping_levels,
  query_text,
  rank# as recommendation_number,
  action_type as recommended_action,
  summary_owner as mview_owner,
  summary_name as mview_name,
  storage_in_bytes,
  pct_performance_gain,
  benefit_to_cost_ratio
from SYSTEM.MVIEW$_ADV_OUTPUT t1, SYSTEM.MVIEW$_ADV_LOG t2, ALL_USERS u
where
  t1.runid# = t2.runid# and
  u.username = t2.uname and
  u.user_id = userenv('SCHEMAID') and
  t1.output_type = 0
order by t1.rank#;

   COMMENT ON TABLE "SYSTEM"."MVIEW_RECOMMENDATIONS"  IS 'This view gives DBA access to summary recommendations';
--------------------------------------------------------
--  DDL for View MVIEW_WORKLOAD
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_WORKLOAD" ("WORKLOADID", "IMPORT_TIME", "QUERYID", "APPLICATION", "CARDINALITY", "RESULTSIZE", "LASTUSE", "FREQUENCY", "OWNER", "PRIORITY", "QUERY", "RESPONSETIME") AS 
  select
  a.collectionid# as workloadid,
  a.collecttime as import_time,
  a.queryid# as queryid,
  a.application,
  a.cardinality,
  a.resultsize,
  a.qdate as lastuse,
  a.frequency,
  a.uname as owner,
  a.priority,
  a.sql_text as query,
  a.exec_time as responsetime
from SYSTEM.MVIEW$_ADV_WORKLOAD A, SYSTEM.MVIEW$_ADV_LOG B, ALL_USERS D
WHERE a.collectionid# = b.runid#
AND b.uname = d.username
AND d.user_id = userenv('SCHEMAID');

   COMMENT ON TABLE "SYSTEM"."MVIEW_WORKLOAD"  IS 'This view gives DBA access to shared workload';
--------------------------------------------------------
--  DDL for View PRODUCT_PRIVS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."PRODUCT_PRIVS" ("PRODUCT", "USERID", "ATTRIBUTE", "SCOPE", "NUMERIC_VALUE", "CHAR_VALUE", "DATE_VALUE", "LONG_VALUE") AS 
  SELECT PRODUCT, USERID, ATTRIBUTE, SCOPE,
         NUMERIC_VALUE, CHAR_VALUE, DATE_VALUE, LONG_VALUE
  FROM SQLPLUS_PRODUCT_PROFILE
  WHERE USERID = 'PUBLIC' OR USER LIKE USERID;
--------------------------------------------------------
--  DDL for Index ANALYSIS_PLUGIN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2DEMODATA"."ANALYSIS_PLUGIN_PK" ON "I2B2DEMODATA"."QT_ANALYSIS_PLUGIN" ("PLUGIN_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ANALYSIS_PLUGIN_RESULT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2DEMODATA"."ANALYSIS_PLUGIN_RESULT_PK" ON "I2B2DEMODATA"."QT_ANALYSIS_PLUGIN_RESULT_TYPE" ("PLUGIN_ID", "RESULT_TYPE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CD_UPLOADID_IDX
--------------------------------------------------------

  CREATE INDEX "I2B2DEMODATA"."CD_UPLOADID_IDX" ON "I2B2DEMODATA"."CONCEPT_DIMENSION" ("UPLOAD_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CL_IDX_NAME_CHAR
--------------------------------------------------------

  CREATE INDEX "I2B2DEMODATA"."CL_IDX_NAME_CHAR" ON "I2B2DEMODATA"."CODE_LOOKUP" ("NAME_CHAR") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CL_IDX_UPLOADID
--------------------------------------------------------

  CREATE INDEX "I2B2DEMODATA"."CL_IDX_UPLOADID" ON "I2B2DEMODATA"."CODE_LOOKUP" ("UPLOAD_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CODE_LOOKUP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2DEMODATA"."CODE_LOOKUP_PK" ON "I2B2DEMODATA"."CODE_LOOKUP" ("TABLE_CD", "COLUMN_CD", "CODE_CD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CONCEPT_DIMENSION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2DEMODATA"."CONCEPT_DIMENSION_PK" ON "I2B2DEMODATA"."CONCEPT_DIMENSION" ("CONCEPT_PATH") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index DR$OF_CTX_BLOB$X
--------------------------------------------------------

  CREATE INDEX "I2B2DEMODATA"."DR$OF_CTX_BLOB$X" ON "I2B2DEMODATA"."DR$OF_CTX_BLOB$I" ("TOKEN_TEXT", "TOKEN_TYPE", "TOKEN_FIRST", "TOKEN_LAST", "TOKEN_COUNT") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS COMPRESS 2 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EM_ENCNUM_IDX
--------------------------------------------------------

  CREATE INDEX "I2B2DEMODATA"."EM_ENCNUM_IDX" ON "I2B2DEMODATA"."ENCOUNTER_MAPPING" ("ENCOUNTER_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EM_IDX_ENCPATH
--------------------------------------------------------

  CREATE INDEX "I2B2DEMODATA"."EM_IDX_ENCPATH" ON "I2B2DEMODATA"."ENCOUNTER_MAPPING" ("ENCOUNTER_IDE", "ENCOUNTER_IDE_SOURCE", "PATIENT_IDE", "PATIENT_IDE_SOURCE", "ENCOUNTER_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EM_UPLOADID_IDX
--------------------------------------------------------

  CREATE INDEX "I2B2DEMODATA"."EM_UPLOADID_IDX" ON "I2B2DEMODATA"."ENCOUNTER_MAPPING" ("UPLOAD_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ENCOUNTER_MAPPING_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2DEMODATA"."ENCOUNTER_MAPPING_PK" ON "I2B2DEMODATA"."ENCOUNTER_MAPPING" ("ENCOUNTER_IDE", "ENCOUNTER_IDE_SOURCE", "PROJECT_ID", "PATIENT_IDE", "PATIENT_IDE_SOURCE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index FACT_CNPT_IDX
--------------------------------------------------------

  CREATE INDEX "I2B2DEMODATA"."FACT_CNPT_IDX" ON "I2B2DEMODATA"."OBSERVATION_FACT" ("CONCEPT_CD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index FACT_CNPT_PAT_ENCT_IDX
--------------------------------------------------------

  CREATE INDEX "I2B2DEMODATA"."FACT_CNPT_PAT_ENCT_IDX" ON "I2B2DEMODATA"."OBSERVATION_FACT" ("CONCEPT_CD", "INSTANCE_NUM", "PATIENT_NUM", "ENCOUNTER_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index FACT_NOLOB
--------------------------------------------------------

  CREATE INDEX "I2B2DEMODATA"."FACT_NOLOB" ON "I2B2DEMODATA"."OBSERVATION_FACT" ("PATIENT_NUM", "START_DATE", "CONCEPT_CD", "ENCOUNTER_NUM", "INSTANCE_NUM", "NVAL_NUM", "TVAL_CHAR", "VALTYPE_CD", "MODIFIER_CD", "VALUEFLAG_CD", "PROVIDER_ID", "QUANTITY_NUM", "UNITS_CD", "END_DATE", "LOCATION_CD", "CONFIDENCE_NUM", "UPDATE_DATE", "DOWNLOAD_DATE", "IMPORT_DATE", "SOURCESYSTEM_CD", "UPLOAD_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index FACT_PATCON_DATE_PRVD_IDX
--------------------------------------------------------

  CREATE INDEX "I2B2DEMODATA"."FACT_PATCON_DATE_PRVD_IDX" ON "I2B2DEMODATA"."OBSERVATION_FACT" ("PATIENT_NUM", "CONCEPT_CD", "START_DATE", "END_DATE", "ENCOUNTER_NUM", "INSTANCE_NUM", "PROVIDER_ID", "NVAL_NUM", "VALTYPE_CD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MD_IDX_UPLOADID
--------------------------------------------------------

  CREATE INDEX "I2B2DEMODATA"."MD_IDX_UPLOADID" ON "I2B2DEMODATA"."MODIFIER_DIMENSION" ("UPLOAD_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MODIFIER_DIMENSION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2DEMODATA"."MODIFIER_DIMENSION_PK" ON "I2B2DEMODATA"."MODIFIER_DIMENSION" ("MODIFIER_PATH") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index OBSERVATION_FACT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2DEMODATA"."OBSERVATION_FACT_PK" ON "I2B2DEMODATA"."OBSERVATION_FACT" ("PATIENT_NUM", "CONCEPT_CD", "MODIFIER_CD", "START_DATE", "ENCOUNTER_NUM", "INSTANCE_NUM", "PROVIDER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index OF_CTX_BLOB
--------------------------------------------------------

  CREATE INDEX "I2B2DEMODATA"."OF_CTX_BLOB" ON "I2B2DEMODATA"."OBSERVATION_FACT" ("OBSERVATION_BLOB") 
   INDEXTYPE IS "CTXSYS"."CONTEXT"  PARAMETERS ('SYNC (on commit)');
--------------------------------------------------------
--  DDL for Index PATD_UPLOADID_IDX
--------------------------------------------------------

  CREATE INDEX "I2B2DEMODATA"."PATD_UPLOADID_IDX" ON "I2B2DEMODATA"."PATIENT_DIMENSION" ("UPLOAD_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PATIENT_DIMENSION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2DEMODATA"."PATIENT_DIMENSION_PK" ON "I2B2DEMODATA"."PATIENT_DIMENSION" ("PATIENT_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PATIENT_MAPPING_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2DEMODATA"."PATIENT_MAPPING_PK" ON "I2B2DEMODATA"."PATIENT_MAPPING" ("PATIENT_IDE", "PATIENT_IDE_SOURCE", "PROJECT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PD_IDX_ALLPATIENTDIM
--------------------------------------------------------

  CREATE INDEX "I2B2DEMODATA"."PD_IDX_ALLPATIENTDIM" ON "I2B2DEMODATA"."PATIENT_DIMENSION" ("PATIENT_NUM", "VITAL_STATUS_CD", "BIRTH_DATE", "DEATH_DATE", "SEX_CD", "AGE_IN_YEARS_NUM", "LANGUAGE_CD", "RACE_CD", "MARITAL_STATUS_CD", "RELIGION_CD", "ZIP_CD", "INCOME_CD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PD_IDX_DATES
--------------------------------------------------------

  CREATE INDEX "I2B2DEMODATA"."PD_IDX_DATES" ON "I2B2DEMODATA"."PATIENT_DIMENSION" ("PATIENT_NUM", "VITAL_STATUS_CD", "BIRTH_DATE", "DEATH_DATE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PD_IDX_NAME_CHAR
--------------------------------------------------------

  CREATE INDEX "I2B2DEMODATA"."PD_IDX_NAME_CHAR" ON "I2B2DEMODATA"."PROVIDER_DIMENSION" ("PROVIDER_ID", "NAME_CHAR") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PD_IDX_STATECITYZIP
--------------------------------------------------------

  CREATE INDEX "I2B2DEMODATA"."PD_IDX_STATECITYZIP" ON "I2B2DEMODATA"."PATIENT_DIMENSION" ("STATECITYZIP_PATH", "PATIENT_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_ARCHIVE_OBSFACT
--------------------------------------------------------

  CREATE INDEX "I2B2DEMODATA"."PK_ARCHIVE_OBSFACT" ON "I2B2DEMODATA"."ARCHIVE_OBSERVATION_FACT" ("ENCOUNTER_NUM", "PATIENT_NUM", "CONCEPT_CD", "PROVIDER_ID", "START_DATE", "MODIFIER_CD", "ARCHIVE_UPLOAD_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_SOURCEMASTER_SOURCECD
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2DEMODATA"."PK_SOURCEMASTER_SOURCECD" ON "I2B2DEMODATA"."SOURCE_MASTER" ("SOURCE_CD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_ST_ID
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2DEMODATA"."PK_ST_ID" ON "I2B2DEMODATA"."SET_TYPE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_UP_UPSTATUS_IDSETTYPEID
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2DEMODATA"."PK_UP_UPSTATUS_IDSETTYPEID" ON "I2B2DEMODATA"."SET_UPLOAD_STATUS" ("UPLOAD_ID", "SET_TYPE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_UP_UPSTATUS_UPLOADID
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2DEMODATA"."PK_UP_UPSTATUS_UPLOADID" ON "I2B2DEMODATA"."UPLOAD_STATUS" ("UPLOAD_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PM_ENCPNUM_IDX
--------------------------------------------------------

  CREATE INDEX "I2B2DEMODATA"."PM_ENCPNUM_IDX" ON "I2B2DEMODATA"."PATIENT_MAPPING" ("PATIENT_IDE", "PATIENT_IDE_SOURCE", "PATIENT_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PM_PATNUM_IDX
--------------------------------------------------------

  CREATE INDEX "I2B2DEMODATA"."PM_PATNUM_IDX" ON "I2B2DEMODATA"."PATIENT_MAPPING" ("PATIENT_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PM_UPLOADID_IDX
--------------------------------------------------------

  CREATE INDEX "I2B2DEMODATA"."PM_UPLOADID_IDX" ON "I2B2DEMODATA"."PATIENT_MAPPING" ("UPLOAD_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PROD_UPLOADID_IDX
--------------------------------------------------------

  CREATE INDEX "I2B2DEMODATA"."PROD_UPLOADID_IDX" ON "I2B2DEMODATA"."PROVIDER_DIMENSION" ("UPLOAD_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PROVIDER_DIMENSION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2DEMODATA"."PROVIDER_DIMENSION_PK" ON "I2B2DEMODATA"."PROVIDER_DIMENSION" ("PROVIDER_PATH", "PROVIDER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index QT_APNAMEVERGRP_IDX
--------------------------------------------------------

  CREATE INDEX "I2B2DEMODATA"."QT_APNAMEVERGRP_IDX" ON "I2B2DEMODATA"."QT_ANALYSIS_PLUGIN" ("PLUGIN_NAME", "VERSION_CD", "GROUP_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index QT_IDX_PQM_UGID
--------------------------------------------------------

  CREATE INDEX "I2B2DEMODATA"."QT_IDX_PQM_UGID" ON "I2B2DEMODATA"."QT_PDO_QUERY_MASTER" ("USER_ID", "GROUP_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index QT_IDX_QI_MSTARTID
--------------------------------------------------------

  CREATE INDEX "I2B2DEMODATA"."QT_IDX_QI_MSTARTID" ON "I2B2DEMODATA"."QT_QUERY_INSTANCE" ("QUERY_MASTER_ID", "START_DATE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index QT_IDX_QI_UGID
--------------------------------------------------------

  CREATE INDEX "I2B2DEMODATA"."QT_IDX_QI_UGID" ON "I2B2DEMODATA"."QT_QUERY_INSTANCE" ("USER_ID", "GROUP_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index QT_IDX_QM_UGID
--------------------------------------------------------

  CREATE INDEX "I2B2DEMODATA"."QT_IDX_QM_UGID" ON "I2B2DEMODATA"."QT_QUERY_MASTER" ("USER_ID", "GROUP_ID", "MASTER_TYPE_CD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index QT_IDX_QPSC_RIID
--------------------------------------------------------

  CREATE INDEX "I2B2DEMODATA"."QT_IDX_QPSC_RIID" ON "I2B2DEMODATA"."QT_PATIENT_SET_COLLECTION" ("RESULT_INSTANCE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0034587
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2DEMODATA"."SYS_C0034587" ON "I2B2DEMODATA"."QT_QUERY_MASTER" ("QUERY_MASTER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0034588
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2DEMODATA"."SYS_C0034588" ON "I2B2DEMODATA"."QT_QUERY_RESULT_TYPE" ("RESULT_TYPE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0034589
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2DEMODATA"."SYS_C0034589" ON "I2B2DEMODATA"."QT_QUERY_STATUS_TYPE" ("STATUS_TYPE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0034593
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2DEMODATA"."SYS_C0034593" ON "I2B2DEMODATA"."QT_QUERY_INSTANCE" ("QUERY_INSTANCE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0034599
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2DEMODATA"."SYS_C0034599" ON "I2B2DEMODATA"."QT_QUERY_RESULT_INSTANCE" ("RESULT_INSTANCE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0034603
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2DEMODATA"."SYS_C0034603" ON "I2B2DEMODATA"."QT_PATIENT_SET_COLLECTION" ("PATIENT_SET_COLL_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0034605
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2DEMODATA"."SYS_C0034605" ON "I2B2DEMODATA"."QT_PATIENT_ENC_COLLECTION" ("PATIENT_ENC_COLL_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0034607
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2DEMODATA"."SYS_C0034607" ON "I2B2DEMODATA"."QT_XML_RESULT" ("XML_RESULT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0034615
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2DEMODATA"."SYS_C0034615" ON "I2B2DEMODATA"."QT_PDO_QUERY_MASTER" ("QUERY_MASTER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_IOT_TOP_117578
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2DEMODATA"."SYS_IOT_TOP_117578" ON "I2B2DEMODATA"."DR$OF_CTX_BLOB$K" ("TEXTKEY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_IOT_TOP_117583
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2DEMODATA"."SYS_IOT_TOP_117583" ON "I2B2DEMODATA"."DR$OF_CTX_BLOB$N" ("NLT_DOCID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index VD_UPLOADID_IDX
--------------------------------------------------------

  CREATE INDEX "I2B2DEMODATA"."VD_UPLOADID_IDX" ON "I2B2DEMODATA"."VISIT_DIMENSION" ("UPLOAD_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index VISITDIM_EN_PN_LP_IO_SD_IDX
--------------------------------------------------------

  CREATE INDEX "I2B2DEMODATA"."VISITDIM_EN_PN_LP_IO_SD_IDX" ON "I2B2DEMODATA"."VISIT_DIMENSION" ("ENCOUNTER_NUM", "PATIENT_NUM", "LOCATION_PATH", "INOUT_CD", "START_DATE", "END_DATE", "LENGTH_OF_STAY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index VISITDIM_STD_EDD_IDX
--------------------------------------------------------

  CREATE INDEX "I2B2DEMODATA"."VISITDIM_STD_EDD_IDX" ON "I2B2DEMODATA"."VISIT_DIMENSION" ("START_DATE", "END_DATE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index VISIT_DIMENSION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "I2B2DEMODATA"."VISIT_DIMENSION_PK" ON "I2B2DEMODATA"."VISIT_DIMENSION" ("ENCOUNTER_NUM", "PATIENT_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table ARCHIVE_OBSERVATION_FACT
--------------------------------------------------------

  ALTER TABLE "I2B2DEMODATA"."ARCHIVE_OBSERVATION_FACT" MODIFY ("INSTANCE_NUM" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."ARCHIVE_OBSERVATION_FACT" MODIFY ("MODIFIER_CD" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."ARCHIVE_OBSERVATION_FACT" MODIFY ("START_DATE" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."ARCHIVE_OBSERVATION_FACT" MODIFY ("PROVIDER_ID" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."ARCHIVE_OBSERVATION_FACT" MODIFY ("CONCEPT_CD" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."ARCHIVE_OBSERVATION_FACT" MODIFY ("PATIENT_NUM" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."ARCHIVE_OBSERVATION_FACT" MODIFY ("ENCOUNTER_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CODE_LOOKUP
--------------------------------------------------------

  ALTER TABLE "I2B2DEMODATA"."CODE_LOOKUP" ADD CONSTRAINT "CODE_LOOKUP_PK" PRIMARY KEY ("TABLE_CD", "COLUMN_CD", "CODE_CD")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "I2B2DEMODATA"."CODE_LOOKUP" MODIFY ("CODE_CD" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."CODE_LOOKUP" MODIFY ("COLUMN_CD" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."CODE_LOOKUP" MODIFY ("TABLE_CD" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CONCEPT_DIMENSION
--------------------------------------------------------

  ALTER TABLE "I2B2DEMODATA"."CONCEPT_DIMENSION" ADD CONSTRAINT "CONCEPT_DIMENSION_PK" PRIMARY KEY ("CONCEPT_PATH")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "I2B2DEMODATA"."CONCEPT_DIMENSION" MODIFY ("CONCEPT_CD" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."CONCEPT_DIMENSION" MODIFY ("CONCEPT_PATH" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DR$OF_CTX_BLOB$I
--------------------------------------------------------

  ALTER TABLE "I2B2DEMODATA"."DR$OF_CTX_BLOB$I" MODIFY ("TOKEN_COUNT" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."DR$OF_CTX_BLOB$I" MODIFY ("TOKEN_LAST" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."DR$OF_CTX_BLOB$I" MODIFY ("TOKEN_FIRST" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."DR$OF_CTX_BLOB$I" MODIFY ("TOKEN_TYPE" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."DR$OF_CTX_BLOB$I" MODIFY ("TOKEN_TEXT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DR$OF_CTX_BLOB$K
--------------------------------------------------------

  ALTER TABLE "I2B2DEMODATA"."DR$OF_CTX_BLOB$K" ADD PRIMARY KEY ("TEXTKEY")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table DR$OF_CTX_BLOB$N
--------------------------------------------------------

  ALTER TABLE "I2B2DEMODATA"."DR$OF_CTX_BLOB$N" ADD PRIMARY KEY ("NLT_DOCID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "I2B2DEMODATA"."DR$OF_CTX_BLOB$N" MODIFY ("NLT_MARK" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ENCOUNTER_MAPPING
--------------------------------------------------------

  ALTER TABLE "I2B2DEMODATA"."ENCOUNTER_MAPPING" ADD CONSTRAINT "ENCOUNTER_MAPPING_PK" PRIMARY KEY ("ENCOUNTER_IDE", "ENCOUNTER_IDE_SOURCE", "PROJECT_ID", "PATIENT_IDE", "PATIENT_IDE_SOURCE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "I2B2DEMODATA"."ENCOUNTER_MAPPING" MODIFY ("PATIENT_IDE_SOURCE" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."ENCOUNTER_MAPPING" MODIFY ("PATIENT_IDE" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."ENCOUNTER_MAPPING" MODIFY ("ENCOUNTER_NUM" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."ENCOUNTER_MAPPING" MODIFY ("PROJECT_ID" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."ENCOUNTER_MAPPING" MODIFY ("ENCOUNTER_IDE_SOURCE" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."ENCOUNTER_MAPPING" MODIFY ("ENCOUNTER_IDE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MODIFIER_DIMENSION
--------------------------------------------------------

  ALTER TABLE "I2B2DEMODATA"."MODIFIER_DIMENSION" ADD CONSTRAINT "MODIFIER_DIMENSION_PK" PRIMARY KEY ("MODIFIER_PATH")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "I2B2DEMODATA"."MODIFIER_DIMENSION" MODIFY ("MODIFIER_PATH" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table OBSERVATION_FACT
--------------------------------------------------------

  ALTER TABLE "I2B2DEMODATA"."OBSERVATION_FACT" ADD CONSTRAINT "OBSERVATION_FACT_PK" PRIMARY KEY ("PATIENT_NUM", "CONCEPT_CD", "MODIFIER_CD", "START_DATE", "ENCOUNTER_NUM", "INSTANCE_NUM", "PROVIDER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "I2B2DEMODATA"."OBSERVATION_FACT" MODIFY ("INSTANCE_NUM" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."OBSERVATION_FACT" MODIFY ("MODIFIER_CD" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."OBSERVATION_FACT" MODIFY ("START_DATE" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."OBSERVATION_FACT" MODIFY ("PROVIDER_ID" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."OBSERVATION_FACT" MODIFY ("CONCEPT_CD" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."OBSERVATION_FACT" MODIFY ("PATIENT_NUM" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."OBSERVATION_FACT" MODIFY ("ENCOUNTER_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PATIENT_DIMENSION
--------------------------------------------------------

  ALTER TABLE "I2B2DEMODATA"."PATIENT_DIMENSION" ADD CONSTRAINT "PATIENT_DIMENSION_PK" PRIMARY KEY ("PATIENT_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "I2B2DEMODATA"."PATIENT_DIMENSION" MODIFY ("PATIENT_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PATIENT_MAPPING
--------------------------------------------------------

  ALTER TABLE "I2B2DEMODATA"."PATIENT_MAPPING" ADD CONSTRAINT "PATIENT_MAPPING_PK" PRIMARY KEY ("PATIENT_IDE", "PATIENT_IDE_SOURCE", "PROJECT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "I2B2DEMODATA"."PATIENT_MAPPING" MODIFY ("PROJECT_ID" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."PATIENT_MAPPING" MODIFY ("PATIENT_NUM" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."PATIENT_MAPPING" MODIFY ("PATIENT_IDE_SOURCE" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."PATIENT_MAPPING" MODIFY ("PATIENT_IDE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PROVIDER_DIMENSION
--------------------------------------------------------

  ALTER TABLE "I2B2DEMODATA"."PROVIDER_DIMENSION" ADD CONSTRAINT "PROVIDER_DIMENSION_PK" PRIMARY KEY ("PROVIDER_PATH", "PROVIDER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "I2B2DEMODATA"."PROVIDER_DIMENSION" MODIFY ("PROVIDER_PATH" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."PROVIDER_DIMENSION" MODIFY ("PROVIDER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table QT_ANALYSIS_PLUGIN
--------------------------------------------------------

  ALTER TABLE "I2B2DEMODATA"."QT_ANALYSIS_PLUGIN" ADD CONSTRAINT "ANALYSIS_PLUGIN_PK" PRIMARY KEY ("PLUGIN_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "I2B2DEMODATA"."QT_ANALYSIS_PLUGIN" MODIFY ("PLUGIN_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table QT_ANALYSIS_PLUGIN_RESULT_TYPE
--------------------------------------------------------

  ALTER TABLE "I2B2DEMODATA"."QT_ANALYSIS_PLUGIN_RESULT_TYPE" ADD CONSTRAINT "ANALYSIS_PLUGIN_RESULT_PK" PRIMARY KEY ("PLUGIN_ID", "RESULT_TYPE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table QT_PATIENT_ENC_COLLECTION
--------------------------------------------------------

  ALTER TABLE "I2B2DEMODATA"."QT_PATIENT_ENC_COLLECTION" ADD PRIMARY KEY ("PATIENT_ENC_COLL_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table QT_PATIENT_SET_COLLECTION
--------------------------------------------------------

  ALTER TABLE "I2B2DEMODATA"."QT_PATIENT_SET_COLLECTION" ADD PRIMARY KEY ("PATIENT_SET_COLL_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table QT_PDO_QUERY_MASTER
--------------------------------------------------------

  ALTER TABLE "I2B2DEMODATA"."QT_PDO_QUERY_MASTER" ADD PRIMARY KEY ("QUERY_MASTER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "I2B2DEMODATA"."QT_PDO_QUERY_MASTER" MODIFY ("CREATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."QT_PDO_QUERY_MASTER" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."QT_PDO_QUERY_MASTER" MODIFY ("USER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table QT_QUERY_INSTANCE
--------------------------------------------------------

  ALTER TABLE "I2B2DEMODATA"."QT_QUERY_INSTANCE" ADD PRIMARY KEY ("QUERY_INSTANCE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "I2B2DEMODATA"."QT_QUERY_INSTANCE" MODIFY ("START_DATE" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."QT_QUERY_INSTANCE" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."QT_QUERY_INSTANCE" MODIFY ("USER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table QT_QUERY_MASTER
--------------------------------------------------------

  ALTER TABLE "I2B2DEMODATA"."QT_QUERY_MASTER" ADD PRIMARY KEY ("QUERY_MASTER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "I2B2DEMODATA"."QT_QUERY_MASTER" MODIFY ("CREATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."QT_QUERY_MASTER" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."QT_QUERY_MASTER" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."QT_QUERY_MASTER" MODIFY ("NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table QT_QUERY_RESULT_INSTANCE
--------------------------------------------------------

  ALTER TABLE "I2B2DEMODATA"."QT_QUERY_RESULT_INSTANCE" ADD PRIMARY KEY ("RESULT_INSTANCE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "I2B2DEMODATA"."QT_QUERY_RESULT_INSTANCE" MODIFY ("STATUS_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."QT_QUERY_RESULT_INSTANCE" MODIFY ("START_DATE" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."QT_QUERY_RESULT_INSTANCE" MODIFY ("RESULT_TYPE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table QT_QUERY_RESULT_TYPE
--------------------------------------------------------

  ALTER TABLE "I2B2DEMODATA"."QT_QUERY_RESULT_TYPE" ADD PRIMARY KEY ("RESULT_TYPE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table QT_QUERY_STATUS_TYPE
--------------------------------------------------------

  ALTER TABLE "I2B2DEMODATA"."QT_QUERY_STATUS_TYPE" ADD PRIMARY KEY ("STATUS_TYPE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table QT_XML_RESULT
--------------------------------------------------------

  ALTER TABLE "I2B2DEMODATA"."QT_XML_RESULT" ADD PRIMARY KEY ("XML_RESULT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SET_TYPE
--------------------------------------------------------

  ALTER TABLE "I2B2DEMODATA"."SET_TYPE" ADD CONSTRAINT "PK_ST_ID" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SET_UPLOAD_STATUS
--------------------------------------------------------

  ALTER TABLE "I2B2DEMODATA"."SET_UPLOAD_STATUS" ADD CONSTRAINT "PK_UP_UPSTATUS_IDSETTYPEID" PRIMARY KEY ("UPLOAD_ID", "SET_TYPE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "I2B2DEMODATA"."SET_UPLOAD_STATUS" MODIFY ("LOAD_DATE" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."SET_UPLOAD_STATUS" MODIFY ("SOURCE_CD" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SOURCE_MASTER
--------------------------------------------------------

  ALTER TABLE "I2B2DEMODATA"."SOURCE_MASTER" ADD CONSTRAINT "PK_SOURCEMASTER_SOURCECD" PRIMARY KEY ("SOURCE_CD")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "I2B2DEMODATA"."SOURCE_MASTER" MODIFY ("SOURCE_CD" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table UPLOAD_STATUS
--------------------------------------------------------

  ALTER TABLE "I2B2DEMODATA"."UPLOAD_STATUS" ADD CONSTRAINT "PK_UP_UPSTATUS_UPLOADID" PRIMARY KEY ("UPLOAD_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "I2B2DEMODATA"."UPLOAD_STATUS" MODIFY ("LOAD_DATE" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."UPLOAD_STATUS" MODIFY ("SOURCE_CD" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."UPLOAD_STATUS" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."UPLOAD_STATUS" MODIFY ("UPLOAD_LABEL" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table VISIT_DIMENSION
--------------------------------------------------------

  ALTER TABLE "I2B2DEMODATA"."VISIT_DIMENSION" ADD CONSTRAINT "VISIT_DIMENSION_PK" PRIMARY KEY ("ENCOUNTER_NUM", "PATIENT_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "I2B2DEMODATA"."VISIT_DIMENSION" MODIFY ("PATIENT_NUM" NOT NULL ENABLE);
  ALTER TABLE "I2B2DEMODATA"."VISIT_DIMENSION" MODIFY ("ENCOUNTER_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table QT_PATIENT_ENC_COLLECTION
--------------------------------------------------------

  ALTER TABLE "I2B2DEMODATA"."QT_PATIENT_ENC_COLLECTION" ADD CONSTRAINT "QT_FK_PESC_RI" FOREIGN KEY ("RESULT_INSTANCE_ID")
	  REFERENCES "I2B2DEMODATA"."QT_QUERY_RESULT_INSTANCE" ("RESULT_INSTANCE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table QT_PATIENT_SET_COLLECTION
--------------------------------------------------------

  ALTER TABLE "I2B2DEMODATA"."QT_PATIENT_SET_COLLECTION" ADD CONSTRAINT "QT_FK_PSC_RI" FOREIGN KEY ("RESULT_INSTANCE_ID")
	  REFERENCES "I2B2DEMODATA"."QT_QUERY_RESULT_INSTANCE" ("RESULT_INSTANCE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table QT_QUERY_INSTANCE
--------------------------------------------------------

  ALTER TABLE "I2B2DEMODATA"."QT_QUERY_INSTANCE" ADD CONSTRAINT "QT_FK_QI_MID" FOREIGN KEY ("QUERY_MASTER_ID")
	  REFERENCES "I2B2DEMODATA"."QT_QUERY_MASTER" ("QUERY_MASTER_ID") ENABLE;
  ALTER TABLE "I2B2DEMODATA"."QT_QUERY_INSTANCE" ADD CONSTRAINT "QT_FK_QI_STID" FOREIGN KEY ("STATUS_TYPE_ID")
	  REFERENCES "I2B2DEMODATA"."QT_QUERY_STATUS_TYPE" ("STATUS_TYPE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table QT_QUERY_RESULT_INSTANCE
--------------------------------------------------------

  ALTER TABLE "I2B2DEMODATA"."QT_QUERY_RESULT_INSTANCE" ADD CONSTRAINT "QT_FK_QRI_RID" FOREIGN KEY ("QUERY_INSTANCE_ID")
	  REFERENCES "I2B2DEMODATA"."QT_QUERY_INSTANCE" ("QUERY_INSTANCE_ID") ENABLE;
  ALTER TABLE "I2B2DEMODATA"."QT_QUERY_RESULT_INSTANCE" ADD CONSTRAINT "QT_FK_QRI_RTID" FOREIGN KEY ("RESULT_TYPE_ID")
	  REFERENCES "I2B2DEMODATA"."QT_QUERY_RESULT_TYPE" ("RESULT_TYPE_ID") ENABLE;
  ALTER TABLE "I2B2DEMODATA"."QT_QUERY_RESULT_INSTANCE" ADD CONSTRAINT "QT_FK_QRI_STID" FOREIGN KEY ("STATUS_TYPE_ID")
	  REFERENCES "I2B2DEMODATA"."QT_QUERY_STATUS_TYPE" ("STATUS_TYPE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table QT_XML_RESULT
--------------------------------------------------------

  ALTER TABLE "I2B2DEMODATA"."QT_XML_RESULT" ADD CONSTRAINT "QT_FK_XMLR_RIID" FOREIGN KEY ("RESULT_INSTANCE_ID")
	  REFERENCES "I2B2DEMODATA"."QT_QUERY_RESULT_INSTANCE" ("RESULT_INSTANCE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SET_UPLOAD_STATUS
--------------------------------------------------------

  ALTER TABLE "I2B2DEMODATA"."SET_UPLOAD_STATUS" ADD CONSTRAINT "FK_UP_SET_TYPE_ID" FOREIGN KEY ("SET_TYPE_ID")
	  REFERENCES "I2B2DEMODATA"."SET_TYPE" ("ID") ENABLE;
--------------------------------------------------------
--  DDL for Package DBMS_REPCAT_AUTH
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "SYSTEM"."DBMS_REPCAT_AUTH" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
9
bf d6
0cfc6e4Sm6mfaMYwsbW2JygBepcwg/BKmJ4VZy/pO06UXsVUMejsissTcGWYR4qeK4TPqfDK
q7UPH+SmKP6nW9zmxMZnuK1VDzM0Iv9O4E4SvvsnHWn+EPF9hR+oBFe3fEro6RQ5R5Ejd1nr
e+fAK010dExf76gg/c6ZB3YxGPHDOqkGI4lV6HNsd57gKLwTd0bxan5UwJriIpt7Vjc=

/
--------------------------------------------------------
--  DDL for Package Body DBMS_REPCAT_AUTH
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "SYSTEM"."DBMS_REPCAT_AUTH" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
b
b9d 39c
PBMGkNCh5NDAdLezCHsLvZaVi/swg5UrNSCDfI4Zvp0VB6GpRld+By6E2nVdlFHT2g2kK9zM
8jSnsuee7mkmJD+W3Mo36HQvUfOe7jH5vP7tu1i0jDykzR0pUhJZUcY6xVrSwNPoNVPcT72N
eHhGwyRBj2+0vKbgTmcZKBMJzETRfOl2YGDDVB3FvKBSixMMqfWSX8uh3wPGOi8W9vOASC3z
0UvPqL7KR78SykUEoBCxpMGmE8pgElC/dagmVpIIt7QA6sneMlNb2OO/1zTN44ACRsm+2JAo
zD41TcuGaNUqDYNDRbPEKzeRZeXxrx1UvOWsYTNaO6icaV/NrtZbmXpDuGA/sqnz4jnKFK8S
0VC+Yjh2iJEV5edD2+8pyMgx44NVDiAQ+sjjDkpGc0IxXrm/v52yduhnj/xnkualIm/RyAv0
Q/YzRAHy7NvyavbajIvCFoZWpbO3Jw8NwkoU25ysfgvXZJrw4vPjh4hHR4Mpto6jFMM+dZPW
3N9HL971bTBgyAL0BjASEFXe83D+IoBYX0VQVk5+t7p7iUsmfyK5t+cECNpNOL6UaACcsAYB
Le+yLOAqFHSvCXlWcECxG7wXjAA2/XmBwvKBNLcggXKVp3i9cNzab0Mq9qSAcIYgRFxRdAOe
sTDZNOx6HkJTbCRKCMiJzgjQQW476DlOZD+9Gwh+AA/Y3PIDOfyhlvXT6HsjW33mASJUuORB
la5Jb3rB4syO6QO2a5vSHu26Gwib2EflS8bqC1hZhpHsvM+mAaWJ2x72JyrPe8V7Ohjbre49
gRsjAtspIYfP5958sSnHdkz32nGAXnrEY95lEHGwkuXLlj9y6I21aAyd3/lJkuEAEBxzZVnm
IaNJBwl8u33+SqGLZzILy1QxmA+pF8yUaQ+yRU/5+3n1mY4=

/
--------------------------------------------------------
--  DDL for Procedure CREATE_TEMP_CONCEPT_TABLE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."CREATE_TEMP_CONCEPT_TABLE" (tempConceptTableName IN VARCHAR, 
  errorMsg OUT VARCHAR) 
IS 

BEGIN 
execute immediate 'create table ' ||  tempConceptTableName || ' (
        CONCEPT_CD VARCHAR2(50) NOT NULL, 
	CONCEPT_PATH VARCHAR2(900) NOT NULL , 
	NAME_CHAR VARCHAR2(2000), 
	CONCEPT_BLOB CLOB, 
	UPDATE_DATE date, 
	DOWNLOAD_DATE DATE, 
	IMPORT_DATE DATE, 
	SOURCESYSTEM_CD VARCHAR2(50)
	 )';

 execute immediate 'CREATE INDEX idx_' || tempConceptTableName || '_pat_id ON ' || tempConceptTableName || '  (CONCEPT_PATH)';
  
   

EXCEPTION
	WHEN OTHERS THEN
		dbms_output.put_line(SQLCODE|| ' - ' ||SQLERRM);
END;

/
--------------------------------------------------------
--  DDL for Procedure CREATE_TEMP_EID_TABLE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."CREATE_TEMP_EID_TABLE" (tempPatientMappingTableName IN VARCHAR ,errorMsg OUT VARCHAR) 
IS 

BEGIN 
execute immediate 'create table ' ||  tempPatientMappingTableName || ' (
	ENCOUNTER_MAP_ID       	VARCHAR2(200) NOT NULL,
    ENCOUNTER_MAP_ID_SOURCE	VARCHAR2(50) NOT NULL,
    PATIENT_MAP_ID          VARCHAR2(200), 
	PATIENT_MAP_ID_SOURCE   VARCHAR2(50), 
    ENCOUNTER_ID       	    VARCHAR2(200) NOT NULL,
    ENCOUNTER_ID_SOURCE     VARCHAR2(50) ,
    ENCOUNTER_NUM           NUMBER, 
    ENCOUNTER_MAP_ID_STATUS    VARCHAR2(50),
    PROCESS_STATUS_FLAG     CHAR(1),
	UPDATE_DATE DATE, 
	DOWNLOAD_DATE DATE, 
	IMPORT_DATE DATE, 
	SOURCESYSTEM_CD VARCHAR2(50)
)';

execute immediate 'CREATE INDEX idx_' || tempPatientMappingTableName || '_eid_id ON ' || tempPatientMappingTableName || '  (ENCOUNTER_ID, ENCOUNTER_ID_SOURCE, ENCOUNTER_MAP_ID, ENCOUNTER_MAP_ID_SOURCE, ENCOUNTER_NUM)';

 execute immediate 'CREATE INDEX idx_' || tempPatientMappingTableName || '_stateid_eid_id ON ' || tempPatientMappingTableName || '  (PROCESS_STATUS_FLAG)';  
EXCEPTION
	WHEN OTHERS THEN
		dbms_output.put_line(SQLCODE|| ' - ' ||SQLERRM);
END;

/
--------------------------------------------------------
--  DDL for Procedure CREATE_TEMP_MODIFIER_TABLE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."CREATE_TEMP_MODIFIER_TABLE" (tempModifierTableName IN VARCHAR, 
  errorMsg OUT VARCHAR) 
IS 

BEGIN 
execute immediate 'create table ' ||  tempModifierTableName || ' (
        MODIFIER_CD VARCHAR2(50) NOT NULL, 
	MODIFIER_PATH VARCHAR2(900) NOT NULL , 
	NAME_CHAR VARCHAR2(2000), 
	MODIFIER_BLOB CLOB, 
	UPDATE_DATE date, 
	DOWNLOAD_DATE DATE, 
	IMPORT_DATE DATE, 
	SOURCESYSTEM_CD VARCHAR2(50)
	 )';

 execute immediate 'CREATE INDEX idx_' || tempModifierTableName || '_pat_id ON ' || tempModifierTableName || '  (MODIFIER_PATH)';
  
   

EXCEPTION
	WHEN OTHERS THEN
		dbms_output.put_line(SQLCODE|| ' - ' ||SQLERRM);
END;

/
--------------------------------------------------------
--  DDL for Procedure CREATE_TEMP_PATIENT_TABLE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."CREATE_TEMP_PATIENT_TABLE" (tempPatientDimensionTableName IN VARCHAR, 
    errorMsg OUT VARCHAR ) 
IS 

BEGIN 
	-- Create temp table to store encounter/visit information
	execute immediate 'create table ' ||  tempPatientDimensionTableName || ' (
		PATIENT_ID VARCHAR2(200), 
		PATIENT_ID_SOURCE VARCHAR2(50),
		PATIENT_NUM NUMBER(38,0),
	    VITAL_STATUS_CD VARCHAR2(50), 
	    BIRTH_DATE DATE, 
	    DEATH_DATE DATE, 
	    SEX_CD CHAR(50), 
	    AGE_IN_YEARS_NUM NUMBER(5,0), 
	    LANGUAGE_CD VARCHAR2(50), 
		RACE_CD VARCHAR2(50 ), 
		MARITAL_STATUS_CD VARCHAR2(50), 
		RELIGION_CD VARCHAR2(50), 
		ZIP_CD VARCHAR2(50), 
		STATECITYZIP_PATH VARCHAR2(700), 
		PATIENT_BLOB CLOB, 
		UPDATE_DATE DATE, 
		DOWNLOAD_DATE DATE, 
		IMPORT_DATE DATE, 
		SOURCESYSTEM_CD VARCHAR2(50)
	)';

execute immediate 'CREATE INDEX idx_' || tempPatientDimensionTableName || '_pat_id ON ' || tempPatientDimensionTableName || '  (PATIENT_ID, PATIENT_ID_SOURCE,PATIENT_NUM)';
  
     
    
EXCEPTION
	WHEN OTHERS THEN
		dbms_output.put_line(SQLCODE|| ' - ' ||SQLERRM);
END;

/
--------------------------------------------------------
--  DDL for Procedure CREATE_TEMP_PID_TABLE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."CREATE_TEMP_PID_TABLE" (tempPatientMappingTableName IN VARCHAR,
    errorMsg OUT VARCHAR ) 
IS 

BEGIN 
execute immediate 'create table ' ||  tempPatientMappingTableName || ' (
	   	PATIENT_MAP_ID VARCHAR2(200), 
		PATIENT_MAP_ID_SOURCE VARCHAR2(50), 
		PATIENT_ID_STATUS VARCHAR2(50), 
		PATIENT_ID  VARCHAR2(200),
	    PATIENT_ID_SOURCE varchar(50),
		PATIENT_NUM NUMBER(38,0),
	    PATIENT_MAP_ID_STATUS VARCHAR2(50), 
		PROCESS_STATUS_FLAG CHAR(1), 
		UPDATE_DATE DATE, 
		DOWNLOAD_DATE DATE, 
		IMPORT_DATE DATE, 
		SOURCESYSTEM_CD VARCHAR2(50)

	 )';

execute immediate 'CREATE INDEX idx_' || tempPatientMappingTableName || '_pid_id ON ' || tempPatientMappingTableName || '  ( PATIENT_ID, PATIENT_ID_SOURCE )';

execute immediate 'CREATE INDEX idx_' || tempPatientMappingTableName || 'map_pid_id ON ' || tempPatientMappingTableName || '  
( PATIENT_ID, PATIENT_ID_SOURCE,PATIENT_MAP_ID, PATIENT_MAP_ID_SOURCE,  PATIENT_NUM )';
 
execute immediate 'CREATE INDEX idx_' || tempPatientMappingTableName || 'stat_pid_id ON ' || tempPatientMappingTableName || '  
(PROCESS_STATUS_FLAG)';


EXCEPTION
	WHEN OTHERS THEN
		dbms_output.put_line(SQLCODE|| ' - ' ||SQLERRM);
END;

/
--------------------------------------------------------
--  DDL for Procedure CREATE_TEMP_PROVIDER_TABLE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."CREATE_TEMP_PROVIDER_TABLE" (tempProviderTableName IN VARCHAR, 
   errorMsg OUT VARCHAR) 
IS 

BEGIN 

execute immediate 'create table ' ||  tempProviderTableName || ' (
    PROVIDER_ID VARCHAR2(50) NOT NULL, 
	PROVIDER_PATH VARCHAR2(700) NOT NULL, 
	NAME_CHAR VARCHAR2(2000), 
	PROVIDER_BLOB CLOB, 
	UPDATE_DATE DATE, 
	DOWNLOAD_DATE DATE, 
	IMPORT_DATE DATE, 
	SOURCESYSTEM_CD VARCHAR2(50), 
	UPLOAD_ID NUMBER(*,0)
	 )';
 execute immediate 'CREATE INDEX idx_' || tempProviderTableName || '_ppath_id ON ' || tempProviderTableName || '  (PROVIDER_PATH)';


 
   

EXCEPTION
	WHEN OTHERS THEN
		dbms_output.put_line(SQLCODE|| ' - ' ||SQLERRM);
END;

/
--------------------------------------------------------
--  DDL for Procedure CREATE_TEMP_TABLE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."CREATE_TEMP_TABLE" (tempTableName IN VARCHAR, errorMsg OUT VARCHAR) 
IS 

BEGIN 
	execute immediate 'create table ' ||  tempTableName || '  (
		encounter_num  NUMBER(38,0),
		encounter_id varchar(200) not null, 
        encounter_id_source varchar(50) not null,
		concept_cd 	 VARCHAR(50) not null, 
                patient_num number(38,0), 
		patient_id  varchar(200) not null,
        patient_id_source  varchar(50) not null,
		provider_id   VARCHAR(50),
 		start_date   DATE, 
		modifier_cd VARCHAR2(100),
	    instance_num number(18,0),
 		valtype_cd varchar2(50),
		tval_char varchar(255),
 		nval_num NUMBER(18,5),
		valueflag_cd CHAR(50),
 		quantity_num NUMBER(18,5),
		confidence_num NUMBER(18,0),
 		observation_blob CLOB,
		units_cd VARCHAR2(50),
 		end_date    DATE,
		location_cd VARCHAR2(50),
 		update_date  DATE,
		download_date DATE,
 		import_date DATE,
		sourcesystem_cd VARCHAR2(50) ,
 		upload_id INTEGER
	) NOLOGGING';

    
    execute immediate 'CREATE INDEX idx_' || tempTableName || '_pk ON ' || tempTableName || '  ( encounter_num,patient_num,concept_cd,provider_id,start_date,modifier_cd,instance_num)';
    execute immediate 'CREATE INDEX idx_' || tempTableName || '_enc_pat_id ON ' || tempTableName || '  (encounter_id,encounter_id_source, patient_id,patient_id_source )';
    
EXCEPTION
	WHEN OTHERS THEN
		dbms_output.put_line(SQLCODE|| ' - ' ||SQLERRM);
END;

/
--------------------------------------------------------
--  DDL for Procedure CREATE_TEMP_VISIT_TABLE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."CREATE_TEMP_VISIT_TABLE" (tempTableName IN VARCHAR, errorMsg OUT VARCHAR ) 
IS 

BEGIN 
	-- Create temp table to store encounter/visit information
	execute immediate 'create table ' ||  tempTableName || ' (
		encounter_id 			VARCHAR(200) not null,
		encounter_id_source 	VARCHAR(50) not null, 
		patient_id  			VARCHAR(200) not null,
		patient_id_source 		VARCHAR2(50) not null,
		encounter_num	 		    NUMBER(38,0), 
		inout_cd   			VARCHAR(50),
		location_cd 			VARCHAR2(50),
		location_path 			VARCHAR2(900),
 		start_date   			DATE, 
 		end_date    			DATE,
 		visit_blob 				CLOB,
 		update_date  			DATE,
		download_date 			DATE,
 		import_date 			DATE,
		sourcesystem_cd 		VARCHAR2(50)
	)';

    execute immediate 'CREATE INDEX idx_' || tempTableName || '_enc_id ON ' || tempTableName || '  ( encounter_id,encounter_id_source,patient_id,patient_id_source )';
    execute immediate 'CREATE INDEX idx_' || tempTableName || '_patient_id ON ' || tempTableName || '  ( patient_id,patient_id_source )';
    
EXCEPTION
	WHEN OTHERS THEN
		dbms_output.put_line(SQLCODE|| ' - ' ||SQLERRM);
END;

/
--------------------------------------------------------
--  DDL for Procedure INSERT_CONCEPT_FROMTEMP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."INSERT_CONCEPT_FROMTEMP" (tempConceptTableName IN VARCHAR, upload_id IN NUMBER, errorMsg OUT VARCHAR ) 
IS 

BEGIN 
	--Delete duplicate rows with same encounter and patient combination
	execute immediate 'DELETE FROM ' || tempConceptTableName || ' t1 WHERE rowid > 
					   (SELECT  min(rowid) FROM ' || tempConceptTableName || ' t2
					     WHERE t1.concept_cd = t2.concept_cd 
                                            AND t1.concept_path = t2.concept_path
                                            )';
	
	   execute immediate ' UPDATE concept_dimension  set  (concept_cd,
                        name_char,concept_blob,
                        update_date,download_date,
                        import_date,sourcesystem_cd,
			     	UPLOAD_ID) = (select temp.concept_cd, temp.name_char,temp.concept_blob,temp.update_date,temp.DOWNLOAD_DATE,sysdate,temp.SOURCESYSTEM_CD,
			     	' || UPLOAD_ID  || ' from ' || tempConceptTableName || '  temp   where 
					temp.concept_path = concept_dimension.concept_path and temp.update_date >= concept_dimension.update_date) 
					where exists (select 1 from ' || tempConceptTableName || ' temp  where temp.concept_path = concept_dimension.concept_path 
					and temp.update_date >= concept_dimension.update_date) ';



   
    --Create new patient(patient_mapping) if temp table patient_ide does not exists 
	-- in patient_mapping table.
	execute immediate 'insert into concept_dimension  (concept_cd,concept_path,name_char,concept_blob,update_date,download_date,import_date,sourcesystem_cd,upload_id)
			    select  concept_cd, concept_path,
                        name_char,concept_blob,
                        update_date,download_date,
                        sysdate,sourcesystem_cd,
                         ' || upload_id || '  from ' || tempConceptTableName || '  temp
					where not exists (select concept_cd from concept_dimension cd where cd.concept_path = temp.concept_path)
					 
	';
	
	
    
    
EXCEPTION
	WHEN OTHERS THEN
		raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);	
END;

 

/
--------------------------------------------------------
--  DDL for Procedure INSERT_EID_MAP_FROMTEMP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."INSERT_EID_MAP_FROMTEMP" (tempEidTableName IN VARCHAR,  upload_id IN NUMBER,
   errorMsg OUT VARCHAR ) 
is
 existingEncounterNum varchar2(32);
 maxEncounterNum number;

 TYPE distinctEIdCurTyp IS REF CURSOR;
distinctEidCur   distinctEIdCurTyp;
 sql_stmt  varchar2(400);
 
disEncounterId varchar2(100); 
disEncounterIdSource varchar2(100);
disPatientId varchar2(100);
disPatientIdSource varchar2(100);

BEGIN
 sql_stmt := ' SELECT distinct encounter_id,encounter_id_source,patient_map_id,patient_map_id_source from ' || tempEidTableName ||' ';
 
  execute immediate ' delete  from ' || tempEidTableName ||  ' t1  where 
rowid > (select min(rowid) from ' || tempEidTableName || ' t2 
where t1.encounter_map_id = t2.encounter_map_id
and t1.encounter_map_id_source = t2.encounter_map_id_source
and t1.encounter_id = t2.encounter_id
and t1.encounter_id_source = t2.encounter_id_source) ';

 LOCK TABLE  encounter_mapping IN EXCLUSIVE MODE NOWAIT;
 select max(encounter_num) into maxEncounterNum from encounter_mapping ; 
 
if maxEncounterNum is null then 
  maxEncounterNum := 0;
end if;

  open distinctEidCur for sql_stmt ;
 
   loop
     FETCH distinctEidCur INTO disEncounterId, disEncounterIdSource,disPatientId,disPatientIdSource;
      EXIT WHEN distinctEidCur%NOTFOUND;
       -- dbms_output.put_line(disEncounterId);
        
  if  disEncounterIdSource = 'HIVE'  THEN 
   begin
    --check if hive number exist, if so assign that number to reset of map_id's within that eid
    select encounter_num into existingEncounterNum from encounter_mapping where encounter_num = disEncounterId and encounter_ide_source = 'HIVE';
    EXCEPTION  
       when NO_DATA_FOUND THEN
           existingEncounterNum := null;
    end;
   if existingEncounterNum is not null then 
        execute immediate ' update ' || tempEidTableName ||' set encounter_num = encounter_id, process_status_flag = ''P''
        where encounter_id = :x and not exists (select 1 from encounter_mapping em where em.encounter_ide = encounter_map_id
        and em.encounter_ide_source = encounter_map_id_source)' using disEncounterId;
	
   else 
        -- generate new encounter_num i.e. take max(_num) + 1 
        if maxEncounterNum < disEncounterId then 
            maxEncounterNum := disEncounterId;
        end if ;
        execute immediate ' update ' || tempEidTableName ||' set encounter_num = encounter_id, process_status_flag = ''P'' where 
        encounter_id =  :x and encounter_id_source = ''HIVE'' and not exists (select 1 from encounter_mapping em where em.encounter_ide = encounter_map_id
        and em.encounter_ide_source = encounter_map_id_source)' using disEncounterId;
      
   end if;    
   
   -- test if record fectched
   -- dbms_output.put_line(' HIVE ');

 else 
    begin
       -- jgk 8/13/14: non hive encounter #s do not need to be globally unique
       select encounter_num into existingEncounterNum from encounter_mapping where encounter_ide = disEncounterId and 
        encounter_ide_source = disEncounterIdSource and patient_ide=disPatientId and patient_ide_source=disPatientIdSource; 

       -- test if record fetched. 
       EXCEPTION
           WHEN NO_DATA_FOUND THEN
           existingEncounterNum := null;
       end;
       if existingEncounterNum is not  null then 
            execute immediate ' update ' || tempEidTableName ||' set encounter_num = :x , process_status_flag = ''P''
            where encounter_id = :y and not exists (select 1 from encounter_mapping em where em.encounter_ide = encounter_map_id
        and em.encounter_ide_source = encounter_map_id_source
        and em.patient_ide_source = patient_map_id_source and em.patient_ide=patient_map_id)' 
        using existingEncounterNum, disEncounterId;
       else 

            maxEncounterNum := maxEncounterNum + 1 ;
			--TODO : add update colunn
             execute immediate ' insert into ' || tempEidTableName ||' (encounter_map_id,encounter_map_id_source,encounter_id,encounter_id_source,encounter_num,process_status_flag
             ,encounter_map_id_status,update_date,download_date,import_date,sourcesystem_cd,patient_map_id,patient_map_id_source) 
             values(:x,''HIVE'',:y,''HIVE'',:z,''P'',''A'',sysdate,sysdate,sysdate,''edu.harvard.i2b2.crc'',:a,:b)' using maxEncounterNum,maxEncounterNum,maxEncounterNum,disPatientId,disPatientIdSource; 
            execute immediate ' update ' || tempEidTableName ||' set encounter_num =  :x , process_status_flag = ''P'' 
            where encounter_id = :y and  not exists (select 1 from 
            encounter_mapping em where em.encounter_ide = encounter_map_id
            and em.encounter_ide_source = encounter_map_id_source
            and em.patient_ide_source = patient_map_id_source and em.patient_ide=patient_map_id)' using maxEncounterNum, disEncounterId;
            
       end if ;
    
      -- dbms_output.put_line(' NOT HIVE ');
 end if; 

END LOOP;
close distinctEidCur ;
commit;
 -- do the mapping update if the update date is old
   execute immediate ' merge into encounter_mapping
      using ' || tempEidTableName ||' temp
      on (temp.encounter_map_id = encounter_mapping.ENCOUNTER_IDE 
  		  and temp.encounter_map_id_source = encounter_mapping.ENCOUNTER_IDE_SOURCE
	   ) when matched then 
  		update set ENCOUNTER_NUM = temp.encounter_id,
    	patient_ide   =   temp.patient_map_id ,
    	patient_ide_source  =	temp.patient_map_id_source ,
    	encounter_ide_status	= temp.encounter_map_id_status  ,
    	update_date = temp.update_date,
    	download_date  = temp.download_date ,
		import_date = sysdate ,
    	sourcesystem_cd  = temp.sourcesystem_cd ,
		upload_id = ' || upload_id ||'  
    	where  temp.encounter_id_source = ''HIVE'' and temp.process_status_flag is null  and
        nvl(encounter_mapping.update_date,to_date(''01-JAN-1900'',''DD-MON-YYYY''))<= nvl(temp.update_date,to_date(''01-JAN-1900'',''DD-MON-YYYY'')) ' ;

-- insert new mapping records i.e flagged P -- jk: added project_id
execute immediate ' insert into encounter_mapping (encounter_ide,encounter_ide_source,encounter_ide_status,encounter_num,patient_ide,patient_ide_source,update_date,download_date,import_date,sourcesystem_cd,project_id,upload_id) 
    select encounter_map_id,encounter_map_id_source,encounter_map_id_status,encounter_num,patient_map_id,patient_map_id_source,update_date,download_date,sysdate,sourcesystem_cd,''@'' project_id,' || upload_id || ' from ' || tempEidTableName || '  
    where process_status_flag = ''P'' ' ; 
commit;
EXCEPTION
   WHEN OTHERS THEN
      if distinctEidCur%isopen then
          close distinctEidCur;
      end if;
      rollback;
      raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
end;

/
--------------------------------------------------------
--  DDL for Procedure INSERT_ENCOUNTERVISIT_FROMTEMP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."INSERT_ENCOUNTERVISIT_FROMTEMP" (tempTableName IN VARCHAR, upload_id IN NUMBER,
  errorMsg OUT VARCHAR) 
IS 
maxEncounterNum number; 
BEGIN 

     --Delete duplicate rows with same encounter and patient combination
	execute immediate 'DELETE FROM ' || tempTableName || ' t1 WHERE rowid > 
					   (SELECT  min(rowid) FROM ' || tempTableName || ' t2
					     WHERE t1.encounter_id = t2.encounter_id 
                                            AND t1.encounter_id_source = t2.encounter_id_source
                                            AND nvl(t1.patient_id,'''') = nvl(t2.patient_id,'''')
                                            AND nvl(t1.patient_id_source,'''') = nvl(t2.patient_id_source,''''))';

	 LOCK TABLE  encounter_mapping IN EXCLUSIVE MODE NOWAIT;
    -- select max(encounter_num) into maxEncounterNum from encounter_mapping ;

	 --Create new patient(patient_mapping) if temp table patient_ide does not exists 
	-- in patient_mapping table. -- jk added project id
     execute immediate ' insert into encounter_mapping (encounter_ide,encounter_ide_source,encounter_num,patient_ide,patient_ide_source,encounter_ide_status, project_id,upload_id)
     	(select distinctTemp.encounter_id, distinctTemp.encounter_id_source, distinctTemp.encounter_id,  distinctTemp.patient_id,distinctTemp.patient_id_source,''A'',''@'' project_id, '|| upload_id ||'
				from 
					(select distinct encounter_id, encounter_id_source,patient_id,patient_id_source from ' || tempTableName || '  temp
					where 
				     not exists (select encounter_ide from encounter_mapping em where em.encounter_ide = temp.encounter_id and em.encounter_ide_source = temp.encounter_id_source)
					 and encounter_id_source = ''HIVE'' )   distinctTemp) ' ;

	
	
	-- update patient_num for temp table
execute immediate ' UPDATE ' ||  tempTableName
 || ' SET encounter_num = (SELECT em.encounter_num
		     FROM encounter_mapping em
		     WHERE em.encounter_ide = '|| tempTableName ||'.encounter_id
                     and em.encounter_ide_source = '|| tempTableName ||'.encounter_id_source 
					 and nvl(em.patient_ide_source,'''') = nvl('|| tempTableName ||'.patient_id_source,'''')
				     and nvl(em.patient_ide,'''')= nvl('|| tempTableName ||'.patient_id,'''')
	 	    )
WHERE EXISTS (SELECT em.encounter_num 
		     FROM encounter_mapping em
		     WHERE em.encounter_ide = '|| tempTableName ||'.encounter_id
                     and em.encounter_ide_source = '||tempTableName||'.encounter_id_source
					 and nvl(em.patient_ide_source,'''') = nvl('|| tempTableName ||'.patient_id_source,'''')
				     and nvl(em.patient_ide,'''')= nvl('|| tempTableName ||'.patient_id,''''))';	

	 execute immediate ' UPDATE visit_dimension  set  (	START_DATE,END_DATE,INOUT_CD,LOCATION_CD,VISIT_BLOB,UPDATE_DATE,DOWNLOAD_DATE,IMPORT_DATE,SOURCESYSTEM_CD, UPLOAD_ID ) 
			= (select temp.START_DATE,temp.END_DATE,temp.INOUT_CD,temp.LOCATION_CD,temp.VISIT_BLOB,temp.update_date,temp.DOWNLOAD_DATE,sysdate,temp.SOURCESYSTEM_CD,
			     	' || UPLOAD_ID  || ' from ' || tempTableName || '  temp   where 
					temp.encounter_num = visit_dimension.encounter_num and temp.update_date >= visit_dimension.update_date) 
					where exists (select 1 from ' || tempTableName || ' temp  where temp.encounter_num = visit_dimension.encounter_num 
					and temp.update_date >= visit_dimension.update_date) ';

   -- jk: added project_id='@' to WHERE clause... need to support projects...
   execute immediate 'insert into visit_dimension  (encounter_num,patient_num,START_DATE,END_DATE,INOUT_CD,LOCATION_CD,VISIT_BLOB,UPDATE_DATE,DOWNLOAD_DATE,IMPORT_DATE,SOURCESYSTEM_CD, UPLOAD_ID)
	               select temp.encounter_num, pm.patient_num,
					temp.START_DATE,temp.END_DATE,temp.INOUT_CD,temp.LOCATION_CD,temp.VISIT_BLOB,
					temp.update_date,
					temp.download_date,
					sysdate, -- import date
					temp.sourcesystem_cd,
		            '|| upload_id ||'
			from 
				' || tempTableName || '  temp , patient_mapping pm 
			where 
                 temp.encounter_num is not null and 
		      	 not exists (select encounter_num from visit_dimension vd where vd.encounter_num = temp.encounter_num) and 
				 pm.patient_ide = temp.patient_id and pm.patient_ide_source = temp.patient_id_source 
                 and pm.project_id=''@''
	 ';
commit;
		        
EXCEPTION
	WHEN OTHERS THEN
		rollback;
		raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);	
END;
 

/
--------------------------------------------------------
--  DDL for Procedure INSERT_MODIFIER_FROMTEMP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."INSERT_MODIFIER_FROMTEMP" (tempModifierTableName IN VARCHAR, upload_id IN NUMBER, errorMsg OUT VARCHAR ) 
IS 

BEGIN 
	--Delete duplicate rows 
	execute immediate 'DELETE FROM ' || tempModifierTableName || ' t1 WHERE rowid > 
					   (SELECT  min(rowid) FROM ' || tempModifierTableName || ' t2
					     WHERE t1.modifier_cd = t2.modifier_cd 
                                            AND t1.modifier_path = t2.modifier_path
                                            )';
	
	   execute immediate ' UPDATE modifier_dimension  set  (modifier_cd,
                        name_char,modifier_blob,
                        update_date,download_date,
                        import_date,sourcesystem_cd,
			     	UPLOAD_ID) = (select temp.modifier_cd, temp.name_char,temp.modifier_blob,temp.update_date,temp.DOWNLOAD_DATE,sysdate,temp.SOURCESYSTEM_CD,
			     	' || UPLOAD_ID  || ' from ' || tempModifierTableName || '  temp   where 
					temp.modifier_path = modifier_dimension.modifier_path and temp.update_date >= modifier_dimension.update_date) 
					where exists (select 1 from ' || tempModifierTableName || ' temp  where temp.modifier_path = modifier_dimension.modifier_path 
					and temp.update_date >= modifier_dimension.update_date) ';



   
    --Create new modifier if temp table modifier_path does not exists 
	-- in modifier dimension table.
	execute immediate 'insert into modifier_dimension  (modifier_cd,modifier_path,name_char,modifier_blob,update_date,download_date,import_date,sourcesystem_cd,upload_id)
			    select  modifier_cd, modifier_path,
                        name_char,modifier_blob,
                        update_date,download_date,
                        sysdate,sourcesystem_cd,
                         ' || upload_id || '  from ' || tempModifierTableName || '  temp
					where not exists (select modifier_cd from modifier_dimension cd where cd.modifier_path = temp.modifier_path)
					 
	';
	
	
    
    
EXCEPTION
	WHEN OTHERS THEN
		raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);	
END;

 

/
--------------------------------------------------------
--  DDL for Procedure INSERT_PATIENT_FROMTEMP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."INSERT_PATIENT_FROMTEMP" (tempTableName IN VARCHAR,upload_id IN NUMBER,
  errorMsg OUT VARCHAR) 
AS
maxPatientNum number; 

BEGIN 
 
     LOCK TABLE  patient_mapping IN EXCLUSIVE MODE NOWAIT;
     --select max(patient_num) into maxPatientNum from patient_mapping ;

	 --Create new patient(patient_mapping) if temp table patient_ide does not exists 
	-- in patient_mapping table.
     execute immediate ' insert into patient_mapping (patient_ide,patient_ide_source,patient_num,patient_ide_status, upload_id)
     	(select distinctTemp.patient_id, distinctTemp.patient_id_source, distinctTemp.patient_id, ''A'',   '|| upload_id ||'
				from 
					(select distinct patient_id, patient_id_source from ' || tempTableName || '  temp
					where  not exists (select patient_ide from patient_mapping pm where pm.patient_ide = temp.patient_id and pm.patient_ide_source = temp.patient_id_source)
					 and patient_id_source = ''HIVE'' )   distinctTemp) ';


-- update patient_num for temp table
 execute immediate ' UPDATE ' ||  tempTableName
 || ' SET patient_num = (SELECT pm.patient_num
		     FROM patient_mapping pm
		     WHERE pm.patient_ide = '|| tempTableName ||'.patient_id
                     and pm.patient_ide_source = '|| tempTableName ||'.patient_id_source
	 	    )
WHERE EXISTS (SELECT pm.patient_num 
		     FROM patient_mapping pm
		     WHERE pm.patient_ide = '|| tempTableName ||'.patient_id
                     and pm.patient_ide_source = '||tempTableName||'.patient_id_source)';	



   execute immediate ' UPDATE patient_dimension  set  (VITAL_STATUS_CD, BIRTH_DATE, DEATH_DATE,
					SEX_CD, AGE_IN_YEARS_NUM,LANGUAGE_CD,RACE_CD,MARITAL_STATUS_CD, RELIGION_CD,
					ZIP_CD,STATECITYZIP_PATH,PATIENT_BLOB,UPDATE_DATE,DOWNLOAD_DATE,IMPORT_DATE,SOURCESYSTEM_CD,
			     	UPLOAD_ID) = (select temp.VITAL_STATUS_CD, temp.BIRTH_DATE, temp.DEATH_DATE,
					temp.SEX_CD, temp.AGE_IN_YEARS_NUM,temp.LANGUAGE_CD,temp.RACE_CD,temp.MARITAL_STATUS_CD, temp.RELIGION_CD,
					temp.ZIP_CD,temp.STATECITYZIP_PATH,temp.PATIENT_BLOB,temp.update_date,temp.DOWNLOAD_DATE,sysdate,temp.SOURCESYSTEM_CD,
			     	' || UPLOAD_ID  || ' from ' || tempTableName || '  temp   where 
					temp.patient_num = patient_dimension.patient_num and temp.update_date >= patient_dimension.update_date) 
					where exists (select 1 from ' || tempTableName || ' temp  where temp.patient_num = patient_dimension.patient_num 
					and temp.update_date >= patient_dimension.update_date) ';


	--Create new patient(patient_dimension) for above inserted patient's.
	--If patient_dimension table's patient num does match temp table,
	--then new patient_dimension information is inserted.
	execute immediate 'insert into patient_dimension  (PATIENT_NUM,VITAL_STATUS_CD, BIRTH_DATE, DEATH_DATE,
					SEX_CD, AGE_IN_YEARS_NUM,LANGUAGE_CD,RACE_CD,MARITAL_STATUS_CD, RELIGION_CD,
					ZIP_CD,STATECITYZIP_PATH,PATIENT_BLOB,UPDATE_DATE,DOWNLOAD_DATE,IMPORT_DATE,SOURCESYSTEM_CD,
			     	UPLOAD_ID)
	               select temp.patient_num,
					temp.VITAL_STATUS_CD, temp.BIRTH_DATE, temp.DEATH_DATE,
					temp.SEX_CD, temp.AGE_IN_YEARS_NUM,temp.LANGUAGE_CD,temp.RACE_CD,temp.MARITAL_STATUS_CD, temp.RELIGION_CD,
					temp.ZIP_CD,temp.STATECITYZIP_PATH,temp.PATIENT_BLOB,
					temp.update_date,
					temp.download_date,
					sysdate, -- import date
					temp.sourcesystem_cd,
		            '|| upload_id ||'
			from 
				' || tempTableName || '  temp 
			where 
		      	 not exists (select patient_num from patient_dimension pd where pd.patient_num = temp.patient_num) and 
                 patient_num is not null
	 ';
		        

    commit;
EXCEPTION
	WHEN OTHERS THEN
	    rollback;
		dbms_output.put_line(SQLCODE|| ' - ' ||SQLERRM);
END;

/
--------------------------------------------------------
--  DDL for Procedure INSERT_PATIENT_MAP_FROMTEMP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."INSERT_PATIENT_MAP_FROMTEMP" (tempPatientTableName IN VARCHAR,  upload_id IN NUMBER,
   errorMsg OUT VARCHAR ) 
IS 

BEGIN 
	
	--Create new patient mapping entry for HIVE patient's if they are not already mapped in mapping table
	execute immediate 'insert into patient_mapping (
		select distinct temp.patient_id, temp.patient_id_source,''A'',temp.patient_id ,' || upload_id || '
		from ' || tempPatientTableName ||'  temp 
		where temp.patient_id_source = ''HIVE'' and 
   		not exists (select patient_ide from patient_mapping pm where pm.patient_num = temp.patient_id and pm.patient_ide_source = temp.patient_id_source) 
		)'; 

    --Create new visit for above inserted encounter's
	--If Visit table's encounter and patient num does match temp table,
	--then new visit information is created.
	execute immediate 'MERGE  INTO patient_dimension pd
		   USING ( select case when (ptemp.patient_id_source=''HIVE'') then to_number(ptemp.patient_id)
                                       else pmap.patient_num end patient_num,
                                  ptemp.VITAL_STATUS_CD, 
                                  ptemp.BIRTH_DATE,
                                  ptemp.DEATH_DATE, 
                                  ptemp.SEX_CD ,
                                  ptemp.AGE_IN_YEARS_NUM,
                                  ptemp.LANGUAGE_CD,
                                  ptemp.RACE_CD,
                                  ptemp.MARITAL_STATUS_CD,
                                  ptemp.RELIGION_CD,
                                  ptemp.ZIP_CD,
								  ptemp.STATECITYZIP_PATH , 
								  ptemp.PATIENT_BLOB, 
								  ptemp.UPDATE_DATE, 
								  ptemp.DOWNLOAD_DATE, 
								  ptemp.IMPORT_DATE, 
								  ptemp.SOURCESYSTEM_CD
								 
                   from ' || tempPatientTableName || '  ptemp , patient_mapping pmap
                   where   ptemp.patient_id = pmap.patient_ide(+)
                   and ptemp.patient_id_source = pmap.patient_ide_source(+)
           ) temp
		   on (
				pd.patient_num = temp.patient_num
		    )    
			when matched then 
			 	update  set 
			 		pd.VITAL_STATUS_CD= temp.VITAL_STATUS_CD,
                    pd.BIRTH_DATE= temp.BIRTH_DATE,
                    pd.DEATH_DATE= temp.DEATH_DATE,
                    pd.SEX_CD= temp.SEX_CD,
                    pd.AGE_IN_YEARS_NUM=temp.AGE_IN_YEARS_NUM,
                    pd.LANGUAGE_CD=temp.LANGUAGE_CD,
                    pd.RACE_CD=temp.RACE_CD,
                    pd.MARITAL_STATUS_CD=temp.MARITAL_STATUS_CD,
                    pd.RELIGION_CD=temp.RELIGION_CD,
                    pd.ZIP_CD=temp.ZIP_CD,
					pd.STATECITYZIP_PATH =temp.STATECITYZIP_PATH,
					pd.PATIENT_BLOB=temp.PATIENT_BLOB,
					pd.UPDATE_DATE=temp.UPDATE_DATE,
					pd.DOWNLOAD_DATE=temp.DOWNLOAD_DATE,
					pd.SOURCESYSTEM_CD=temp.SOURCESYSTEM_CD,
					pd.UPLOAD_ID = '||upload_id||'
                    where temp.update_date > pd.update_date
			 when not matched then 
			 	insert (
					PATIENT_NUM,
					VITAL_STATUS_CD,
                    BIRTH_DATE,
                    DEATH_DATE,
                    SEX_CD,
                    AGE_IN_YEARS_NUM,
                    LANGUAGE_CD,
                    RACE_CD,
                    MARITAL_STATUS_CD,
                    RELIGION_CD,
                    ZIP_CD,
					STATECITYZIP_PATH,
					PATIENT_BLOB,
					UPDATE_DATE,
					DOWNLOAD_DATE,
					SOURCESYSTEM_CD,
					import_date,
	                upload_id
 					) 
			 	values (
 					temp.PATIENT_NUM,
					temp.VITAL_STATUS_CD,
                    temp.BIRTH_DATE,
                    temp.DEATH_DATE,
                    temp.SEX_CD,
                    temp.AGE_IN_YEARS_NUM,
                    temp.LANGUAGE_CD,
                    temp.RACE_CD,
                    temp.MARITAL_STATUS_CD,
                    temp.RELIGION_CD,
                    temp.ZIP_CD,
					temp.STATECITYZIP_PATH,
					temp.PATIENT_BLOB,
					temp.UPDATE_DATE,
					temp.DOWNLOAD_DATE,
					temp.SOURCESYSTEM_CD,
					sysdate,
	     			'||upload_id||'
 				)';

    
EXCEPTION
	WHEN OTHERS THEN
		raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);	
END;
 

/
--------------------------------------------------------
--  DDL for Procedure INSERT_PID_MAP_FROMTEMP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."INSERT_PID_MAP_FROMTEMP" (tempPidTableName IN VARCHAR,  upload_id IN NUMBER, 
   errorMsg OUT VARCHAR) 
is
 existingPatientNum varchar2(32);
 maxPatientNum number;

 TYPE distinctPidCurTyp IS REF CURSOR;
distinctPidCur   distinctPidCurTyp;
 sql_stmt  varchar2(400);
 
disPatientId varchar2(100); 
disPatientIdSource varchar2(100);

BEGIN
 sql_stmt := ' SELECT distinct patient_id,patient_id_source from ' || tempPidTableName ||' ';
 
  --delete the data if they miss 
  execute immediate ' delete  from ' || tempPidTableName ||  ' t1  where 
rowid > (select min(rowid) from ' || tempPidTableName || ' t2 
where t1.patient_map_id = t2.patient_map_id
and t1.patient_map_id_source = t2.patient_map_id_source) ';
  
 LOCK TABLE  patient_mapping IN EXCLUSIVE MODE NOWAIT;
 select max(patient_num) into maxPatientNum from patient_mapping ; 
 -- set max patient num to zero of the value is null
 if maxPatientNum is null then 
  maxPatientNum := 0;
end if;

  open distinctPidCur for sql_stmt ;
 
   loop
   
     FETCH distinctPidCur INTO disPatientId, disPatientIdSource;
      EXIT WHEN distinctPidCur%NOTFOUND;
        -- dbms_output.put_line(disPatientId);
        
  if  disPatientIdSource = 'HIVE'  THEN 
   begin
    --check if hive number exist, if so assign that number to reset of map_id's within that pid
    select patient_num into existingPatientNum from patient_mapping where patient_num = disPatientId and patient_ide_source = 'HIVE';
    EXCEPTION  
       when NO_DATA_FOUND THEN
           existingPatientNum := null;
    end;
   if existingPatientNum is not null then 
        execute immediate ' update ' || tempPidTableName ||' set patient_num = patient_id, process_status_flag = ''P''
        where patient_id = :x and not exists (select 1 from patient_mapping pm where pm.patient_ide = patient_map_id
        and pm.patient_ide_source = patient_map_id_source)' using disPatientId;
   else 
        -- generate new patient_num i.e. take max(patient_num) + 1 
        if maxPatientNum < disPatientId then 
            maxPatientNum := disPatientId;
        end if ;
        execute immediate ' update ' || tempPidTableName ||' set patient_num = patient_id, process_status_flag = ''P'' where 
        patient_id = :x and patient_id_source = ''HIVE'' and not exists (select 1 from patient_mapping pm where pm.patient_ide = patient_map_id
        and pm.patient_ide_source = patient_map_id_source)' using disPatientId;
   end if;    
    
   -- test if record fectched
   -- dbms_output.put_line(' HIVE ');

 else 
    begin
       select patient_num into existingPatientNum from patient_mapping where patient_ide = disPatientId and 
        patient_ide_source = disPatientIdSource ; 

       -- test if record fetched. 
       EXCEPTION
           WHEN NO_DATA_FOUND THEN
           existingPatientNum := null;
       end;
       if existingPatientNum is not null then 
            execute immediate ' update ' || tempPidTableName ||' set patient_num = :x , process_status_flag = ''P''
            where patient_id = :y and not exists (select 1 from patient_mapping pm where pm.patient_ide = patient_map_id
        and pm.patient_ide_source = patient_map_id_source)' using  existingPatientNum,disPatientId;
       else 

            maxPatientNum := maxPatientNum + 1 ; 
             execute immediate 'insert into ' || tempPidTableName ||' (patient_map_id,patient_map_id_source,patient_id,patient_id_source,patient_num,process_status_flag
             ,patient_map_id_status,update_date,download_date,import_date,sourcesystem_cd) 
             values(:x,''HIVE'',:y,''HIVE'',:z,''P'',''A'',sysdate,sysdate,sysdate,''edu.harvard.i2b2.crc'')' using maxPatientNum,maxPatientNum,maxPatientNum; 
            execute immediate 'update ' || tempPidTableName ||' set patient_num =  :x , process_status_flag = ''P'' 
             where patient_id = :y and  not exists (select 1 from 
            patient_mapping pm where pm.patient_ide = patient_map_id
            and pm.patient_ide_source = patient_map_id_source)' using maxPatientNum, disPatientId  ;
            
       end if ;
    
      -- dbms_output.put_line(' NOT HIVE ');
 end if; 

END LOOP;
close distinctPidCur ;
commit;

-- do the mapping update if the update date is old
   execute immediate ' merge into patient_mapping
      using ' || tempPidTableName ||' temp
      on (temp.patient_map_id = patient_mapping.patient_IDE 
  		  and temp.patient_map_id_source = patient_mapping.patient_IDE_SOURCE
	   ) when matched then 
  		update set patient_num = temp.patient_id,
    	patient_ide_status	= temp.patient_map_id_status  ,
    	update_date = temp.update_date,
    	download_date  = temp.download_date ,
		import_date = sysdate ,
    	sourcesystem_cd  = temp.sourcesystem_cd ,
		upload_id = ' || upload_id ||'  
    	where  temp.patient_id_source = ''HIVE'' and temp.process_status_flag is null  and
        nvl(patient_mapping.update_date,to_date(''01-JAN-1900'',''DD-MON-YYYY''))<= nvl(temp.update_date,to_date(''01-JAN-1900'',''DD-MON-YYYY'')) ' ;

-- insert new mapping records i.e flagged P - jk: added project id
execute immediate ' insert into patient_mapping (patient_ide,patient_ide_source,patient_ide_status,patient_num,update_date,download_date,import_date,sourcesystem_cd, project_id,upload_id) 
    select patient_map_id,patient_map_id_source,patient_map_id_status,patient_num,update_date,download_date,sysdate,sourcesystem_cd,''@'' project_id,' || upload_id ||' from '|| tempPidTableName || ' 
    where process_status_flag = ''P'' ' ; 
commit;
EXCEPTION
   WHEN OTHERS THEN
      if distinctPidCur%isopen then
          close distinctPidCur;
      end if;
      rollback;
      raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
end;

/
--------------------------------------------------------
--  DDL for Procedure INSERT_PROVIDER_FROMTEMP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."INSERT_PROVIDER_FROMTEMP" (tempProviderTableName IN VARCHAR, upload_id IN NUMBER,
   errorMsg OUT VARCHAR)

IS 

BEGIN 
	--Delete duplicate rows with same encounter and patient combination
	execute immediate 'DELETE FROM ' || tempProviderTableName || ' t1 WHERE rowid > 
					   (SELECT  min(rowid) FROM ' || tempProviderTableName || ' t2
					     WHERE t1.provider_id = t2.provider_id 
                                            AND t1.provider_path = t2.provider_path
                                            )';
	
	

 execute immediate ' UPDATE provider_dimension  set  (provider_id,
                        name_char,provider_blob,
                        update_date,download_date,
                        import_date,sourcesystem_cd,
			     	UPLOAD_ID) = (select temp.provider_id, temp.name_char,temp.provider_blob,temp.update_date,temp.DOWNLOAD_DATE,sysdate,temp.SOURCESYSTEM_CD,
			     	' || UPLOAD_ID  || ' from ' || tempProviderTableName || '  temp   where 
					temp.provider_path = provider_dimension.provider_path and temp.update_date >= provider_dimension.update_date) 
					where exists (select 1 from ' || tempProviderTableName || ' temp  where temp.provider_path = provider_dimension.provider_path 
					and temp.update_date >= provider_dimension.update_date) ';

   
    --Create new patient(patient_mapping) if temp table patient_ide does not exists 
	-- in patient_mapping table.
	execute immediate 'insert into provider_dimension  (provider_id,provider_path,name_char,provider_blob,update_date,download_date,import_date,sourcesystem_cd,upload_id)
			    select  provider_id,provider_path, 
                        name_char,provider_blob,
                        update_date,download_date,
                        sysdate,sourcesystem_cd, ' || upload_id || '
	                    
                         from ' || tempProviderTableName || '  temp
					where not exists (select provider_id from provider_dimension pd where pd.provider_path = temp.provider_path )';
	
	
    
    
EXCEPTION
	WHEN OTHERS THEN
		raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);	
END;
 

/
--------------------------------------------------------
--  DDL for Procedure REMOVE_TEMP_TABLE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."REMOVE_TEMP_TABLE" (tempTableName VARCHAR) 
IS
BEGIN 
	execute immediate 'drop table ' || tempTableName || ' cascade constraints';
	
EXCEPTION
	WHEN OTHERS THEN
		dbms_output.put_line(SQLCODE|| ' - ' ||SQLERRM);
END;

/
--------------------------------------------------------
--  DDL for Procedure SYNC_CLEAR_CONCEPT_TABLE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."SYNC_CLEAR_CONCEPT_TABLE" (tempConceptTableName in VARCHAR, backupConceptTableName IN VARCHAR, uploadId in NUMBER, errorMsg OUT VARCHAR ) 
IS 

interConceptTableName  varchar2(400);

BEGIN 
	interConceptTableName := backupConceptTableName || '_inter';
	
		--Delete duplicate rows with same encounter and patient combination
	execute immediate 'DELETE FROM ' || tempConceptTableName || ' t1 WHERE rowid > 
					   (SELECT  min(rowid) FROM ' || tempConceptTableName || ' t2
					     WHERE t1.concept_cd = t2.concept_cd 
                                            AND t1.concept_path = t2.concept_path
                                            )';

    execute immediate 'create table ' ||  interConceptTableName || ' (
    CONCEPT_CD          VARCHAR2(50) NOT NULL,
	CONCEPT_PATH    	VARCHAR2(700) NOT NULL,
	NAME_CHAR       	VARCHAR2(2000) NULL,
	CONCEPT_BLOB        CLOB NULL,
	UPDATE_DATE         DATE NULL,
	DOWNLOAD_DATE       DATE NULL,
	IMPORT_DATE         DATE NULL,
	SOURCESYSTEM_CD     VARCHAR2(50) NULL,
	UPLOAD_ID       	NUMBER(38,0) NULL,
    CONSTRAINT '|| interConceptTableName ||'_pk  PRIMARY KEY(CONCEPT_PATH)
	 )';
    
    --Create new patient(patient_mapping) if temp table patient_ide does not exists 
	-- in patient_mapping table.
	execute immediate 'insert into '|| interConceptTableName ||'  (concept_cd,concept_path,name_char,concept_blob,update_date,download_date,import_date,sourcesystem_cd,upload_id)
			    select  concept_cd, substr(concept_path,1,700),
                        name_char,concept_blob,
                        update_date,download_date,
                        sysdate,sourcesystem_cd,
                         ' || uploadId || '  from ' || tempConceptTableName || '  temp ';
	--backup the concept_dimension table before creating a new one
	execute immediate 'alter table concept_dimension rename to ' || backupConceptTableName  ||'' ;
    
	-- add index on upload_id 
    execute immediate 'CREATE INDEX ' || interConceptTableName || '_uid_idx ON ' || interConceptTableName || '(UPLOAD_ID)';

    -- add index on upload_id 
    execute immediate 'CREATE INDEX ' || interConceptTableName || '_cd_idx ON ' || interConceptTableName || '(concept_cd)';

    
    --backup the concept_dimension table before creating a new one
	execute immediate 'alter table ' || interConceptTableName  || ' rename to concept_dimension' ;
 
EXCEPTION
	WHEN OTHERS THEN
		raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);	
END;

 

/
--------------------------------------------------------
--  DDL for Procedure SYNC_CLEAR_MODIFIER_TABLE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."SYNC_CLEAR_MODIFIER_TABLE" (tempModifierTableName in VARCHAR, backupModifierTableName IN VARCHAR, uploadId in NUMBER, errorMsg OUT VARCHAR ) 
IS 

interModifierTableName  varchar2(400);

BEGIN 
	interModifierTableName := backupModifierTableName || '_inter';
	
	--Delete duplicate rows with same modifier_path and modifier cd
	execute immediate 'DELETE FROM ' || tempModifierTableName || ' t1 WHERE rowid > 
					   (SELECT  min(rowid) FROM ' || tempModifierTableName || ' t2
					     WHERE t1.modifier_cd = t2.modifier_cd 
                                            AND t1.modifier_path = t2.modifier_path
                                            )';

    execute immediate 'create table ' ||  interModifierTableName || ' (
        MODIFIER_CD          VARCHAR2(50) NOT NULL,
	MODIFIER_PATH    	VARCHAR2(700) NOT NULL,
	NAME_CHAR       	VARCHAR2(2000) NULL,
	MODIFIER_BLOB        CLOB NULL,
	UPDATE_DATE         DATE NULL,
	DOWNLOAD_DATE       DATE NULL,
	IMPORT_DATE         DATE NULL,
	SOURCESYSTEM_CD     VARCHAR2(50) NULL,
	UPLOAD_ID       	NUMBER(38,0) NULL,
    CONSTRAINT '|| interModifierTableName ||'_pk  PRIMARY KEY(MODIFIER_PATH)
	 )';
    
    --Create new patient(patient_mapping) if temp table patient_ide does not exists 
	-- in patient_mapping table.
	execute immediate 'insert into '|| interModifierTableName ||'  (modifier_cd,modifier_path,name_char,modifier_blob,update_date,download_date,import_date,sourcesystem_cd,upload_id)
			    select  modifier_cd, substr(modifier_path,1,700),
                        name_char,modifier_blob,
                        update_date,download_date,
                        sysdate,sourcesystem_cd,
                         ' || uploadId || '  from ' || tempModifierTableName || '  temp ';
	--backup the modifier_dimension table before creating a new one
	execute immediate 'alter table modifier_dimension rename to ' || backupModifierTableName  ||'' ;
    
	-- add index on upload_id 
    execute immediate 'CREATE INDEX ' || interModifierTableName || '_uid_idx ON ' || interModifierTableName || '(UPLOAD_ID)';

    -- add index on upload_id 
    execute immediate 'CREATE INDEX ' || interModifierTableName || '_cd_idx ON ' || interModifierTableName || '(modifier_cd)';

    
       --backup the modifier_dimension table before creating a new one
	execute immediate 'alter table ' || interModifierTableName  || ' rename to modifier_dimension' ;
 
EXCEPTION
	WHEN OTHERS THEN
		raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);	
END;

 

/
--------------------------------------------------------
--  DDL for Procedure SYNC_CLEAR_PROVIDER_TABLE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."SYNC_CLEAR_PROVIDER_TABLE" (tempProviderTableName in VARCHAR, backupProviderTableName IN VARCHAR, uploadId in NUMBER, errorMsg OUT VARCHAR ) 
IS 

interProviderTableName  varchar2(400);

BEGIN 
	interProviderTableName := backupProviderTableName || '_inter';
	
		--Delete duplicate rows with same encounter and patient combination
	execute immediate 'DELETE FROM ' || tempProviderTableName || ' t1 WHERE rowid > 
					   (SELECT  min(rowid) FROM ' || tempProviderTableName || ' t2
					     WHERE t1.provider_id = t2.provider_id 
                                            AND t1.provider_path = t2.provider_path
                                            )';

    execute immediate 'create table ' ||  interProviderTableName || ' (
    PROVIDER_ID         VARCHAR2(50) NOT NULL,
	PROVIDER_PATH       VARCHAR2(700) NOT NULL,
	NAME_CHAR       	VARCHAR2(850) NULL,
	PROVIDER_BLOB       CLOB NULL,
	UPDATE_DATE     	DATE NULL,
	DOWNLOAD_DATE       DATE NULL,
	IMPORT_DATE         DATE NULL,
	SOURCESYSTEM_CD     VARCHAR2(50) NULL,
	UPLOAD_ID        	NUMBER(38,0) NULL ,
    CONSTRAINT  ' || interProviderTableName || '_pk PRIMARY KEY(PROVIDER_PATH,provider_id)
	 )';
    
    --Create new patient(patient_mapping) if temp table patient_ide does not exists 
	-- in patient_mapping table.
	execute immediate 'insert into ' ||  interProviderTableName || ' (provider_id,provider_path,name_char,provider_blob,update_date,download_date,import_date,sourcesystem_cd,upload_id)
			    select  provider_id,provider_path, 
                        name_char,provider_blob,
                        update_date,download_date,
                        sysdate,sourcesystem_cd, ' || uploadId || '
	                     from ' || tempProviderTableName || '  temp ';
					
	--backup the concept_dimension table before creating a new one
	execute immediate 'alter table provider_dimension rename to ' || backupProviderTableName  ||'' ;
    
	-- add index on provider_id, name_char 
    execute immediate 'CREATE INDEX ' || interProviderTableName || '_id_idx ON ' || interProviderTableName  || '(Provider_Id,name_char)';
    execute immediate 'CREATE INDEX ' || interProviderTableName || '_uid_idx ON ' || interProviderTableName  || '(UPLOAD_ID)';

	--backup the concept_dimension table before creating a new one
	execute immediate 'alter table ' || interProviderTableName  || ' rename to provider_dimension' ;
 
EXCEPTION
	WHEN OTHERS THEN
		raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);	
END;

 

/
--------------------------------------------------------
--  DDL for Procedure UPDATE_OBSERVATION_FACT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."UPDATE_OBSERVATION_FACT" (upload_temptable_name IN VARCHAR, upload_id IN NUMBER, appendFlag IN NUMBER,
   errorMsg OUT VARCHAR)
IS
BEGIN



--Delete duplicate records(encounter_ide,patient_ide,concept_cd,start_date,modifier_cd,provider_id)
execute immediate 'DELETE FROM ' || upload_temptable_name ||'  t1 
  where rowid > (select min(rowid) from ' || upload_temptable_name ||' t2 
    where t1.encounter_id = t2.encounter_id  
          and
          t1.encounter_id_source = t2.encounter_id_source
          and
          t1.patient_id = t2.patient_id 
          and 
          t1.patient_id_source = t2.patient_id_source
          and 
          t1.concept_cd = t2.concept_cd
          and 
          t1.start_date = t2.start_date
          and 
          nvl(t1.modifier_cd,''xyz'') = nvl(t2.modifier_cd,''xyz'')
		  and 
		  t1.instance_num = t2.instance_num
          and 
          t1.provider_id = t2.provider_id)';

          
--Delete records having null in start_date
execute immediate 'DELETE FROM ' || upload_temptable_name ||'  t1           
 where t1.start_date is null';
           
           
--One time lookup on encounter_ide to get encounter_num jk: added dummy project id
-- jgk 8/13/14: site encounter #s are only distinct per patient
-- jgk 10/13/14: bugfix
execute immediate 'UPDATE ' ||  upload_temptable_name
 || ' SET encounter_num = (SELECT em.encounter_num
		     FROM encounter_mapping em
		     WHERE em.encounter_ide = ' || upload_temptable_name||'.encounter_id
                     and em.encounter_ide_source = '|| upload_temptable_name||'.encounter_id_source
                     and em.project_id=''@'' and em.patient_ide = ' || upload_temptable_name||'.patient_id
                     and em.patient_ide_source = '|| upload_temptable_name||'.patient_id_source
	 	    )
WHERE EXISTS (SELECT em.encounter_num
		     FROM encounter_mapping em
		     WHERE em.encounter_ide = '|| upload_temptable_name||'.encounter_id
                     and em.encounter_ide_source = '||upload_temptable_name||'.encounter_id_source
                     and em.project_id=''@'' and em.patient_ide = ' || upload_temptable_name||'.patient_id
                     and em.patient_ide_source = '|| upload_temptable_name||'.patient_id_source)';		     




             
--One time lookup on patient_ide to get patient_num jk: added dummy project id below jk: added dummy project id
execute immediate 'UPDATE ' ||  upload_temptable_name
 || ' SET patient_num = (SELECT pm.patient_num 
		     FROM patient_mapping pm
		     WHERE pm.patient_ide = '|| upload_temptable_name||'.patient_id
                     and pm.patient_ide_source = '|| upload_temptable_name||'.patient_id_source
                     and pm.project_id=''@''
	 	    )
WHERE EXISTS (SELECT pm.patient_num 
		     FROM patient_mapping pm
		     WHERE pm.patient_ide = '|| upload_temptable_name||'.patient_id
                     and pm.patient_ide_source = '||upload_temptable_name||'.patient_id_source
                     and pm.project_id=''@'')';		     



IF (appendFlag = 0) THEN
--Archive records which are to be deleted in observation_fact table
execute immediate 'INSERT ALL INTO  archive_observation_fact 
		SELECT obsfact.*, ' || upload_id ||' archive_upload_id 
		FROM observation_fact obsfact
		WHERE obsfact.encounter_num IN 
			(SELECT temp_obsfact.encounter_num
			FROM  ' ||upload_temptable_name ||' temp_obsfact
                        group by temp_obsfact.encounter_num  
            )';


--Delete above archived row from observation_fact
execute immediate 'DELETE  observation_fact 
					WHERE EXISTS (
					SELECT archive.encounter_num
					FROM archive_observation_fact  archive
					where archive.archive_upload_id = '||upload_id ||'
                                         AND archive.encounter_num=observation_fact.encounter_num
										 AND archive.concept_cd = observation_fact.concept_cd
										 AND archive.start_date = observation_fact.start_date
                    )';
END IF;

-- if the append is true, then do the update else do insert all
IF (appendFlag = 0) THEN

--Transfer all rows from temp_obsfact to observation_fact
execute immediate 'INSERT ALL INTO observation_fact(encounter_num,concept_cd, patient_num,provider_id, start_date,modifier_cd,instance_num,valtype_cd,tval_char,nval_num,valueflag_cd,
quantity_num,confidence_num,observation_blob,units_cd,end_date,location_cd, update_date,download_date,import_date,sourcesystem_cd,
upload_id) 
SELECT encounter_num,concept_cd, patient_num,provider_id, start_date,modifier_cd,instance_num,valtype_cd,tval_char,nval_num,valueflag_cd,
quantity_num,confidence_num,observation_blob,units_cd,end_date,location_cd, update_date,download_date,sysdate import_date,sourcesystem_cd,
temp.upload_id 
FROM ' || upload_temptable_name ||' temp
where temp.patient_num is not null and  temp.encounter_num is not null';

ELSE
execute immediate '  MERGE INTO observation_fact
USING ' || upload_temptable_name ||' temp
ON (temp.encounter_num = observation_fact.encounter_num 
				    and temp.patient_num = observation_fact.patient_num
                                    and temp.concept_cd = observation_fact.concept_cd
					and temp.start_date = observation_fact.start_date
		            and temp.provider_id = observation_fact.provider_id
			 		and temp.modifier_cd = observation_fact.modifier_cd 
					and temp.instance_num = observation_fact.instance_num
					)
  when matched then 
  update set valtype_cd = temp.valtype_cd ,
    tval_char=temp.tval_char, 
    nval_num = temp.nval_num,
    valueflag_cd=temp.valueflag_cd,
    quantity_num=temp.quantity_num,
	confidence_num=temp.confidence_num,
	observation_blob =temp.observation_blob,
	units_cd=temp.units_cd,
	end_date=temp.end_date,
	location_cd =temp.location_cd,
	update_date=temp.update_date ,
	download_date =temp.download_date,
	import_date=temp.import_date,
	sourcesystem_cd =temp.sourcesystem_cd,
	upload_id = temp.upload_id 
    where nvl(observation_fact.update_date,to_date(''01-JAN-1900'',''DD-MON-YYYY''))<= nvl(temp.update_date,to_date(''01-JAN-1900'',''DD-MON-YYYY'')) 
     when not matched then 
			 	insert (encounter_num, 
					concept_cd, 
		 			patient_num,
		 			provider_id,
 					start_date, 
		 			modifier_cd,
					instance_num,
 					valtype_cd,
		 			tval_char,
 					nval_num,
		 			valueflag_cd,
 					quantity_num,
		 			confidence_num,
 					observation_blob,
		 			units_cd,
 					end_date,
		 			location_cd,
 					update_date,
		 			download_date,
 					import_date,
		 			sourcesystem_cd,
 					upload_id) 
			 	values (
 					temp.encounter_num, 
		 			temp.concept_cd, 
		 			temp.patient_num,
 					temp.provider_id,
		 			temp.start_date, 
 					temp.modifier_cd,
					temp.instance_num,
		 			temp.valtype_cd,
 					temp.tval_char,
		 			temp.nval_num,
		 			temp.valueflag_cd,
		 			temp.quantity_num,
 					temp.confidence_num,
		 			temp.observation_blob,
		 			temp.units_cd,
		 			temp.end_date,
		 			temp.location_cd,
		 			temp.update_date,
		 			temp.download_date,
		 			temp.import_date,
 					temp.sourcesystem_cd,
		 			temp.upload_id
 				) where temp.patient_num is not null and  temp.encounter_num is not null';

END IF;

EXCEPTION
	WHEN OTHERS THEN
        --DBMS_OUTPUT.put_line(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
        --DBMS_OUTPUT.put_line('An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
		raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);	
END;

/
--------------------------------------------------------
--  DDL for Synonymn CATALOG
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."CATALOG" FOR "SYS"."CATALOG";
--------------------------------------------------------
--  DDL for Synonymn COL
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."COL" FOR "SYS"."COL";
--------------------------------------------------------
--  DDL for Synonymn PRODUCT_USER_PROFILE
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."PRODUCT_USER_PROFILE" FOR "SYSTEM"."SQLPLUS_PRODUCT_PROFILE";
--------------------------------------------------------
--  DDL for Synonymn PUBLICSYN
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."PUBLICSYN" FOR "SYS"."PUBLICSYN";
--------------------------------------------------------
--  DDL for Synonymn SYSCATALOG
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."SYSCATALOG" FOR "SYS"."SYSCATALOG";
--------------------------------------------------------
--  DDL for Synonymn SYSFILES
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."SYSFILES" FOR "SYS"."SYSFILES";
--------------------------------------------------------
--  DDL for Synonymn TAB
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."TAB" FOR "SYS"."TAB";
--------------------------------------------------------
--  DDL for Synonymn TABQUOTAS
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."TABQUOTAS" FOR "SYS"."TABQUOTAS";
--------------------------------------------------------
--  DDL for Queue DEF$_AQERROR
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE(
     Queue_name          => 'SYSTEM.DEF$_AQERROR',
     Queue_table         => 'SYSTEM.DEF$_AQERROR',
     Queue_type          =>  0,
     Max_retries         =>  5,
     Retry_delay         =>  0,
     dependency_tracking =>  TRUE,
     comment             => 'Error Queue for Deferred RPCs');
  END;
--------------------------------------------------------
--  DDL for Queue DEF$_AQCALL
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE(
     Queue_name          => 'SYSTEM.DEF$_AQCALL',
     Queue_table         => 'SYSTEM.DEF$_AQCALL',
     Queue_type          =>  0,
     Max_retries         =>  5,
     Retry_delay         =>  0,
     dependency_tracking =>  TRUE,
     comment             => 'Deferred RPC Queue');
  END;
--------------------------------------------------------
--  DDL for Queue Table DEF$_AQCALL
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE_TABLE(
     Queue_table        => '"SYSTEM"."DEF$_AQCALL"',
     Queue_payload_type => 'VARIANT',
     storage_clause     => 'PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 TABLESPACE SYSTEM',
     Sort_list          => 'ENQ_TIME',
     Compatible         => '8.0.3');
  END;
--------------------------------------------------------
--  DDL for Queue Table DEF$_AQERROR
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE_TABLE(
     Queue_table        => '"SYSTEM"."DEF$_AQERROR"',
     Queue_payload_type => 'VARIANT',
     storage_clause     => 'PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 TABLESPACE SYSTEM',
     Sort_list          => 'ENQ_TIME',
     Compatible         => '8.0.3');
  END;
