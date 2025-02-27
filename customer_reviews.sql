-- Select customer review information, replacing double spaces in the ReviewText column
SELECT 

    ReviewID,                   -- Select the ReviewID
    CustomerID,                 -- Select the CustomerID
    ProductID,                  -- Select the ProductID
    ReviewDate,                 -- Select the ReviewDate
    Rating,                     -- Select the Rating
    REPLACE(ReviewText, '  ', ' ') AS ReviewText  -- Replace double spaces with single spaces in ReviewText and rename column as ReviewText

FROM 
    dbo.customer_reviews;       -- From the customer_reviews table in the dbo schema
