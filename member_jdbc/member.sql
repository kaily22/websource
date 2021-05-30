--memberTBL
--아이디(문자 15) pk --userid
--비밀번호(문자 20) not null --password
--이름(문자 20) not null --name
--성별(문자 10) not null --gender
--이메일(문자 50) --email

--한명 삽입

CREATE TABLE memberTBL(
userid VARCHAR2(15) PRIMARY KEY,
password VARCHAR2(20) NOT NULL,
name VARCHAR2(20) NOT NULL,
gender VARCHAR2(10) NOT NULL,
email VARCHAR2(50) NOT NULL
);


select * from MEMBERTBL;



INSERT INTO MEMBERTBL(userid, password,name,gender,email)VALUES('kaily22','12345','이승현','여','kaily22@naver.com');

select * from MEMBERTBL;