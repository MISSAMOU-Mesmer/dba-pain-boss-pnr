-- J4 PAIN BOSS PNR - LES VUES 
-- 1 : Recréer la table J3 

CREATE TABLE VentesTest(
  ID INT IDENTITY(1,1) PRIMARY KEY,
  DateVente DATE,
  Produit NVARCHAR(50),
  Qte INT,
  Prix DECIMAL(10,2)
  );
GO
 DECLARE @i INT = 1;
 WHILE @i <= 1000 
 BEGIN
    INSERT INTO VentesTest(DateVente, Produit, Qte, Prix) VALUES(
   DATEADD (DAY, - @i % 30), GETDATE()),
   CASE WHEN @i % 3 = 0 THEN 'PAIN' 
   WHEN @i % 3 = 1 THEN 'CHOCO' ELSE 'ARACHIDE' 
END,
(@i % 50) + 1, 
250000
);
SET @i = @i + 1; 
END
GO
-- Partie 2 : Créer la vue_le POINT IMPORTANT DE J4 
GO 
CREATE VIEW Vue_CA_Par_Produit AS
SELECT
    Produit,
SUM(Qte) AS Quantite_Vendue,
SUM(Qte * Prix) AS Chiffre_Affaires
FROM VentesTest
GROUP BY Produit;
GO
-- 4 : Tester la vue 
SELECT * FROM Vue_CA_Par_Produit;
GO 
