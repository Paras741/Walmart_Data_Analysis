-- EDA

-- 1. How many unique cities does the data have?
SELECT DISTINCT City
FROM walmart;

-- 2. In which city is each branch?
SELECT DISTINCT city, Branch
FROM walmart;

-- 3. How many unique product lines does the data have?
SELECT DISTINCT Product_line
FROM walmart;

-- 4. What is the most common payment method?
SELECT Payment, COUNT(*)
FROM walmart
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- 5. What is the most selling product line?
SELECT product_line, COUNT(*)
FROM walmart
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- 6. What is the total revenue by month?
SELECT month, ROUND(SUM(Total),2) revenue
FROM walmart
GROUP BY 1;

-- 7. What is the city with the largest revenue?
SELECT city, ROUND(SUM(total),2)
FROM walmart
GROUP BY 1
ORDER BY 1 DESC;

-- 8. What month had the largest COGS?
SELECT month, SUM(cogs)
FROM walmart
GROUP BY 1
ORDER BY 2 DESC;

-- 9. What product line had the largest VAT?
SELECT product_line, ROUND(SUM(tax),2) largest_VAT
FROM walmart
GROUP BY 1
ORDER BY 2 DESC;

-- 10. Fetch each product line and add a column to those product line showing "Good", "Bad". 
-- Good if its greater than average sales
SELECT Product_line, 
CASE WHEN Total > (SELECT AVG(Total) FROM walmart) THEN 'Good' ELSE 'Bad' END AS product_quality
FROM walmart;

ALTER TABLE walmart
ADD COLUMN product_quality VARCHAR(50);

UPDATE walmart
SET product_quality = CASE 
    WHEN Total > 322.966 THEN 'Good'
    ELSE 'Bad'
END;

-- 11. Which branch sold more products than average product sold?
SELECT DISTINCT Branch, SUM(quantity) AS qty
FROM walmart
GROUP BY 1
HAVING SUM(quantity) > (SELECT AVG(Quantity) FROM walmart);

-- 12. What is the most common product line by gender?
SELECT Gender, Product_line, COUNT(gender) total_cnt
FROM walmart
GROUP BY 1,2
ORDER BY 3 DESC;

-- 13. What is the average rating of each product line?
SELECT Product_line, ROUND(AVG(Rating),2)
FROM walmart
GROUP BY 1
ORDER BY 2 DESC;

-- 14. Number of sales made in each time of the day per weekday
SELECT time_of_day, count(*) total_sales
FROM walmart
WHERE day = 'Sunday'
GROUP BY 1
ORDER BY 2 DESC;

-- 15. Which of the customer types brings the most revenue?
SELECT Customer_type, SUM(Total)
FROM walmart
GROUP BY 1
limit 1;

-- 16. Which city has the largest tax percent/ VAT (Value Added Tax)?
SELECT city, AVG(tax)
FROM walmart
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- 17. Which customer type pays the most in VAT
SELECT Customer_type, AVG(tax)
FROM walmart
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- 18. How many unique customer types does the data have?
SELECT *
FROM walmart;

-- 19. What is the most common customer type?
SELECT customer_type, COUNT(*)
FROM walmart
group by 1
ORDER BY 2 DESC
LIMIT 1;

-- 20. Which customer type buys the most?
SELECT customer_type, COUNT(*)
FROM walmart
group by 1
ORDER BY 2 DESC
LIMIT 1;

-- 21. What is the gender of most of the customers?
SELECT Gender, COUNT(*)
FROM walmart
GROUP BY 1
ORDER BY 2 DESC;

-- 22. What is the gender distribution per branch?
SELECT Branch, Gender, COUNT(*)
FROM walmart 
GROUP BY 1,2
ORDER BY 1,3 DESC;

-- 23. Which time of the day do customers give most ratings?
SELECT time_of_day, COUNT(Rating)
FROM walmart
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- 24. Which time of the day do customers give most ratings per branch?
SELECT time_of_day, Branch, COUNT(Rating)
FROM walmart
GROUP BY 1,2
ORDER BY 3 DESC;

-- 25. Which day of the week has the best avg ratings?
SELECT day, AVG(Rating)
FROM walmart
GROUP BY 1
ORDER BY 2 DESC;

-- 26. Which day of the week has the best average ratings per branch?
SELECT day, branch, ROUND(AVG(Rating),2)
FROM walmart
GROUP BY 1,2
ORDER BY 1,2;
















 









