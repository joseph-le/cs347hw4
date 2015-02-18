DROP SEQUENCE SIM_dept_seq ; 
create sequence SIM_dept_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER SIM_dept_PK_trig 
; 

create or replace trigger SIM_dept_PK_trig 
before insert on SIM_dept
for each row 
begin 
select SIM_dept_seq.nextval into :new.dept_id from dual; 
end; 
/

DROP SEQUENCE SIM_person_seq ; 
create sequence SIM_person_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER SIM_person_PK_trig 
; 

create or replace trigger SIM_person_PK_trig 
before insert on SIM_person
for each row 
begin 
select SIM_person_seq.nextval into :new.person_id from dual; 
end; 
/

DROP SEQUENCE SIM_proj_seq ; 
create sequence SIM_proj_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER SIM_proj_PK_trig 
; 

create or replace trigger SIM_proj_PK_trig 
before insert on SIM_proj
for each row 
begin 
select SIM_proj_seq.nextval into :new.proj_id from dual; 
end; 
/

DROP SEQUENCE p2p_seq ; 
create sequence p2p_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER p2p_PK_trig 
; 

create or replace trigger p2p_PK_trig 
before insert on p2p
for each row 
begin 
select p2p_seq.nextval into :new.p2p_id from dual; 
end; 
/

DROP INDEX SIM_person_person_id_FK_0 ;
CREATE INDEX SIM_person_person_id_FK_0 ON SIM_dept(SIM_person_person_id) ;
DROP INDEX SIM_dept_dept_id_FK_1 ;
CREATE INDEX SIM_dept_dept_id_FK_1 ON SIM_person(SIM_dept_dept_id) ;
DROP INDEX SIM_dept_dept_id_FK_2 ;
CREATE INDEX SIM_dept_dept_id_FK_2 ON SIM_proj(SIM_dept_dept_id) ;
DROP INDEX SIM_person_person_id_FK_3 ;
CREATE INDEX SIM_person_person_id_FK_3 ON p2p(SIM_person_person_id) ;
DROP INDEX SIM_proj_proj_id_FK_4 ;
CREATE INDEX SIM_proj_proj_id_FK_4 ON p2p(SIM_proj_proj_id) ;
