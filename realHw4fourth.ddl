drop view sim_person ;
drop view sim_manager ;

create view sim_person as
	SELECT person_id, type, name, birth_date
	FROM sim_person
	where Type = "proj_emp";

create or replace TRIGGER person_trigger
     INSTEAD OF insert ON sim_person
     FOR EACH ROW
BEGIN
     insert into sim_person(
        PERson_ID,
        TYPE,
        NAME,
        birth_date)
     VALUES (
        :new.PERson_ID,
        'proj_emp',
        :new.NAME,
        :new.DOB) ;
END;
/

create view sim_manager as
SELECT PERson_ID, TYPE, NAME, birth_date 
FROM sim_person
WHERE TYPE = 'manager' ;

create or replace TRIGGER person_trigger
     INSTEAD OF insert ON sim_person
     FOR EACH ROW
BEGIN
     insert into sim_person(
        PERson_ID,
        TYPE,
        NAME,
        birth_date)
     VALUES (
        :new.PERson_ID,
        'manager',
        :new.NAME,
        :new.birth_date) ;
END;
/