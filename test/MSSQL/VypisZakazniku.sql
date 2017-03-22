alter procedure VypisZakazniku( @rok_od int = -1, @rok_do int = -1)
as
begin
declare @muzi varchar(20)
declare @zeny varchar(20)
set @muzi = 0
set @zeny = 0
if(@rok_od != -1 and @rok_do != -1)
 begin
  Select @muzi =sum(n1.cena) from test.Zakaznik z1
 join test.Nakup n1 on z1.zID = n1.zID and z1.pohlavi='muz' 
 and DATENAME(year,den)>=@rok_od and DATENAME(year,den)<=@rok_do

 Select @zeny =sum(n1.cena) from test.Zakaznik z1
 join test.Nakup n1 on z1.zID = n1.zID and z1.pohlavi='zena'
 and DATENAME(year,den)>= @rok_od  and DATENAME(year,den)<=@rok_do

  print 'Muzi mezi roky ' + CAST(@rok_od as varchar) + ' a ' + CAST(@rok_do as varchar) + ' nakoupili za celkovou castku ' 
  + @muzi + ' Kc. Zeny mezi roky ' + CAST(@rok_od as varchar) + ' a ' + CAST(@rok_do as varchar) + ' nakoupily za celkovou castku ' + @zeny + ' Kc.'
 end;
 
if(@rok_do = -1 and @rok_od != -1)
 begin
  Select @muzi =sum(n1.cena) from test.Zakaznik z1
 join test.Nakup n1 on z1.zID = n1.zID and z1.pohlavi='muz' 
 and DATENAME(year,den)>=@rok_od

 Select @zeny =sum(n1.cena) from test.Zakaznik z1
 join test.Nakup n1 on z1.zID = n1.zID and z1.pohlavi='zena'
 and DATENAME(year,den)>= @rok_od
	
	print 'Muzi do roku ' + CAST(@rok_od as varchar) + ' nakoupili za celkovou castku ' 
		+ @muzi + ' Kc. Zeny do roku ' + CAST(@rok_od as varchar) + ' nakoupily za celkovou castku ' + @zeny + ' Kc.'
 end;
 
if(@rok_do != -1 and @rok_od = -1)
 begin
  Select @muzi =sum(n1.cena) from test.Zakaznik z1
  join test.Nakup n1 on z1.zID = n1.zID and z1.pohlavi='muz' 
  and DATENAME(year,den)<=@rok_do

  Select @zeny =sum(n1.cena) from test.Zakaznik z1
  join test.Nakup n1 on z1.zID = n1.zID and z1.pohlavi='zena'
  and DATENAME(year,den)<=@rok_do
  print 'Muzi do roku ' + CAST(@rok_do as varchar) + ' nakoupili za celkovou castku ' 
		+ @muzi + ' Kc. Zeny do roku ' + CAST(@rok_do as varchar) + ' nakoupily za celkovou castku ' + @zeny + ' Kc.'
 
 end;
 

 
if(@rok_od = -1 and @rok_do = -1)
 begin
  Select @muzi =sum(n1.cena) from test.Zakaznik z1
 join test.Nakup n1 on z1.zID = n1.zID and z1.pohlavi='muz' 

 Select @zeny =sum(n1.cena) from test.Zakaznik z1
 join test.Nakup n1 on z1.zID = n1.zID and z1.pohlavi='zena'
 
 print 'Muzi nakoupili za celkovou castku ' + @muzi + ' Kc. Zeny nakoupily za celkovou castku ' + @zeny + ' Kc.' 

 end;
 
end;

exec VypisZakazniku