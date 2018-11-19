CREATE SEQUENCE board_idx_seq
START WITH 1
MAXVALUE 999999
NOCYCLE;

DROP SEQUENCE board_idx_seq;

CREATE TABLE Gesipan
(
idx		NUMBER(6),
name	VARCHAR2(20)	NOT NULL,
passwd	VARCHAR2(20)	NOT NULL,
email	VARCHAR2(50)	NOT NULL,
title	VARCHAR2(100)	NOT NULL,
contents	LONG	NOT NULL,
writedate	DATE	NOT NULL,
readnum		NUMBER(4)	NOT NULL,
filename	VARCHAR2(200),
grp		NUMBER(5)	NOT NULL,
lev		NUMBER(1)	NOT NULL,
step	NUMBER(4)	NOT NULL,
CONSTRAINT gesipan_idx_pk	PRIMARY KEY(idx)
)

CREATE INDEX idx_gesipan_name
ON gesipan(name);

CREATE INDEX idx_gesipan_title
ON gesipan(title);


CREATE OR REPLACE PROCEDURE board_insert
(
	p_name	IN	gesipan.name%TYPE,
	p_passwd	IN	gesipan.name%TYPE,
	p_email	IN	gesipan.name%TYPE,
	p_title	IN	gesipan.name%TYPE,
	p_contents	IN	gesipan.name%TYPE,
	p_filename	IN	gesipan.name%TYPE
)
IS
BEGIN
		INSERT INTO Gesipan
		VALUES(board_idx_seq.NEXTVAL, p_name, p_passwd, p_email, p_title, p_contents, SYSDATE, 0, p_filename, board_idx_seq.CURRVAL, 0,0);
		COMMIT;
		END;
		
		
		
CREATE OR REPLACE procedure board_selectAll
(
   board_record OUT SYS_REFCURSOR
)
AS
BEGIN
   OPEN board_record FOR
   SELECT idx, name, email, title, writedate, readnum
   FROM GESIPAN ORDER BY grp DESC, step ASC;
END;



CREATE OR REPLACE PROCEDURE board_select
(
	p_idx	IN	gesipan.idx%TYPE,
	board_record	OUT SYS_REFCURSOR
)
AS
BEGIN
	OPEN board_record FOR
	SELECT * FROM GESIPAN
	WHERE idx = p_idx;
END; 


CREATE OR REPLACE PROCEDURE board_readnum_update
(
	p_idx    IN       gesipan.idx%TYPE
)
IS
BEGIN
	UPDATE Gesipan SET readnum = readnum + 1
	WHERE idx = p_idx;
	COMMIT;
END; 



CREATE OR REPLACE PROCDEURE board_delete
(
	p_idx	IN	gesipan.idx%TYPE
)
IS
BEGIN
	DELETE FROM Gesipan
	WHERE idx = p_idx
	COMMIT;
END;


CREATE OR REPLACE PROCEDURE board_select_passwd
(
	p_idx	IN Gesipan.idx%TYPE,
	dbpasswd	OUT	Gesipan.passwd%TYPE
)
IS
BEGIN
	SELECT passwd INTO dbpasswd
	FROM Gesipan
	WHERE idx = p_idx;
END;



CREATE OR REPLACE PROCEDURE board_update
(
	p_email           IN       gesipan.email%TYPE,
	p_title             IN        gesipan.title%TYPE,
	p_contents      IN         gesipan.contents%TYPE,
	p_idx              IN        gesipan.idx%TYPE
)
IS
BEGIN
	UPDATE Gesipan
	SET email = p_email, title = p_title, contents = p_contents
	WHERE idx = p_idx;
	COMMIT;
END; 
--답변처리를 위한 각 레코드의 step update, 새로 들어오는 글의 step과 같거나 큰 step들 1씩 증가
CREATE OR REPLACE PROCEDURE board_update_step
(
	p_grp         IN           Gesipan.grp%TYPE,
	p_step        IN           Gesipan.step%TYPE
)
IS
BEGIN
	UPDATE Gesipan
	SET step = step + 1
	WHERE grp = p_grp AND step > p_step;
	COMMIT;
END; 

