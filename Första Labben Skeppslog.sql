SELECT FörNamn,EfterNamn,AvdelningNamn,Planet,Kön,RangNamn
FROM TBLBesättning AS Besättning
INNER JOIN TBLAvdelning AS Avdelning
ON Besättning.AvdelningID=Avdelning.AvdelningID
INNER JOIN TBLRang AS Rang
ON Besättning.RangID=Rang.RangID
WHERE TidFörDödsfall IS NOT NULL;

SELECT FörNamn+' '+ EfterNamn AS "Hela Namnet",DödsorsakNamn,TidFörDödsfall
FROM TBLBesättning JOIN TBLDödsorsak
ON TBLBesättning.DödsorsakID=TBLDödsorsak.DödsorsakID;

SELECT FörNamn+' '+ EfterNamn AS "Hela Namnet", RangNamn,Lön
FROM TBLBesättning JOIN TBLRang
ON TBLBesättning.RangID=TBLRang.RangID
WHERE Lön>50000
ORDER BY Lön;

SELECT FörNamn+' '+ EfterNamn AS "Hela Namnet",Planet
FROM TBLBesättning
WHERE Planet='Ankeborg' AND TidFörDödsfall IS NOT NULL;

SELECT FörNamn+' '+ EfterNamn AS "Hela Namnet",TidFörDödsfall
FROM TBLBesättning
WHERE TidFörDödsfall BETWEEN '2078-02-05'AND'2080-04-02';

SELECT COUNT(*)+' ' AS "Antal",RangNamn
FROM TBLRang JOIN TBLBesättning
ON TBLBesättning.RangID=TBLRang.RangID
GROUP BY RangNamn;

SELECT MAX(Lön)+ ' ' AS "Max Lön"
FROM TBLBesättning JOIN TBLRang
ON TBLBesättning.RangID=TBLRang.RangID
ORDER BY [Max Lön];

SELECT COUNT(DödsorsakNamn)+' ' AS "Antal",DödsorsakNamn
FROM TBLBesättning JOIN TBLDödsorsak
ON TBLBesättning.DödsorsakID=TBLDödsorsak.DödsorsakID
GROUP BY DödsorsakNamn;

SELECT AVG(Lön)+' ' AS "GenomSnittsLön"
FROM TBLBesättning JOIN TBLRang
ON TBLBesättning.RangID=TBLRang.RangID
ORDER BY GenomSnittsLön;








