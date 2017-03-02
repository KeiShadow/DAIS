set SERVEROUTPUT ON;
DECLARE /*Deklerace prom?n�ch*/
/*p?�jm� dat. typ
p_login CHAR(5);
p_rok INTEGER;
Nep?�jm� dat. typ*/
/*M?j stejn� datov� typ jako sloupec v tabulce Student*/
s_login Student.login%TYPE ;
s_jmeno Student.jmeno%TYPE;
s_prijmeni Student.prijmeni%TYPE;

sel_name Student.jmeno%TYPE;
sel_prijmeni Student.prijmeni%TYPE;

p_row Student%ROWTYPE; /* Struktura do kter� vlo��me v�echny data podle WHERE*/
BEGIN 
s_login:='abc123';
s_jmeno:='Petr';
s_prijmeni:='Noggi';
--SELECT jmeno, prijmeni INTO sel_name,sel_prijmeni FROM Student WHERE login = 'abc123';
--Pomoci rowtype
SELECT * INTO p_row FROM Student WHERE login='abc123';
 --INSERT INTO Student (login, jmeno, prijmeni) VALUES(s_login,s_jmeno,s_prijmeni);
 dbms_output.put_line('Student se jmenem: '||p_row.jmeno||' m� p?�jmen� ' || p_row.prijmeni);
END;