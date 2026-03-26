select * from `workspace`.`default`.`bright_coffee_shop` limit 100;

---Query 2: Viewing the different locations
SELECT DISTINCT store_location
FROM `workspace`.`default`.`bright_coffee_shop`


---Query 3: Selecting Specific coloumns i want to view
Select transaction_id,
       product_category, 
       unit_price
from `workspace`.`default`.`bright_coffee_shop`


---Query 4: Filtering using the Where Statement
Select *
from `workspace`.`default`.`bright_coffee_shop`
where product_category = 'Coffee'


---Query 5: Filtering using the Where and AND Statement
Select *
from `workspace`.`default`.`bright_coffee_shop`
where product_category = 'Coffee'
AND store_location = 'Lower Manhattan'


---Query 6: Filtering using the Where and OR Statement
Select *
from `workspace`.`default`.`bright_coffee_shop`
where product_category = 'Coffee'
OR store_location = 'Lower Manhattan'

---Query 7: Using Column Alias
Select product_category AS Catergory_of_Products,
       unit_price AS Price_of_Products
from  `workspace`.`default`.`bright_coffee_shop`


---Query 8: Calculating Toatl Sales
Select Sum(unit_price * transaction_qty ) AS Total_Amount
from `workspace`.`default`.`bright_coffee_shop`

---Query 9: Viewing products sold at each store
select distinct product_category
from `workspace`.`default`.`bright_coffee_shop`

---Query 10: Viewing types of products sold at each store
select distinct product_type
from `workspace`.`default`.`bright_coffee_shop`

---Query 11: Viewing the Day and Month names
select 
transaction_date,
      Dayname(transaction_date) AS Day_Name,
      Monthname(transaction_date) AS Month_Name
from `workspace`.`default`.`bright_coffee_shop';

---Query 12: Calculating the Revenue
Select 
      unit_price,
      transaction_qty,
      unit_price*transaction_qty AS Revenue
from `workspace`.`default`.`bright_coffee_shop`

---Query 13:
Select*,
---Adding columns to tables to inhance insights 
      Dayname(transaction_date) AS Day_Name,
      Monthname(transaction_date) AS Month_Name,
      DayofMonth(transaction_date) AS Date_of_Month,
case
      When Dayname(transaction_date) IN ('SAT', 'SUN') Then 'Weekend'
      Else 'Weekday'
      End AS Day_classification,
case 
      when date_format(transaction_time, 'HH:mm:ss') BETWEEN '00:00:00' AND '11:59:59' then '01.Morning'
      when date_format(transaction_time, 'HH:mm:ss') BETWEEN '12:00:00' AND '16:59:59' then '02.Afternoon'
      Else '03.Evening'
      End As Time_Buckets,
case 
      when (transaction_qty*unit_price) <= '50' Then '01.Low Spend'
      when (transaction_qty*unit_price) Between 51 And 200 Then '02.Medium Spend'
      Else '03.High Spend'
      End As Spend_Bucket,

      transaction_qty*unit_price AS Revenue
from `workspace`.`default`.`bright_coffee_shop`
