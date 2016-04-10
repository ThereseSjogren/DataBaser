SELECT F�rNamn,EfterNamn,AvdelningNamn,Planet,K�n,RangNamn
FROM TBLBes�ttning AS Bes�ttning
INNER JOIN TBLAvdelning AS Avdelning
ON Bes�ttning.AvdelningID=Avdelning.AvdelningID
INNER JOIN TBLRang AS Rang
ON Bes�ttning.RangID=Rang.RangID
WHERE TidF�rD�dsfall IS NOT NULL;

SELECT F�rNamn+' '+ EfterNamn AS "Hela Namnet",D�dsorsakNamn,TidF�rD�dsfall
FROM TBLBes�ttning JOIN TBLD�dsorsak
ON TBLBes�ttning.D�dsorsakID=TBLD�dsorsak.D�dsorsakID;

SELECT F�rNamn+' '+ EfterNamn AS "Hela Namnet", RangNamn,L�n
FROM TBLBes�ttning JOIN TBLRang
ON TBLBes�ttning.RangID=TBLRang.RangID
WHERE L�n>50000
ORDER BY L�n;

SELECT F�rNamn+' '+ EfterNamn AS "Hela Namnet",Planet
FROM TBLBes�ttning
WHERE Planet='Ankeborg' AND TidF�rD�dsfall IS NOT NULL;

SELECT F�rNamn+' '+ EfterNamn AS "Hela Namnet",TidF�rD�dsfall
FROM TBLBes�ttning
WHERE TidF�rD�dsfall BETWEEN '2078-02-05'AND'2080-04-02';

SELECT COUNT(*)+' ' AS "Antal",RangNamn
FROM TBLRang JOIN TBLBes�ttning
ON TBLBes�ttning.RangID=TBLRang.RangID
GROUP BY RangNamn;

SELECT MAX(L�n)+ ' ' AS "Max L�n"
FROM TBLBes�ttning JOIN TBLRang
ON TBLBes�ttning.RangID=TBLRang.RangID
ORDER BY [Max L�n];

SELECT COUNT(D�dsorsakNamn)+' ' AS "Antal",D�dsorsakNamn
FROM TBLBes�ttning JOIN TBLD�dsorsak
ON TBLBes�ttning.D�dsorsakID=TBLD�dsorsak.D�dsorsakID
GROUP BY D�dsorsakNamn;

SELECT AVG(L�n)+' ' AS "GenomSnittsL�n"
FROM TBLBes�ttning JOIN TBLRang
ON TBLBes�ttning.RangID=TBLRang.RangID
ORDER BY GenomSnittsL�n;








