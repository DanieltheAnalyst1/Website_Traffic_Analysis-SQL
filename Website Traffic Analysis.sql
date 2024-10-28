-- I write down statements in my SQL code to help anyone who sees the code to easily understand what I did.

-- Check the table
select * from daily_website_visitors;

-- Total page loads and unique visits over the period
SELECT 
    SUM(Page_Loads) AS total_page_loads,
    SUM(Unique_Visits) AS total_unique_visits
FROM 
    daily_website_visitors;

-- Average daily visits
SELECT 
    AVG(Unique_Visits) AS average_daily_unique_visits,
    AVG(First_Time_Visits) AS average_daily_first_time_visits,
    AVG(Returning_Visits) AS average_daily_returning_visits
FROM 
    daily_website_visitors;

-- Daily traffic by day of the week
SELECT 
    Day_Of_Week,
    AVG(Page_Loads) AS avg_page_loads,
    AVG(Unique_Visits) AS avg_unique_visits,
    AVG(First_Time_Visits) AS avg_first_time_visits,
    AVG(Returning_Visits) AS avg_returning_visits
FROM 
    daily_website_visitors
GROUP BY 
    Day_Of_Week
ORDER BY 
    FIELD(Day_Of_Week, 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');

-- Monthly traffic trends with date in MM/DD/YYYY format
SELECT 
    DATE_FORMAT(STR_TO_DATE(Date, '%m/%d/%Y'), '%Y-%m') AS month,
    SUM(Page_Loads) AS total_page_loads,
    SUM(Unique_Visits) AS total_unique_visits,
    SUM(First_Time_Visits) AS total_first_time_visits,
    SUM(Returning_Visits) AS total_returning_visits
FROM 
    daily_website_visitors
GROUP BY 
    month
ORDER BY 
    month;

-- Peak traffic days
SELECT 
    Date,
    Page_Loads,
    Unique_Visits,
    First_Time_Visits,
    Returning_Visits
FROM 
    daily_website_visitors
ORDER BY 
    Unique_Visits DESC
LIMIT 10;

-- Growth in traffic over time
WITH daily_growth AS (
    SELECT 
        Date,
        Unique_Visits,
        LAG(Unique_Visits, 1) OVER (ORDER BY Date) AS previous_day_visits
    FROM 
        daily_website_visitors
)
SELECT 
    Date,
    Unique_Visits,
    previous_day_visits,
    (Unique_Visits - previous_day_visits) AS daily_growth,
    (Unique_Visits - previous_day_visits) / previous_day_visits * 100 AS growth_percentage
FROM 
    daily_growth
WHERE 
    previous_day_visits IS NOT NULL;
