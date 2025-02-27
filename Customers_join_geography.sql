
-- Select customer information along with their geographic details
select 

    c.CustomerID,          -- Select the CustomerID
    c.CustomerName,        -- Select the CustomerName
    c.Email,               -- Select the Email
    c.Gender,              -- Select the Gender
    c.Age,                 -- Select the Age
    g.Country,             -- Select the Country from the geography table
    g.City                 -- Select the City from the geography table

-- From the customers table in the dbo schema, with an alias 'c'
from dbo.customers as c
-- Perform a left join with the geography table in the dbo schema, with an alias 'g'
left join dbo.geography as g
-- Join on GeographyID to connect customers with their geographic details
on c.GeographyID = g.GeographyID;

