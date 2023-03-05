-- Lista 1

-- Zadanie 1 

    -- a)
    -- Podstawy (korzystaj z tabeli Product)
        -- i. Wyświetl wszystkie identyfikatory, nazwy, kolor, cenę katalogową oraz zysk (oblicz)
            -- produktów – uporządkuj wyniki alfabetycznie wg. nazwy. Dodatkowo wyświetl pełną
            -- nazwę (bez skrótu) klasy (class, H = High, M = Medium, L = Low) oraz nazwę typu
            -- (productline, R = Road, M = Mountain, T = Touring, S = Standard)

SELECT ProductNumber, Name, Color, ListPrice,
ListPrice - StandardCost AS Profit,
CASE Class
    WHEN 'H' THEN 'High'
    WHEN 'M' THEN 'Medium'
    WHEN 'L' THEN 'Low'
END AS Class,
CASE ProductLine
    WHEN 'R' THEN 'Road'
    WHEN 'M' THEN 'Mountain'
    WHEN 'T' THEN 'Touring'
    WHEN 'S' THEN 'Standard'
END AS ProductLine
FROM Production.Product
ORDER BY Name ASC;


    -- b)
    -- Filtrowanie (korzystaj z tabeli Product)
        -- i. Wyświetl nazwę i cenę katalogową wszystkich produktów o cenie katalogowej
            -- większej niż 10 i bez zdefiniowanego lub czerwonego koloru, posortowane rosnąco
            -- względem ceny katalogowej 

SELECT Name, ListPrice
FROM Production.Product
WHERE ListPrice > 10 AND Color IS NOT NULL AND Color != 'Red' 
ORDER BY ListPrice


    --  c)
    -- Złączenie (korzystaj z tabeli Product oraz ProductSubCategory):
        -- i. Wyświetl nazwy produktów z nazwą podkategorii (subcategory) 

SELECT P.Name, PS.Name
FROM Production.Product P INNER JOIN Production.ProductSubcategory PS
    ON P.ProductSubcategoryID = PS.ProductSubcategoryID


    -- d)
    -- Złączenie (korzystaj z tabeli Product, ProductSubCategory oraz ProductCategory):
        -- i. Wyświetl nazwy wszystkich produktów, w wyniku potrzebna jest nazwa podkategorii
            -- i nazwa kategorii

SELECT P.Name ProductName, PS.Name SubCategory, PC.Name Category
FROM Production.Product P INNER JOIN Production.ProductSubcategory PS
    ON P.ProductSubcategoryID = PS.ProductSubcategoryID
    JOIN Production.ProductCategory PC ON PS.ProductCategoryID = PC.ProductCategoryID


    -- e)
        -- Grupowanie (korzystaj z tabeli Product, ProductSubCategory oraz ProductCategory):
        -- i. Wyświetl średnią cenę katalogową produktów oraz liczbę produktów w ramach
            -- każdej podkategorii (nazwa) oraz kategorii (nazwa) 

SELECT PC.Name Category, PS.Name SubCategory,   AVG(P.ListPrice) AVGListPrice, COUNT(*) ProductsNum
FROM Production.Product P INNER JOIN Production.ProductSubcategory PS
    ON P.ProductSubcategoryID = PS.ProductSubcategoryID
    JOIN Production.ProductCategory PC ON PS.ProductCategoryID = PC.ProductCategoryID
GROUP BY PC.Name, PS.Name
ORDER BY Category

SELECT TerritoryID, Name, CountryRegionCode, SalesYTD, SalesLastYear
FROM Sales.SalesTerritory
