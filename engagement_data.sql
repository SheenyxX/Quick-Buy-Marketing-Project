-- Select engagement data with various transformations and formatting
USE PortfolioProject_MarketingAnalytics
SELECT 

    EngagementID, -- Select the EngagementID
    ContentID,    -- Select the ContentID
    CampaignID,   -- Select the CampaignID
    ProductID,    -- Select the ProductID
    -- Convert 'SocialMedia' to 'Social Media' and convert the content type to lowercase
    LOWER(REPLACE(ContentType, 'SocialMedia', 'Social Media')) as ContentType,
    -- Extract the Views from the combined ViewsClicksCombined field
    LEFT (ViewsClicksCombined, CHARINDEX('-', ViewsClicksCombined)-1) as Views,
    -- Extract the Clicks from the combined ViewsClicksCombined field
    RIGHT (ViewsClicksCombined, LEN(ViewsClicksCombined) - CHARINDEX('-', ViewsClicksCombined)-1) as Clicks,
    Likes, -- Select the number of Likes
    -- Convert EngagementDate to a date format and then format it as 'dd.MM.yyyy'
    FORMAT(CONVERT(DATE,EngagementDate),'dd.MM.yyyy') as EngagementDate

FROM 
    DBO.engagement_data -- From the engagement_data table in the DBO schema
WHERE 
    ContentType != 'NewsLetter'; -- Filter out rows where ContentType is 'NewsLetter'
