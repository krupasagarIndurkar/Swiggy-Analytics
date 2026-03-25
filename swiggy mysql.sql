create database swiggy2;
use swiggy2;

--------------- 1.Total orders ------------------------
select count(orderId) as Total_orders from orders;

---------------- 2. Total revenue  ------------------------
SELECT sum(total_Amount) AS Total_Revenue FROM orders;

--------------- 3. Average order value ---------------------
SELECT SUM(total_amount)/COUNT(orderid) AS AOV FROM orders;

--------------- 4. Total customer -------------------------
SELECT COUNT(DISTINCT customer_id) AS Total_Customers FROM orders;

--------- 5. Delivery efficiency percentage ---------------
SELECT 
    (SUM(CASE WHEN Delivery_Status = "on time" THEN 1 END) 
    / COUNT(order_id))* 100 AS Delivery_Efficiency
FROM Delivery;

------------ 6. Top performing restaurant -------------------
select restaurant_name,total_reviews from(
SELECT Restaurant_name,Total_reviews,average_rating from restaurant
order by  average_rating desc limit 10) TopN ;

---------- 7. order cancellation percentage --------------
SELECT (COUNT(CASE WHEN status='Cancelled' THEN 1 END)/COUNT(orderid))*100 AS Cancellation_Rate FROM orders;

------------ 8.  Customer Satisfaction Score ---------------
SELECT AVG(delivery_feedback_rating) AS CSS FROM delivery;


--------- 9. Active Delivery Agents -----------------------
SELECT COUNT(DISTINCT delivery_agent_id) AS Active_Agents FROM delivery;

------------ 10. Average delivery time ---------------------
select avg(Delivery_time) as Avg_Delivery_Time from orders;


---------------- 11. Revenue Per Customer ---------------
SELECT SUM(total_amount)/COUNT(DISTINCT customer_id) AS Revenue_Per_Customer FROM orders;

------------------- 12. Top food items -------------
select item_name,category from (
select Item_Name,category,count(item_name) as orders from menu
group by Item_Name,Category order by 3 desc limit 10) food ;

------------- 13. Highly ordered location ------------
select location,sum(average_rating) as Avg_rating
from restaurant group by location                ## based on sum of the ratings
order by avg_rating desc;                                       
























































## not to use ##

SELECT Item_name, count(item_name) AS Orders FROM menu 
JOIN orders USING(Menu) GROUP BY category ORDER BY Orders DESC;

select menuItem_id,category,count(Item_name) from menu
group by 1,2;
SELECT (COUNT(CASE WHEN status ="Delivered" THEN 1  END)/COUNT(orderid))*100 AS Delivery_Efficiency FROM orders;