SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE AddStudent(plogin IN char,pjmeno in VARCHAR2,pprijmeni IN VARCHAR2, pTable IN VARCHAR2) as
 tmpI VARCHAR(1000);
 tmpS VARCHAR(1000);
begin
  tmpI:= 'INSERT INTO '|| pTable ||' VALUES('''||plogin||''','''||pjmeno||''','''||pprijmeni||''')';
  
  tmpS:= 'SELECT * FROM '||pTable||'';
  dbms_output.put_line(tmpI);
  EXECUTE IMMEDIATE tmpI; --Spusteni dynamickeho query
  dbms_output.put_line('Student se jmenem: '||pjmeno||' byl uspesne vlozen do tabulky '||pTable);
   EXECUTE IMMEDIATE tmpS;
COMMIT;
exception --Vyjimky
   WHEN OTHERS THEN
    dbms_output.put_line('Student s loginem: '||pjmeno||' jiz v tabulce '|| pTable||' existuje');
rollback;
end;

execute AddStudent('dro074','Stepan','Drozdek','StudentiMAT');
select * from StudentiMAT;
select * from StudentiDB;