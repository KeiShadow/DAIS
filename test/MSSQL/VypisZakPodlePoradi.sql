alter procedure VypisZakazniku(@p_usporadani Varchar(50))
as
begin
if(@p_usporadani = 'jmeno')
 begin
 select jmeno from test.zakaznik z1 order by z1.jmeno;
 end

if(@p_usporadani ='nakup')
 begin
  select count(n1.kusu),jmeno from test.zakaznik z1 
  join test.Nakup n1 on n1.zID = z1.zID
  group by jmeno
  order by count(n1.kusu) desc;
 end

if(@p_usporadani ='reklamace')
 begin
  select COUNT(r1.poradi),jmeno from test.Nakup n1
  join test.Reklamace r1 on r1.nID = n1.nID
  join test.Zakaznik z1 on z1.zID = n1.zID
  group by jmeno
  order by COUNT(r1.poradi) desc;
 end
end;

execute VypisZakazniku 'reklamace';