# Marketing Analytics: Boosting Engagement and Conversion Rates

## **Project Overview**

### **Goal**
The goal of this project was to analyze marketing data to identify trends in customer engagement, conversion rates, and product performance. By addressing key challenges (e.g., declining views and low conversion rates), the aim was to provide actionable recommendations to improve marketing strategies.

### **Tools Used**
- **SQL**: Data cleaning, transformation, and analysis.
- **Python**: Sentiment analysis on customer reviews using TextBlob.
- **Power BI**: Interactive dashboards for visualizing insights.

---

## **Data Cleaning Process**
### **1. Handling Duplicates**
Duplicate records in the fact_customer_journey table were identified and removed using a **CTE (Common Table Expression)** with ROW_NUMBER():

```sql
WITH DuplicateRecords AS (
    SELECT 
        JourneyID, CustomerID, ProductID, VisitDate, Stage, Action, Duration,
        ROW_NUMBER() OVER (
            PARTITION BY CustomerID, ProductID, VisitDate, Stage, Action 
            ORDER BY JourneyID
        ) AS row_num
    FROM dbo.customer_journey
)
SELECT *
FROM DuplicateRecords
WHERE row_num = 1; -- Keep only the first occurrence of duplicates
```

Why This Matters: Duplicates can skew engagement metrics like views and clicks, leading to inaccurate insights.

### **2. Standardizing Text Data**
In the fact_customer_reviews table, double spaces in the ReviewText column were replaced with single spaces for consistency:

```sql
SELECT 
    ReviewID, CustomerID, ProductID, ReviewDate, Rating,
    REPLACE(ReviewText, '  ', ' ') AS ReviewText -- Fix spacing issues
FROM dbo.customer_reviews;
```

Why This Matters: Clean text data ensures accurate sentiment analysis results.

### **3. Splitting Combined Columns**
In the fact_engagement_data table, the ViewsClicksCombined column was split into separate Views and Clicks columns:

```sql
SELECT 
    EngagementID, ContentID, CampaignID, ProductID,
    LEFT(ViewsClicksCombined, CHARINDEX('-', ViewsClicksCombined)-1) AS Views,
    RIGHT(ViewsClicksCombined, LEN(ViewsClicksCombined) - CHARINDEX('-', ViewsClicksCombined)) AS Clicks
FROM dbo.engagement_data;
```

Why This Matters: Separating combined columns simplifies analysis and visualization.

### **4. Handling Missing Values**
Missing Duration values in the fact_customer_journey table were replaced with the average duration for the corresponding date:

```sql
SELECT 
    JourneyID, CustomerID, ProductID, VisitDate, Stage, Action,
    COALESCE(Duration, avg_duration) AS Duration -- Replace NULLs with averages
FROM (
    SELECT 
        JourneyID, CustomerID, ProductID, VisitDate, Stage, Action, Duration,
        AVG(Duration) OVER (PARTITION BY VisitDate) AS avg_duration
    FROM dbo.customer_journey
) AS subquery;
```

Why This Matters: Missing values can distort metrics like average session duration.

## **Sentiment Analysis with Python**
### **Hybrid Sentiment Categorization**
Customer reviews were analyzed using TextBlob to calculate sentiment polarity. A hybrid approach combined sentiment scores with ratings to categorize feedback:

```python
# Libraries: pandas, textblob  

def hybrid_sentiment_category(row):
    rating = row['Rating']
    sentiment = row['Sentiment']
    if rating >= 4:
        return 'Positive' if sentiment >= 0.1 else 'Neutral (Check)'
    elif rating <= 2:
        return 'Negative' if sentiment <= -0.1 else 'Neutral (Check)'
    else:
        return 'Neutral'

df['HybridSentiment'] = df.apply(hybrid_sentiment_category, axis=1)
```
Key Insight: This method flagged conflicts (e.g., high ratings with negative reviews) for deeper review.

## **Dashboards and Insights**

### **1. Overview Dashboard**
![Overview Dashboard](https://github.com/SheenyxX/Marketing-Project/blob/main/Overview1.png)  
**Purpose**: Track overall performance metrics over time, including views, clicks, likes, and conversion rates.

#### **Insights**:
- **Views**: The number of views has been decreasing over time, indicating a potential issue with content reach or audience engagement.
- **Likes and Clicks**: These metrics have remained consistent, suggesting that the content itself is engaging but may not be reaching a wider audience.
- **Conversion Rates**: A rebound was observed in recent months:
  - October: **6.15%**
  - November: **7.88%**
  - December: **11.41%**

#### **Critical Points**:
- Investigate why views are declining despite consistent likes and clicks.
- Focus on strategies to increase content reach and visibility..

---

### **2. Social Media Dashboard**
![Social Media Dashboard](https://github.com/SheenyxX/Marketing-Project/blob/main/Socialmedia.png)  
**Purpose**: Analyze engagement metrics across different content types (blogs, social media, videos).

#### **Insights**:
- **Blogs**: Predominate in engagement, suggesting that written content resonates well with the audience.
- **Videos**: Have the least views, indicating a need to reevaluate video content strategy.
- **Social Media**: Performs moderately but has room for improvement.

#### **Critical Points**:
- Invest more in blog content, as it drives the most engagement.
- Reassess video content strategy to improve views and engagement.

---

### **3. Ratings Dashboard**
![Ratings Dashboard](https://github.com/SheenyxX/Marketing-Project/blob/main/rating.png)  
**Purpose**: Track product ratings and identify trends over time.

#### **Insights**:
- **Best-Rated Products**: Basketball and Hockey Stick have consistently high ratings.
- **Worst-Rated Products**: Surfboard, Dumbbells, Golf Clubs, and Tennis Racket have the most critical reviews.
- **Common Issues in Reviews**:
  - Bad experiences.
  - Not worth the money.
  - Disappointed with product performance.

#### **Critical Points**:
- Address quality and performance issues for low-rated products.
- Use customer feedback to improve product design and customer satisfaction.

---

### **4. Conversion Rate Dashboard**
![Conversion Rate Dashboard](https://github.com/SheenyxX/Marketing-Project/blob/main/Conversion.png)  
**Purpose**: Highlight conversion rates by product and campaign.

#### **Insights**:
- **Best-Performing Products**:
  - Hockey Stick: **15.46%** conversion rate.
  - Ski Boots: **14.61%** conversion rate (last year).
- **Worst-Performing Products**:
  - Swim Goggles: **5.62%** conversion rate.
  - Running Shoes: **6.25%** conversion rate.

#### **Critical Points**:
- Allocate more marketing resources to high-conversion products (e.g., Hockey Stick, Ski Boots).
- Investigate and improve low-conversion products (e.g., Swim Goggles, Running Shoes).

---

## **Recommendations**
1. **Improve Content Reach**:
   - Focus on increasing views by optimizing content distribution channels.
   - Experiment with new formats or platforms to attract a wider audience.

2. **Enhance Product Quality**:
   - Address issues with low-rated products (e.g., Surfboard, Dumbbells) to improve customer satisfaction.
   - Use customer feedback to guide product improvements.

3. **Optimize Marketing Spend**:
   - Allocate more resources to high-performing products (e.g., Hockey Stick, Ski Boots).
   - Reassess marketing strategies for low-performing products (e.g., Swim Goggles, Running Shoes).

4. **Leverage Blog Content**:
   - Invest more in blog content, as it drives the most engagement.
   - Explore ways to repurpose blog content into other formats (e.g., videos, infographics).

---
