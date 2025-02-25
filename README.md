# Marketing Analytics Project

## Project Overview
This project analyzes marketing data to uncover trends in customer engagement, conversion rates, and product ratings. Using **SQL** for data cleaning, **Python** for sentiment analysis, and **Power BI** for visualization, I built interactive dashboards to provide actionable insights and recommendations for improving marketing strategies.

---

## Key Findings

### 1. **Engagement Trends**
- **Views**: The number of views has been decreasing over time.
- **Likes and Clicks**: Likes and clicks have remained consistent overall.
- **Content Performance**:
  - **Blogs**: Predominate in engagement compared to other content types.
  - **Videos**: Have the least views.

### 2. **Product Performance**
- **Most Viewed Product**: Basketball.
- **Least Viewed Product**: Dumbbells.
- **Best Conversion Rates**:
  - Hockey Stick: **15.46%**
  - Ski Boots: **14.61%** (last year).
- **Worst Conversion Rates**:
  - Swim Goggles: **5.62%**
  - Running Shoes: **6.25%**

### 3. **Conversion Rate Trends**
- A rebound in conversion rates was observed in recent months:
  - October: **6.15%**
  - November: **7.88%**
  - December: **11.41%**

### 4. **Customer Reviews**
- Products with the most critical reviews:
  - Surfboard
  - Dumbbells
  - Golf Clubs
  - Hockey Stick
  - Tennis Racket
- Common issues mentioned in low-scoring reviews:
  - Bad experiences
  - Not worth the money
  - Disappointed with product performance

---

## Recommendations
1. **Focus on High-Performing Products**:
   - Allocate more marketing resources to products with high conversion rates (e.g., Hockey Stick, Ski Boots).
   - Investigate why Basketball has high views but lower conversion rates.

2. **Improve Low-Performing Products**:
   - Address issues with Swim Goggles and Running Shoes to improve conversion rates.
   - Use customer feedback to enhance product quality and customer satisfaction.

3. **Optimize Content Strategy**:
   - Invest more in blog content, as it dominates engagement.
   - Re-evaluate video content strategy to increase views.

4. **Address Negative Reviews**:
   - Investigate root causes of negative reviews for Surfboard, Dumbbells, Golf Clubs, Hockey Stick, and Tennis Racket.
   - Implement changes to improve customer experience and product quality.

---

## Dashboards
Below are screenshots of the Power BI dashboards created for this analysis:

### 1. **Overview Dashboard**
![Social Media Dashboard](https://github.com/SheenyxX/Marketing-Project/raw/main/path/to/image/Overview.png)  
*Analyzes engagement metrics across platforms.*
 
*Tracks views, clicks, likes, and conversion rates over time.*

### 2. **Social Media Dashboard**
![Social Media Dashboard](Images/dashboard_screenshots/social_media.png)  
*Analyzes engagement metrics across platforms.*

### 3. **Ratings Dashboard**
![Ratings Dashboard](Images/dashboard_screenshots/ratings.png)  
*Shows product ratings and trends over time.*

### 4. **Conversion Rate Dashboard**
![Conversion Rate Dashboard](Images/dashboard_screenshots/conversion_rate.png)  
*Highlights conversion rates by product and campaign.*

---

## Tools Used
- **SQL**: For data cleaning and transformation.
- **Python**: For sentiment analysis on customer reviews.
- **Power BI**: For data visualization and interactive dashboards.

---

## Repository Structure
Marketing_Analysis_Project/
├── Data/
│   ├── raw_data/          # Original datasets
│   ├── cleaned_data/      # Cleaned datasets
├── Scripts/
│   ├── sql_queries.sql    # SQL scripts for cleaning and analysis
│   ├── sentiment_analysis.py  # Python script for sentiment analysis
├── Power_BI/
│   ├── dashboards/        # Power BI files (.pbix)
├── Images/
│   ├── dashboard_screenshots/  # Screenshots of Power BI dashboards
├── README.md              # Project overview and documentation
