-- Create a common table expression (CTE) named Percentiles
USE PortfolioProject_MarketingAnalytics;
WITH Percentiles AS (
    -- Select ProductID, ProductName, Price, and calculate quartiles
    SELECT
        ProductID,           -- Select the ProductID
        ProductName,         -- Select the ProductName
        Price,               -- Select the Price
        NTILE(4) OVER (ORDER BY Price) AS quartile  -- Divide the prices into 4 quartiles
    FROM
        dbo.products         -- From the products table in the dbo schema
)
-- Select final results from the CTE
SELECT
    ProductID,               -- Select the ProductID
    ProductName,             -- Select the ProductName
    Price,                   -- Select the Price
    CASE
        WHEN quartile = 1 THEN 'Low'              -- If the price is in the 1st quartile, categorize as 'Low'
        WHEN quartile IN (2, 3) THEN 'Average'    -- If the price is in the 2nd or 3rd quartile, categorize as 'Average'
        ELSE 'High'                               -- If the price is in the 4th quartile, categorize as 'High'
    END AS price_category     -- Name the new column as price_category
FROM
    Percentiles;              -- From the CTE named Percentiles
