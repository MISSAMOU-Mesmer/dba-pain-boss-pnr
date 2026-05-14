--- J3 PAIN BOSS PNR - INDEX & PERFORMANCE
--- Etape 1 : Créer une table test avec 1000 ventes

CREATE TABLE VentesTest(
Id INT IDENTITY(1,1) PRIMARY KEY,
DateVente DATE,
Produit NVARCHAR(50),
Qte INT,
Prix DECIMAL(10,2)
);
GO
--- 2. Inserer 1000 lignes de test
    DECLARE @i INT = 1;
    WHILE @i <= 1000
    
    BEGIN
        INSERT INTO VentesTest(
        DateVente, Produit, Qte, Prix)
        VALUES (
        DATEADD(DAY, - (@i % 30), GETDATE()),
        CASE
            WHEN @i % 3 = 0 THEN 'Pain'
            WHEN @i % 3 = 1 THEN 'Choco'
            ELSE ' Arachide' 
            END,
        (@i % 50) + 1,
        250.100
        );
         SET @i = @i + 1 ;
         END
         GO
         
         --- 3 : Lancer une requete sans index et mesurer le temps
         SET STATISTICS TIME ON;
         
         SELECT 
              SUM(Qte * Prix) AS CA
          FROM VentesTest
          Where DateVente = CONVERT(DATE, GETDATE());
          SET STATISTICS TIME OFF;
          GO
          
          --- 4 : Créer l'index
          CREATE INDEX IX_VentesTest_DateVente
          ON VentesTest(DateVente);
          GO
          
          --- 5 : Test avec INDEX
          SET STATISTICS TIME ON;
          SELECT
              SUM(Qte * Prix) AS CA
          FROM VentesTest
          Where DateVente = CONVERT(DATE, GETDATE());
          SET STATISTICS TIME OFF;
          GO
          
    
