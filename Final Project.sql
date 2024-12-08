
/* 
1. My partner and I want to come by each of the stores in person and meet the managers. 
Please send over the managers’ names at each store, with the full address 
of each property (street address, district, city, and country please).  
*/ 
/*select 
	staff.first_name as First_Name,
    staff.last_name as Last_Name,
    staff.store_id as Store_ID,
	address.address as Address,
    address.district as District,
    city.city as City,
    country.country as Country
from staff
	Inner join address
		on staff.address_id = address.address_id
	Inner join city
		on address.city_id = city.city_id
	Inner join country
		on city.country_id = country.country_id*/


	
/*
2.	I would like to get a better understanding of all of the inventory that would come along with the business. 
Please pull together a list of each inventory item you have stocked, including the store_id number, 
the inventory_id, the name of the film, the film’s rating, its rental rate and replacement cost. 
*/

/*select 
	inventory.inventory_id as Inventory_ID,
    inventory.store_id as Store_ID,
    film.title as Film_Name,
    film.rating as Rating,
    film.rental_rate as Rental_Rate,
    film.replacement_cost as Replacement_Cost
from inventory
	left join film
		on inventory.film_id = film.film_id*/


/* 
3.	From the same list of films you just pulled, please roll that data up and provide a summary level overview 
of your inventory. We would like to know how many inventory items you have with each rating at each store. 
*/

/*SELECT 
	inventory.store_id as Store_ID,
    film.rating as Rating,
    count(inventory.inventory_id) as Total_No_of_Films
    
FROM inventory
LEFT JOIN film
    ON inventory.film_id = film.film_id
GROUP BY inventory.store_id, film.rating;*/


/* 
4. Similarly, we want to understand how diversified the inventory is in terms of replacement cost. We want to 
see how big of a hit it would be if a certain category of film became unpopular at a certain store.
We would like to see the number of films, as well as the average replacement cost, and total replacement cost, 
sliced by store and film category. 
*/ 

/*select 
	store_id as Store_ID,
    category.name as Category,
    Count(inventory.inventory_id) as Films,
    Avg(film.replacement_cost) as Avg_Replacement_Cost,
    Sum(film.replacement_cost) as Total_Replacement_Cost
	
From Inventory
	Left Join film
		on inventory.film_id = film.film_id
	left join film_Category
		on film.film_id = film_Category.film_id
	left join category
		on category.category_id = film_category.category_id
        
group by 
	store_id, 
    category.name
Order by 
	Count(inventory.inventory_id) desc*/



/*
5.	We want to make sure you folks have a good handle on who your customers are. Please provide a list 
of all customer names, which store they go to, whether or not they are currently active, 
and their full addresses – street address, city, and country. 
*/

/*select
	first_name as First_Name,
    last_name as Last_Name,
    store_id as Store_ID,
        CASE 
        WHEN active = 1 THEN 'Active'
        WHEN active = 2 THEN 'Not_Active'
        ELSE 'Unknown' 
    END AS Customer_Status,
    address.address as Address,
    city.city as City,
    country.country as Country

from customer
	Left join address
		on customer.address_id = address.address_id
	LEft join city
		on address.city_id = city.city_id
	left join country
		on city.country_id = country.country_id;*/


/*
6.	We would like to understand how much your customers are spending with you, and also to know 
who your most valuable customers are. Please pull together a list of customer names, their total 
lifetime rentals, and the sum of all payments you have collected from them. It would be great to 
see this ordered on total lifetime value, with the most valuable customers at the top of the list. 
*/

/*select
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
    
order by total_value desc*/

    
/*
7. My partner and I would like to get to know your board of advisors and any current investors.
Could you please provide a list of advisor and investor names in one table? 
Could you please note whether they are an investor or an advisor, and for the investors, 
it would be good to include which company they work with. 
*/

/*select
	First_name,
    Last_name,
    'Advisor' as Type,
    'Null' as Company_name
from advisor

union

select
	First_name,
    Last_name,
    'Investor' as Type,
    Company_name
from Investor*/


/*
8. We're interested in how well you have covered the most-awarded actors. 
Of all the actors with three types of awards, for what % of them do we carry a film?
And how about for actors with two types of awards? Same questions. 
Finally, how about actors with just one award? 
*/


select
	case
		when actor_award.awards = 'Emmy, Oscar, Tony ' then '3 Awards'
        when actor_award.awards in ('Emmy, Oscar','emmy, tony','oscar, tony') then '2 Awards'
        Else '1 Award'
	End as 'Number_of_Awards',
    count(case when actor_award.actor_id is null then 0 else 1 end) as Total_No_of_Actors,
    Round(Avg(case when actor_award.actor_id is null then 0 else 1 end) * 100, 2) as Percentage_of_Actors
from actor_award

Group by 
	case
		when actor_award.awards = 'Emmy, Oscar, Tony ' then '3 Awards'
        when actor_award.awards in ('Emmy, Oscar','emmy, tony','oscar, tony') then '2 Awards'
        Else '1 Award'
	End;


/*SELECT 
	ROUND(COUNT(CASE WHEN length(awards) = 18 THEN 1 END) / 
             COUNT(CASE WHEN actor_id IS NOT NULL THEN 1 END) * 100.0, 2) 
             AS Percentage_of_Actors_W_3_Awards,
	ROUND(COUNT(CASE WHEN length(awards) in ('11','10') THEN 1 END) / 
             COUNT(CASE WHEN actor_id IS NOT NULL THEN 1 END) * 100.0, 2) 
             AS Percentage_of_Actors_W_2_Awards,
	ROUND(COUNT(CASE WHEN length(awards) in ('4','5') THEN 1 END) / 
             COUNT(CASE WHEN actor_id IS NOT NULL THEN 1 END) * 100.0, 2) 
             AS Percentage_of_Actors_W_1_Award
             
from actor_award*/
-- above one is obsolete