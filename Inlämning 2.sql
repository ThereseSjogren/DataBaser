--� Lista alla order och dess attribut som inte �r nycklar,
-- samt kund och de produkter som ing�r i ordern,
--  samt vilket fraktbolag ska skeppa ordern.
--Fr�ga 1
--SELECT F�rNamn+' '+EfterNamn AS "Namn", ProduktNamn, OrderDatum,SkeppningsDatum, Antal,EnhetsPris, FraktBolagNamn,SUM(Antal * EnhetsPris)  AS "Totala Summan"
--FROM TBLOrderProdukt INNER JOIN TBLOrder
--ON TBLOrderProdukt.OrderID=TBLOrder.OrderID
--INNER JOIN TBLProdukt ON TBLOrderProdukt.ProduktID=TBLProdukt.ProduktID
--INNER JOIN TBLKund ON TBLOrder.KundID=TBLKund.KundID
--INNER JOIN TBLFraktBolag ON TBLOrder.FraktBolagID=TBLFraktBolag.FraktBolagID
--GROUP BY  F�rNamn, EfterNamn, Adress, ProduktNamn,SkeppningsDatum,OrderDatum, EnhetsPris, Antal,FraktBolagNamn;

--Fr�ga 2
--� Lista alla order som en kund (Kunden ska kunna s�kas med delar av efternamnet) 
--har och de produkter som ing�r i ordern, samt vilket fraktbolag ska skeppa ordern.
--SELECT F�rNamn+' '+EfterNamn AS "Namn",Adress, ProduktNamn,FraktBolagNamn, Antal,EnhetsPris,SUM(Antal * EnhetsPris)  AS "Totala Summan"
--FROM TBLOrderProdukt INNER JOIN TBLOrder
--ON TBLOrderProdukt.OrderID=TBLOrder.OrderID
--INNER JOIN TBLProdukt ON TBLOrderProdukt.ProduktID=TBLProdukt.ProduktID
--INNER JOIN TBLKund ON TBLOrder.KundID=TBLKund.KundID
--INNER JOIN TBLFraktBolag ON TBLOrder.FraktBolagID=TBLFraktBolag.FraktBolagID
--WHERE EfterNamn LIKE 'M%'
--GROUP BY  F�rNamn, EfterNamn, Adress, ProduktNamn,SkeppningsDatum,OrderDatum, EnhetsPris, Antal,FraktBolagNamn;

----Fr�ga 3
----�	Visa den order med mest produkter i.
--SELECT MAX(Antal) AS "Flest"
--FROM TBLOrder;



--Fr�ga 4
--� Visa den dyraste ordern i systemet och kundens namn.
--SELECT TOP 1 F�rNamn+' '+EfterNamn AS "Namn", Antal*EnhetsPris AS "Dyraste"
--FROM TBLOrderProdukt INNER JOIN TBLProdukt ON TBLOrderProdukt.ProduktID=TBLProdukt.ProduktID
--INNER JOIN TBLOrder ON TBLOrderProdukt.OrderID=TBLOrder.OrderID
--INNER JOIN TBLKund ON TBLOrder.KundID=TBLKund.KundID 
--ORDER BY Dyraste DESC;

--Fr�ga 5
--� Visa alla order som ett fraktbolag skeppar. Ska kunna s�kas med namnet p� fraktbolaget.

--SELECT FraktBolagNamn,ProduktNamn,OrderDatum,SkeppningsDatum
--FROM TBLOrderProdukt INNER JOIN TBLOrder ON TBLOrderProdukt.OrderID=TBLOrder.OrderID
--INNER JOIN TBLProdukt ON TBLOrderProdukt.ProduktID=TBLProdukt.ProduktID
--INNER JOIN TBLFraktBolag ON TBLOrder.FraktBolagID=TBLFraktBolag.FraktBolagID
--WHERE FraktBolagNamn='B�t AB';

--Fr�ga 6
--�	Visa alla order som ska skeppas p� ett viss datum och fraktbolaget. Ska s�kas med ett datum.
--SELECT FraktBolagNamn,SkeppningsDatum, ProduktNamn
--FROM TBLOrderProdukt INNER JOIN TBLOrder ON TBLOrderProdukt.OrderID=TBLOrder.OrderID
--INNER JOIN TBLProdukt ON TBLOrderProdukt.ProduktID=TBLProdukt.ProduktID
--INNER JOIN TBLFraktBolag ON TBLOrder.FraktBolagID=TBLFraktBolag.FraktBolagID
--WHERE SkeppningsDatum='2015-02-18';

--Fr�ga 7
--�	Visa antal order som ska skeppas f�r fraktbolagen.
--SELECT COUNT(*) AS "Antal Order",FraktBolagNamn
--FROM TBLOrderProdukt INNER JOIN TBLOrder ON TBLOrderProdukt.OrderID=TBLOrder.OrderID
--INNER JOIN TBLProdukt ON TBLOrderProdukt.ProduktID=TBLProdukt.ProduktID
--INNER JOIN TBLFraktBolag ON TBLOrder.FraktBolagID=TBLFraktBolag.FraktBolagID
--GROUP BY FraktBolagNamn;

--Fr�ga 8
--�	Visa antal produkter som en tillverkare tillverkar. Ska s�kas med namnet p� fraktbolaget
--SELECT COUNT (*) AS " Antal Produkter",TillverkarNamn
--FROM TBLOrderProdukt INNER JOIN TBLOrder ON TBLOrderProdukt.OrderID=TBLOrder.OrderID
--INNER JOIN TBLProdukt ON TBLOrderProdukt.ProduktID=TBLProdukt.ProduktID
--INNER JOIN TBLFraktBolag ON TBLOrder.FraktBolagID=TBLFraktBolag.FraktBolagID
--INNER JOIN TBLTillverkare ON TBLProdukt.TillverkareID=TBLTillverkare.TillverkareID
--WHERE FraktBolagNamn='B�t AB'
--GROUP BY TillverkarNamn;

--Fr�ga 9
--�	Om en produkt inte �r tillg�nglig s� kan det inte ing� i en order. VG uppgift,
-- kan l�sas med villkor och print.
-- Kan ocks� l�sas av de som har l�st p� triggers med en AFTER INSERT trigger.

--SELECT ProduktNamn, Antal,Tillg�nglighet
--FROM TBLOrderProdukt INNER JOIN TBLProdukt ON TBLOrderProdukt.ProduktID=TBLProdukt.ProduktID
--INNER JOIN TBLOrder ON TBLOrderProdukt.OrderID=TBLOrder.OrderID
--WHERE Tillg�nglighet=1;
