SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE SkoreKolo(nazevL IN VARCHAR2,nazevR IN VARCHAR2,porKola IN NUMERIC)as
--tmpi VARCHAR2(1000);
 sumaD NUMERIC;
 sumaH NUMERIC;
 proc rocnik%ROWTYPE;
 pliga liga%ROWTYPE;
 pzapas zapas%ROWTYPE;
BEGIN
SELECT * INTO pliga FROM liga where nazev =nazevL;
SELECT * INTO proc FROM rocnik where nazev =nazevR;
SELECT SUM(Skore_DOMACI), SUM(SKORE_HOSTE)INTO sumaD,sumaH FROM zapas WHERE IDROCNIK=proc.idrocnik;
  dbms_output.put_line('Suma domacich: '||sumaD);
  dbms_output.put_line('Suma Hoste: '||sumaH);

END;
execute SkoreKolo('Extraliga ledního hokeje','2012/2013',52);

select * from zapas;
select * from liga;
select * from rocnik;