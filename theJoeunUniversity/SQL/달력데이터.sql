-- 캘린더 SQL
CREATE TABLE calendar(
    NO       NUMBER,
    strDATE DATE          NOT NULL,
    endDATE DATE          NOT NULL,
    CONTENT  VARCHAR(500) NOT NULL,
    PRIMARY KEY(NO)
);

DROP Table CALENDAR;
DROP SEQUENCE seq_cal;

-- 시퀀스
CREATE SEQUENCE SEQ_CAL
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 9999;

-- 테스트 데이터
SELECT * FROM CALENDAR ORDER BY STRDATE asc;

Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2024/02/01',
        '2024/02/26',
        '휴학, 복학 신청');
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2024/02/02',
        '2024/02/05',
        '2024학년도 제1학기 수강희망과목 등록(재입학생 포함)');
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2024/02/09',
        '2024/02/12',
        '설날(공휴일)');
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2024/02/13',
        '2024/02/17',
        '2024학년도 제1학기 수강신청(재입학생 포함)');
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2024/02/29',
        '2024/02/29',
        '2024학년도 입학식');

-- 3월
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2024/03/01',
        '2024/03/01',
        '삼일절(공휴일)');
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2024/03/04',
        '2024/03/04',
        '2024학년도 1학기 개강');
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2024/03/20',
        '2024/03/22',
        '복수 전공 신청');

-- 4월
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2024/04/04',
        '2024/04/10',
        '22대 국회의원 선거일');
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2024/04/22',
        '2024/04/26',
        '1학기 중간고사');

-- 5월
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2024/05/06',
        '2024/05/06',
        '어린이날 대체 휴일');
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2024/05/14',
        '2024/05/17',
        '이중전공 신청');
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2024/05/15',
        '2024/05/15',
        '부처님 오신날');

-- 06월
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2024/06/03',
        '2024/06/05',
        '재입학 신청');
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2024/06/06',
        '2024/06/06',
        '현충일');
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2024/06/17',
        '2024/06/21',
        '1학기 기말고사');
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2024/06/21',
        '2024/06/21',
        '1학기 종강');
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2024/06/24',
        '2024/06/24',
        '여름 계절수업 개강');


-- 07월
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2024/07/19',
        '2024/07/19',
        '여름 계절수업 종강');

-- 08월
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2024/08/12',
        '2024/08/17',
        '2학기 수강 신청');
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2024/08/20',
        '2024/08/27',
        '휴학, 복학 신청');

-- 09월
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2024/09/02',
        '2024/09/02',
        '2학기 개강');
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2024/09/02',
        '2024/09/07',
        '조기졸업 신청');
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2024/09/04',
        '2024/09/06',
        '수강신청 정정 및 확인');
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2024/09/16',
        '2024/09/18',
        '추석');
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2024/09/24',
        '2024/09/26',
        '복수전공 신청');

-- 10월
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2024/10/03',
        '2024/10/03',
        '개천절');
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2024/10/09',
        '2024/10/09',
        '광복절');
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2024/10/21',
        '2024/10/25',
        '중간고사');

-- 11월
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2024/11/01',
        '2024/11/05',
        '전과 신청');
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2024/11/13',
        '2024/11/15',
        '이중전공 신청');

-- 12월
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2024/12/04',
        '2024/12/06',
        '재입학 신청');
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2024/12/16',
        '2024/12/20',
        '2학기 기말고사');
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2024/12/20',
        '2024/12/20',
        '2학기 종강');
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2024/12/23',
        '2024/12/23',
        '겨울 계절수업 개강');
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2024/12/25',
        '2024/12/25',
        '성탄절');

-- 25. 01월
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2025/01/01',
        '2025/01/01',
        '신정');
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2025/01/17',
        '2025/01/17',
        '겨울 계절수업 종강');
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2025/01/28',
        '2025/01/30',
        '설날');

-- 25.02월
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2025/02/01',
        '2025/02/26',
        '휴학, 복학 신청');
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2025/02/02',
        '2025/02/05',
        '2025학년도 제1학기 수강희망과목 등록(재입학생 포함)');
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2025/02/09',
        '2025/02/12',
        '설날(공휴일)');
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2025/02/13',
        '2025/02/17',
        '2025학년도 제1학기 수강신청(재입학생 포함)');
Insert into CALENDAR (NO,STRDATE,ENDDATE,CONTENT)
values (SEQ_CAL.NEXTVAL, 
        '2025/02/28',
        '2025/02/28',
        '2025학년도 입학식');