---

# 🌐 Website Traffic Analysis Report

Project_Scope: |
  This analysis investigates daily website traffic patterns, focusing on total page loads, unique visits, daily trends, and growth over time. The goal is to uncover visitor engagement trends that help optimize site performance and improve user retention.


---

## 🎯 Analysis Objectives
This project answers critical questions, such as:
1. **How many visitors engage with our site?**
2. **Which days and months see the highest activity?**
3. **What is the growth trend in visitor traffic?**
4. **Where should we focus for sustained visitor engagement?**

With these insights, stakeholders can align their marketing and operational efforts to maximize site traffic and engagement.

---

## Who Benefits
The insights from this analysis are valuable for:
- **Marketing Teams:** To tailor campaigns based on peak traffic patterns.
- **Web Development Teams:** To enhance user experience on days of high traffic.
- **Business Strategists:** To understand and capitalize on audience growth trends.

---

## My Role
I handle the data, performing the analysis to transform raw metrics into actionable insights. I’ve used SQL to calculate core metrics and track performance over time, all detailed in the sections below with supporting visualizations.

---

## 📊 Analytical Breakdown

### 1️⃣ **Total Page Loads & Unique Visits Over the Period**
   - **Objective:** Assess overall visitor engagement on the website.
   - **SQL Query:**

     ```sql
     SELECT SUM(Page_Loads) AS total_page_loads,
            SUM(Unique_Visits) AS total_unique_visits
     FROM daily_website_visitors;
     ```

   - ![Total page loads and unique visits](https://github.com/DanieltheAnalyst1/screenshot3/blob/main/Total%20page%20loads%20and%20unique%20visits%20over%20the%20period.png)
   - **Insight:** This metric provides a clear view of the website's overall reach and user interest.

---

### 2️⃣ **Average Daily Visits**
   - **Objective:** Evaluate typical visitor engagement per day, including first-time and returning visits.
   - **SQL Query:**

     ```sql
     SELECT AVG(Unique_Visits) AS average_daily_unique_visits,
            AVG(First_Time_Visits) AS average_daily_first_time_visits,
            AVG(Returning_Visits) AS average_daily_returning_visits
     FROM daily_website_visitors;
     ```

   - ![Average daily visits](https://github.com/DanieltheAnalyst1/screenshot3/blob/main/Average%20daily%20visits.png)
   - **Insight:** Knowing the daily visit averages aids in setting baseline engagement expectations and strategies for improving repeat visits.

---

### 3️⃣ **Daily Traffic by Day of the Week**
   - **Objective:** Discover which days have the highest engagement and whether specific days are optimal for targeted content.
   - **SQL Query:**

     ```sql
     SELECT Day_Of_Week,
            AVG(Page_Loads) AS avg_page_loads,
            AVG(Unique_Visits) AS avg_unique_visits,
            AVG(First_Time_Visits) AS avg_first_time_visits,
            AVG(Returning_Visits) AS avg_returning_visits
     FROM daily_website_visitors
     GROUP BY Day_Of_Week
     ORDER BY FIELD(Day_Of_Week, 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');
     ```

   - ![Daily traffic by day of the week](https://github.com/DanieltheAnalyst1/screenshot3/blob/main/Daily%20traffic%20by%20day%20of%20the%20week.png)
   - **Insight:** Identifying the most active days allows for scheduling high-impact content to maximize reach and engagement.

---

### 4️⃣ **Monthly Traffic Trends**
   - **Objective:** Track monthly engagement trends to observe seasonality in traffic.
   - **SQL Query:**

     ```sql
     SELECT DATE_FORMAT(STR_TO_DATE(Date, '%m/%d/%Y'), '%Y-%m') AS month,
            SUM(Page_Loads) AS total_page_loads,
            SUM(Unique_Visits) AS total_unique_visits,
            SUM(First_Time_Visits) AS total_first_time_visits,
            SUM(Returning_Visits) AS total_returning_visits
     FROM daily_website_visitors
     GROUP BY month
     ORDER BY month;
     ```

   - ![Monthly traffic trends](https://github.com/DanieltheAnalyst1/screenshot3/blob/main/Monthly%20traffic%20trends%20with%20date.png)
   - **Insight:** Monthly trends offer insights into the periods of increased or decreased site interest, helping with budget allocation and promotional planning.

---

### 5️⃣ **Peak Traffic Days**
   - **Objective:** Highlight days with the highest unique visits for potential re-engagement or analysis of content impact.
   - **SQL Query:**

     ```sql
     SELECT Date,
            Page_Loads,
            Unique_Visits,
            First_Time_Visits,
            Returning_Visits
     FROM daily_website_visitors
     ORDER BY Unique_Visits DESC
     LIMIT 10;
     ```

   - ![Peak traffic days](https://github.com/DanieltheAnalyst1/screenshot3/blob/main/Peak%20traffic%20days.png)
   - **Insight:** Peak days can be analyzed to understand what drove the increased interest and replicate successful tactics.

---

### 6️⃣ **Growth in Traffic Over Time**
   - **Objective:** Measure growth percentage to monitor the impact of changes in site content or marketing.
   - **SQL Query:**

     ```sql
     WITH daily_growth AS (
         SELECT Date,
                Unique_Visits,
                LAG(Unique_Visits, 1) OVER (ORDER BY Date) AS previous_day_visits
         FROM daily_website_visitors
     )
     SELECT Date,
            Unique_Visits,
            previous_day_visits,
            (Unique_Visits - previous_day_visits) AS daily_growth,
            (Unique_Visits - previous_day_visits) / previous_day_visits * 100 AS growth_percentage
     FROM daily_growth
     WHERE previous_day_visits IS NOT NULL;
     ```

   - ![Growth in traffic over time](https://github.com/DanieltheAnalyst1/screenshot3/blob/main/Growth%20in%20traffic%20over%20time.png)
   - **Insight:** Growth analysis helps track increases in visitor engagement, indicating successful strategies or impactful campaigns.

---

## Conclusion
This report provides a comprehensive view of visitor behavior and traffic growth. These insights are crucial for maintaining a competitive edge, refining content strategy, and optimizing the overall website experience. With these skills and analytical approaches, I’m well-prepared to deliver data-driven solutions in a data analyst role, turning raw data into actionable strategies for business growth. 

--- 
