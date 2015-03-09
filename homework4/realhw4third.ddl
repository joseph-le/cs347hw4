DROP SEQUENCE SIM_dept_seq ; 
create sequence SIM_dept_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger SIM_dept_PK_trig 
before insert on SIM_dept
for each row 
begin 
select SIM_dept_seq.nextval into :new.dept_id from dual; 
end; 
/
alter table SIM_dept add created date ; 
alter table SIM_dept add created_by VARCHAR2 (255) ; 
alter table SIM_dept add row_version_number integer ; 
alter table SIM_dept add updated date ; 
alter table SIM_dept add updated_by VARCHAR2 (255) ; 
/
create or replace trigger SIM_dept_AUD_trig 
before insert or update on SIM_dept 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

DROP SEQUENCE SIM_person_seq ; 
create sequence SIM_person_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger SIM_person_PK_trig 
before insert on SIM_person
for each row 
begin 
select SIM_person_seq.nextval into :new.person_id from dual; 
end; 
/
alter table SIM_person add created date ; 
alter table SIM_person add created_by VARCHAR2 (255) ; 
alter table SIM_person add row_version_number integer ; 
alter table SIM_person add updated date ; 
alter table SIM_person add updated_by VARCHAR2 (255) ; 
/
create or replace trigger SIM_person_AUD_trig 
before insert or update on SIM_person 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

DROP SEQUENCE SIM_proj_seq ; 
create sequence SIM_proj_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger SIM_proj_PK_trig 
before insert on SIM_proj
for each row 
begin 
select SIM_proj_seq.nextval into :new.proj_id from dual; 
end; 
/
alter table SIM_proj add created date ; 
alter table SIM_proj add created_by VARCHAR2 (255) ; 
alter table SIM_proj add row_version_number integer ; 
alter table SIM_proj add updated date ; 
alter table SIM_proj add updated_by VARCHAR2 (255) ; 
/
create or replace trigger SIM_proj_AUD_trig 
before insert or update on SIM_proj 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

DROP SEQUENCE p2p_seq ; 
create sequence p2p_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger p2p_PK_trig 
before insert on p2p
for each row 
begin 
select p2p_seq.nextval into :new.p2p_id from dual; 
end; 
/
alter table p2p add created date ; 
alter table p2p add created_by VARCHAR2 (255) ; 
alter table p2p add row_version_number integer ; 
alter table p2p add updated date ; 
alter table p2p add updated_by VARCHAR2 (255) ; 
/
create or replace trigger p2p_AUD_trig 
before insert or update on p2p 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
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
