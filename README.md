# Swiggy SQL Business Analysis

A MySQL case study on a Swiggy-style food delivery dataset. I built the database from scratch (Customers, Restaurants and Orders tables with primary and foreign keys) and wrote SQL queries to answer 20 business questions, ending with a management report and three recommendations.

## Files

- `swiggy.sql`: database creation, sample data and all the queries

## Dataset

| Table | Rows | Key columns |
| --- | --- | --- |
| Customers | 12 | CustomerID, CustomerName, City, Membership |
| Restaurants | 12 | RestaurantID, RestaurantName, Cuisine, City, Rating |
| Orders | 20 | OrderID, CustomerID, RestaurantID, OrderAmount, DeliveryPartner, OrderDate, OrderStatus |

This is a small practice dataset, so the numbers show how the analysis works rather than real Swiggy performance.

## SQL Skills Used

- Aggregations: COUNT, SUM, AVG, MAX with GROUP BY and HAVING
- Joins: LEFT JOIN, RIGHT JOIN and multiple INNER JOINs
- Subqueries: second highest order, customers spending above average
- CASE WHEN: grouping orders into Budget, Medium and Premium
- Window functions: RANK(), DENSE_RANK() and ROW_NUMBER()

## Questions Answered

**Basic analysis**
1. How many total orders were placed on the platform?
2. What is the total revenue generated?
3. What is the average order value?
4. Which are the top 5 highest-value orders?
5. Which city generated the highest revenue?
6. Which restaurant generated the highest total revenue?
7. Which cuisine is the most popular by number of orders?
8. Which delivery partner completed the most successful deliveries?

**Filtering and subqueries**

9. Which customers spent more than the average order value?
10. What is the second highest order amount?
11. Which restaurant has the highest average customer rating?
12. Which cities generated revenue greater than ₹2,000?

**Joins**

13. Which customers have never placed an order? (LEFT JOIN)
14. Which restaurants have never received any orders? (RIGHT JOIN)
15. Show each customer's order details with customer name, restaurant, cuisine, amount and status. (multiple INNER JOINs)

**CASE WHEN and window functions**

16. Categorise every order as Budget, Medium or Premium. (CASE WHEN)
17. Rank customers by total spending. (RANK)
18. Give every order a serial number from highest to lowest amount. (ROW_NUMBER)
19. Rank restaurants by total revenue, with ties sharing a rank and no gaps. (DENSE_RANK)

**Final business report**

20. Management questions answered below.

## Key Insights

| Question | Finding |
| --- | --- |
| Total orders | 20 |
| Total revenue | ₹13,220 |
| Average order value | ₹661 |
| City to focus on for expansion | **Delhi**, with the highest total revenue (₹3,820) |
| Best-performing restaurant | **Barbeque Nation**, with the highest total revenue (₹1,940) |
| Cuisine to promote | **Fast Food**, the most ordered cuisine |
| Delivery partner for a performance bonus | **Rahul**, the most successful deliveries |
| Cancelled orders | **10%** (2 of 20 orders) |
| Restaurants needing improvement (lowest ratings) | Faasos (4.0), KFC (4.1), Subway (4.2), Wow Momo (4.2) |
| Customers with no orders | Riya Sharma and Aditya Singh |

## Recommendations

1. **Expand operations in Delhi.** It contributes the most revenue of any city.
2. **Promote Fast Food through offers and campaigns.** It is the most frequently ordered cuisine.
3. **Improve the lower-rated restaurants** (Faasos, KFC, Subway, Wow Momo) by acting on customer feedback, food quality and delivery delays.

## How to Run

1. Open MySQL Workbench and connect to your local MySQL server.
2. Open `swiggy.sql` and run the script. It creates the `Swiggy_Case_Study` database, the tables and the sample data.
3. Run the queries one at a time to see each result.

## Tools

MySQL, MySQL Workbench
