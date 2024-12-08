Project Objective:
The project focuses on providing critical insights into the operations of a retail business by analyzing its store, inventory, and staff data. Specifically, the objective is to-

1. Identify and retrieve information about store managers and their corresponding store locations.
2. Analyze inventory data, including film details, rental rates, and replacement costs, across multiple stores.
This project demonstrates the use of SQL for querying and reporting from a relational database, highlighting the ability to extract meaningful insights from structured data.

Technologies:
SQL Dialect: MySQL (based on the syntax in the SQL queries).
Database Relationships: Queries involve multiple joins across relational tables.

Results:
The project yielded the following insights-
1. Manager and Store Location Report
Insight: Identified the store managers along with their full address details (street, district, city, and country). 
2. Inventory Item Overview
Insight: Generated a detailed list of inventory items, including:
store_id: Store where the inventory is located.
inventory_id: Unique identifier for each item.
film name, rating, rental rate, and replacement cost. 
3. Inventory Summary by Rating
Insight: Summarized inventory by counting the number of films with each rating (G, PG, etc.) in each store. 
4. Replacement Cost and Category Diversity
Insight: Analyzed inventory by film category and store, including
Number of films per category.
Average and total replacement costs per category and store.
5. Customer Demographics and Status
Insight: Provided a comprehensive list of customers, including
Names, associated store, and current status (Active or Not Active).
Full addresses (street, city, and country). 
6. Customer Lifetime Value
Insight: Ranked customers based on
Total lifetime rentals.
Sum of all payments collected from them. The results highlight the most valuable customers.
7. Advisors and Investors
Insight: Created a consolidated table listing advisors and investors
Advisors are tagged with their role, while investors include their associated companies. 
8. Actor Awards and Film Representation
Insight: Assessed coverage of the most-awarded actors
For actors with 3 awards, calculated the percentage represented in the inventory.
Similar percentages for actors with 2 and 1 award. 

### Sample SQL Code
The following query demonstrates how customer data was analyzed to identify top-performing customers based on rental history and total payments:

```sql
select
    first_name as First_Name,
    last_name as Last_Name,
    count(rental.rental_id) as Number_of_Rentals,
    sum(payment.amount) as Total_Value
from customer
    left join rental
        on customer.customer_id = rental.customer_id
    left join payment
        on rental.rental_id = payment.rental_id
group by first_name,
         last_name
order by total_value desc;
```
Key Techniques:

LEFT JOIN: 
Combines data from multiple related tables to enrich customer profiles.
Aggregations:
COUNT(rental.rental_id): Counts the number of rentals per customer.
SUM(payment.amount): Calculates the total payment value for each customer.
Grouping and Ranking:
GROUP BY groups data by customer names.
ORDER BY total_value DESC ranks customers by their lifetime value.



