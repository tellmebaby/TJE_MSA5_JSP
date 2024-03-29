CREATE TABLE "USERS" (
	"id"	VARCHAR2(20)		            NOT NULL,
	"password"	VARCHAR2(40)		NOT NULL,
	"name"	VARCHAR2(10)		        NOT NULL,
	"gender"	VARCHAR2(5)		        NOT NULL,
	"birth"	VARCHAR(10)		            NOT NULL,
	"mail"	VARCHAR(100)		        NULL,
	"join_date"	Date	DEFAULT sysdate NOT NULL,
	"reg_date"	Date	DEFAULT sysdate NOT NULL,
	"upd_date"	Date	DEFAULT sysdate NOT NULL
);

ALTER TABLE "USERS" ADD CONSTRAINT "PK_USERS" PRIMARY KEY (
	"id"
);
