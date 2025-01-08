--Q1. What's the average revenue among companies on the list? Broken down by industry?
 SELECT * from INC5000;

 SELECT Industry, AVG(Revenue) AS AVG_REVENUE FROM INC5000 
GROUP BY Industry
ORDER BY  AVG_REVENUE DESC;

--Q2.Which industries are most and least represented in the list?
SELECT Industry, COUNT(RANK) AS RANK FROM INC5000 
GROUP BY Industry
ORDER BY  Rank DESC;

--Q3.Do you notice any interesting geographic trends?
SELECT Region,SUM(Revenue)AS REVENUE FROM INC5000
GROUP BY Region
ORDER BY REVENUE DESC;

--Q4.Which industries saw the largest average growth rate?
SELECT Industry,AVG(Growth) AVG_GROWTH FROM INC5000
GROUP BY Industry
ORDER BY AVG_GROWTH;

--Q5.Which companies had the largest increase in staff/new hires?
--(Top 5 and Bottom 5 - Companies )
SELECT TOP 5 Name,SUM(New_Staff) AS STAFF FROM INC5000
GROUP BY Name
ORDER BY STAFF DESC; --TOP 5 

SELECT TOP 5 Name,SUM(New_Staff) AS STAFF FROM INC5000
GROUP BY Name
ORDER BY STAFF ASC;-- BOTTON 5

--Q6.Did any companies increase revenue while reducing staff?
SELECT TOP 10 Name,SUM(New_Staff)AS STAFF,SUM(Revenue) AS REVENUE FROM INC5000
WHERE New_Staff < 0
GROUP BY Name
ORDER BY STAFF ;

--Q7.Top 1000 - Winner State 
--The most frequent state appearing in the Top 1000 values of companies 
SELECT TOP 1000 Country,State,Region,COUNT(Name) AS TOTAL_COMPANIES FROM INC5000
GROUP BY  Country,State,Region
ORDER BY TOTAL_COMPANIES DESC;

--Q8.Do we have any company which was founded last year and Ranked under Top 100 
SELECT TOP 100 Name,Founded,Rank FROM INC5000
WHERE Founded = '2015'