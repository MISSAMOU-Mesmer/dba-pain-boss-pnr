--- J2 PAIN BOSS PNR - Reporrting Hbdo
CREATE TABLE RecettePainBoss (
  Id INT IDENTITY(1,1) PRIMARY KEY,
  Ingredient NVARCHAR(50),
  CoutUnitaire DECIMAL(10,2)
  );
INSERT INTO RecettePainBoss VALUES ('Pain 1/4', 80), ('Choco Matina', 400), ('Arachide', 500), ('Beurre Jadida', 200), ('Sucre', 140), ('Lait Nido', 50);

CREATE TABLE VentesJournalieres (
  Id INT IDENTITY(1,1) PRIMARY KEY,
  DateVente DATE,
  NbPainsVendus INT);
INSERT INTO VentesJournalieres VALUES ('2026-05-04',20), ('2026-05-05', 35), ('2026-05-06',  40), ('2026-05-07', 25), ('2026-05-08', 60), ('2026-05-09', 80), ('2026-05-10', 0);

SELECT
    SUM(NbPainsVendus) AS TotalPains,
    SUM(NbPainsVendus * 250) AS CA_Semaine,
    SUM(NbPainsVendus * 250)- SUM(NbPainsVendus * 89.5) AS BeneficeSemaine
FROM VentesJournalieres;
