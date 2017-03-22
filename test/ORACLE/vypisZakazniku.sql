create or replace procedure VypisZakazniku(rok_od in INT :=-1, rok_do in INT := -1)
as
 muz nakup.cena%TYPE;
 zena nakup.cena%TYPE;
begin
 if (rok_od !=-1 and rok_do !=-1) then
  select SUM(cena)into muz from zakaznik z1
  JOIN nakup n1 on n1.zid = z1.zid and extract(year from den)>= rok_od and extract(year from den) <= rok_do and pohlavi='muz';
  select SUM(cena)into zena from zakaznik z1
  JOIN nakup n1 on n1.zid = z1.zid and extract (year from den)>= rok_od and extract(year from den) <= rok_do and pohlavi='zena';
  DBMS_OUTPUT.put_LIne(muz||', '||zena);
 end if;
end;

execute VypisZakazniku(2011,2014);