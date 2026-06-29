--Total Spend
SELECT SUM(Cost) AS Total_Spend
FROM dbo.Marketing_Data;


--Cost Per Click (CPC)
--CPC = Total Spend / Total Clicks
SELECT
    SUM(Cost) AS Total_Spend,
    COUNT(*) AS Total_Clicks,
    SUM(Cost) / COUNT(*) AS CPC
FROM dbo.Marketing_Data;


--Customer Acquisition Cost (CAC)
--CAC = Total Spend / Total Conversions
SELECT
    SUM(Cost) AS Total_Spend,
    SUM(Conversion_Flag) AS Total_Conversions,
    SUM(Cost) / NULLIF(SUM(Conversion_Flag),0) AS CAC
FROM dbo.Marketing_Data;


--Return On Ad Spend (ROAS)
--ROAS = Revenue / Spend
SELECT
    SUM(Revenue) AS Total_Revenue,
    SUM(Cost) AS Total_Spend,
    SUM(Revenue) / NULLIF(SUM(Cost),0) AS ROAS
FROM dbo.Marketing_Data;


--Channel-wise Performance
SELECT
    Channel,
    SUM(Cost) AS Total_Spend,
    SUM(Revenue) AS Total_Revenue,
    SUM(Conversion_Flag) AS Total_Conversions
FROM dbo.Marketing_Data
GROUP BY Channel;


--Channel-wise CAC and ROAS
SELECT
    Channel,
    SUM(Cost) AS Total_Spend,
    SUM(Revenue) AS Total_Revenue,
    SUM(Conversion_Flag) AS Total_Conversions,
    SUM(Cost) / NULLIF(SUM(Conversion_Flag),0) AS CAC,
    SUM(Revenue) / NULLIF(SUM(Cost),0) AS ROAS
FROM dbo.Marketing_Data
GROUP BY Channel;