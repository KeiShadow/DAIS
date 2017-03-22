SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE VypisZakazniku(p_razeni in VARCHAR2)
as
z_name VARCHAR2(10);
z_count INT;

CURSOR resZ IS SELECT jmeno from zakaznik order by jmeno;

CURSOR resN IS SELECT jmeno, count(*) from zakaznik z1 JOIN nakup n1 ON z1.zID = n1.zID group by jmeno order by COUNT(*) desc; 

CURSOR resK IS SELECT jmeno, count(r.PORADI) from zakaznik z JOIN nakup n ON z.zID = n.zID JOIN reklamace r ON r.NID = n.NID group by jmeno order by COUNT(r.PORADI) desc; 

BEGIN
iF(p_razeni ='jmeno') then
 OPEN resZ;
  LOOP
   FETCH resZ into z_name;
   EXIT WHEN resZ%NOTFOUND;
   DBMS_OUTPUT.PUT_LINE(z_name);
  END LOOP;
 CLOSE resZ;
END if;

IF(p_razeni ='nakup') then
 OPEN resN;
  LOOP
   FETCH resN into z_name, z_count;
   EXIT WHEN resN%NOTFOUND;
   DBMS_OUTPUT.PUT_LINE(z_name||', '||z_count);
  END LOOP;
END IF;

IF(p_razeni ='reklamace') then
 OPEN resK;
  LOOP
   FETCH resK into z_name, z_count;
   EXIT WHEN resK%NOTFOUND;
   DBMS_OUTPUT.PUT_LINE(z_name||', '||z_count);
  END LOOP;
END IF;
END;

execute VYPISZAKAZNIKU('reklamace')