/*CREATE OR REPLACE TRIGGER nazev -- nema zadne paramtery, trigger se vaze na nejakou udalost, musime specifikovat co pujde za udalost a kdy se ma spustit
--Kdy se ma spustit BEFORE/AFTER/INSTEAD OF
--INSERT/UPDATE/DELETE
-- ON tabulka
BEFORE 
INSERT
ON StudentiDB
--pri mazani se pouziva for each row
BEGIN
 --promenna :NEW spousti se pri opraci INSERT nebo UPDATE najdeme nove zaznamy
 --promenna :OLD spousti se pri operaci Update DELETE najdeme stare zaznamy
end;*/
CREATE OR  REPLACE TRIGGER vloz
AFTER
INSERT 
ON StudentiMAT
for EACH ROW
BEGIN
 INSERT INTO StudentiDB(login,jmeno,prijmeni) Values(:NEW.login,:NEW.jmeno,:NEW.prijmeni);
end;