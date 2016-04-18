--• Lista alla order och dess attribut som inte är nycklar,
-- samt kund och de produkter som ingår i ordern,
--  samt vilket fraktbolag ska skeppa ordern.
--Fråga 1
--SELECT FörNamn+' '+EfterNamn AS "Namn", ProduktNamn, OrderDatum,SkeppningsDatum, Antal,EnhetsPris, FraktBolagNamn,SUM(Antal * EnhetsPris)  AS "Totala Summan"
--FROM TBLOrderProdukt INNER JOIN TBLOrder
--ON TBLOrderProdukt.OrderID=TBLOrder.OrderID
--INNER JOIN TBLProdukt ON TBLOrderProdukt.ProduktID=TBLProdukt.ProduktID
--INNER JOIN TBLKund ON TBLOrder.KundID=TBLKund.KundID
--INNER JOIN TBLFraktBolag ON TBLOrder.FraktBolagID=TBLFraktBolag.FraktBolagID
--GROUP BY  FörNamn, EfterNamn, Adress, ProduktNamn,SkeppningsDatum,OrderDatum, EnhetsPris, Antal,FraktBolagNamn;

--Fråga 2
--• Lista alla order som en kund (Kunden ska kunna sökas med delar av efternamnet) 
--har och de produkter som ingår i ordern, samt vilket fraktbolag ska skeppa ordern.
--SELECT FörNamn+' '+EfterNamn AS "Namn",Adress, ProduktNamn,FraktBolagNamn, Antal,EnhetsPris,SUM(Antal * EnhetsPris)  AS "Totala Summan"
--FROM TBLOrderProdukt INNER JOIN TBLOrder
--ON TBLOrderProdukt.OrderID=TBLOrder.OrderID
--INNER JOIN TBLProdukt ON TBLOrderProdukt.ProduktID=TBLProdukt.ProduktID
--INNER JOIN TBLKund ON TBLOrder.KundID=TBLKund.KundID
--INNER JOIN TBLFraktBolag ON TBLOrder.FraktBolagID=TBLFraktBolag.FraktBolagID
--WHERE EfterNamn LIKE 'M%'
--GROUP BY  FörNamn, EfterNamn, Adress, ProduktNamn,SkeppningsDatum,OrderDatum, EnhetsPris, Antal,FraktBolagNamn;

----Fråga 3
----•	Visa den order med mest produkter i.
--SELECT MAX(Antal) AS "Flest"
--FROM TBLOrder;



--Fråga 4
--• Visa den dyraste ordern i systemet och kundens namn.
--SELECT TOP 1 FörNamn+' '+EfterNamn AS "Namn", Antal*EnhetsPris AS "Dyraste"
--FROM TBLOrderProdukt INNER JOIN TBLProdukt ON TBLOrderProdukt.ProduktID=TBLProdukt.ProduktID
--INNER JOIN TBLOrder ON TBLOrderProdukt.OrderID=TBLOrder.OrderID
--INNER JOIN TBLKund ON TBLOrder.KundID=TBLKund.KundID 
--ORDER BY Dyraste DESC;

--Fråga 5
--• Visa alla order som ett fraktbolag skeppar. Ska kunna sökas med namnet på fraktbolaget.

--SELECT FraktBolagNamn,ProduktNamn,OrderDatum,SkeppningsDatum
--FROM TBLOrderProdukt INNER JOIN TBLOrder ON TBLOrderProdukt.OrderID=TBLOrder.OrderID
--INNER JOIN TBLProdukt ON TBLOrderProdukt.ProduktID=TBLProdukt.ProduktID
--INNER JOIN TBLFraktBolag ON TBLOrder.FraktBolagID=TBLFraktBolag.FraktBolagID
--WHERE FraktBolagNamn='Båt AB';

--Fråga 6
--•	Visa alla order som ska skeppas på ett viss datum och fraktbolaget. Ska sökas med ett datum.
--SELECT FraktBolagNamn,SkeppningsDatum, ProduktNamn
--FROM TBLOrderProdukt INNER JOIN TBLOrder ON TBLOrderProdukt.OrderID=TBLOrder.OrderID
--INNER JOIN TBLProdukt ON TBLOrderProdukt.ProduktID=TBLProdukt.ProduktID
--INNER JOIN TBLFraktBolag ON TBLOrder.FraktBolagID=TBLFraktBolag.FraktBolagID
--WHERE SkeppningsDatum='2015-02-18';

--Fråga 7
--•	Visa antal order som ska skeppas för fraktbolagen.
--SELECT COUNT(*) AS "Antal Order",FraktBolagNamn
--FROM TBLOrderProdukt INNER JOIN TBLOrder ON TBLOrderProdukt.OrderID=TBLOrder.OrderID
--INNER JOIN TBLProdukt ON TBLOrderProdukt.ProduktID=TBLProdukt.ProduktID
--INNER JOIN TBLFraktBolag ON TBLOrder.FraktBolagID=TBLFraktBolag.FraktBolagID
--GROUP BY FraktBolagNamn;

--Fråga 8
--•	Visa antal produkter som en tillverkare tillverkar. Ska sökas med namnet på fraktbolaget
--SELECT COUNT (*) AS " Antal Produkter",TillverkarNamn
--FROM TBLOrderProdukt INNER JOIN TBLOrder ON TBLOrderProdukt.OrderID=TBLOrder.OrderID
--INNER JOIN TBLProdukt ON TBLOrderProdukt.ProduktID=TBLProdukt.ProduktID
--INNER JOIN TBLFraktBolag ON TBLOrder.FraktBolagID=TBLFraktBolag.FraktBolagID
--INNER JOIN TBLTillverkare ON TBLProdukt.TillverkareID=TBLTillverkare.TillverkareID
--WHERE FraktBolagNamn='Båt AB'
--GROUP BY TillverkarNamn;

--Fråga 9
--•	Om en produkt inte är tillgänglig så kan det inte ingå i en order. VG uppgift,
-- kan lösas med villkor och print.
-- Kan också lösas av de som har läst på triggers med en AFTER INSERT trigger.

--SELECT ProduktNamn, Antal,Tillgänglighet
--FROM TBLOrderProdukt INNER JOIN TBLProdukt ON TBLOrderProdukt.ProduktID=TBLProdukt.ProduktID
--INNER JOIN TBLOrder ON TBLOrderProdukt.OrderID=TBLOrder.OrderID
--WHERE Tillgänglighet=1;
