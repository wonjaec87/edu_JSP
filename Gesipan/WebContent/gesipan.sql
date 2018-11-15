CREATE SEQUENCE board_idx_seq
START WITH 1
MAXVALUE 999999
NOCYCLE;


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