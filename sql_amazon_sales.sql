-- Check amazon_sales Dataset --
select * from amazon_sales.amazon_sales;

-- Numbers of Product Categories --
select product_category,
		count(order_id) as total_orders
from amazon_sales.amazon_sales
group by 1
order by total_orders desc;
-- I do not use distint function since this dataset already is cleaned
-- Beauty is the first common category for people to buy on Amazon
-- Home & Kitchen is the least common category to buy on Amazon

-- Total of Items Being Discounted --
select product_category,
		count(case when discount_percent <> 0 then 1 end) as total_discounted_item
from amazon_sales.amazon_sales
group by product_category
order by total_discounted_item desc;
-- Beauty is the largest number of discounted items on Amazon
-- Home & Kitchen is the smallest number of discounted items
-- Sports is the second smallest number

-- Total Revenue on Different Prodcut Categories --
select product_category,
	round(sum(total_revenue),3) as total_all_revenue,
    count(order_id) as total_orders
from amazon_sales.amazon_sales
group by product_category
order by total_all_revenue desc;
-- Beauty also the most profit product categoru on Amazon
-- Sports is the least profit 
-- => Beauty section has the largest number of item being discounted so it attracts more people spend more money on Amazon which 
-- make it the most profit for Amazon

-- Top 3 Best-selling Products --
select product_id,
		product_category,
		SUM(quantity_sold) as total_units
from amazon_sales.amazon_sales
group by product_id, product_category
order by total_units desc
limit 3;
-- Electronics with product_id of 1980 is the most common choices on Amazon
-- TOp 2 is Beauty with product_id of 3984
-- Top 3 is Fashion with product_id of 2785

-- Monthly Revenue --
select date_format(order_date, '%Y-%m') as month,
		round(sum(discounted_price * quantity_sold),3) as total_revenue
from amazon_sales.amazon_sales
group by month
order by month;

-- Top 3 Monthly Revenue --
select date_format(order_date, '%Y-%m') as month,
		round(sum(discounted_price * quantity_sold),3) as total_revenue
from amazon_sales.amazon_sales
group by month
order by total_revenue desc
limit 3;
-- First: January 2023, second: August 2022, third: July 2023

-- Revenue Growth (Month over Month) --
select month,
		total_revenue,
		round(total_revenue) - lag(round(total_revenue)) over (order by month) as revenue_change
from (
    select date_format(order_date, '%Y-%m') as month,
           round(sum(discounted_price * quantity_sold),3) as total_revenue
    from amazon_sales.amazon_sales
    group by month
) t;
-- Export into CSV file to create visualization for both total_revenue (line chart) and revenue_change (waterfall chart)
-- Revenue_change (waterfall chart): fluctuate all over timeline, in general, there is huge fall in revenue until December 2023
-- Total_revenue (line chart): fluctuate, very weak postive trend-line relationship in general

-- Do Discount Rates on Items Increase Sold Quantity? --
select
    case
        when discount_percent = 0 then 'No Discount'
        else 'Discounted'
    end as discount_group,
    avg(quantity_sold) as avg_quantity
from amazon_sales.amazon_sales
group by discount_group;
-- Discounted (3.00) and No Discount are almost the same => Discount rates may not affect the number of items sold

-- How About With Revenue? (Revenue With and Without Discount) --
select
    case 
        when discount_percent = 0 then 'No Discount'
        else 'Discounted'
    end as discount_group,
    round(avg(discounted_price * quantity_sold),3) as avg_revenue
from amazon_sales.amazon_sales
group by discount_group;
-- Discounted (639.3) < No Discount (749.033) => Discount rates may not affect the revenue
-- In general, initial aggregation suggests minimal difference in average quantity sold between discounted and non-discounted items 
-- so further segmentation by discount level and product category is required to assess price sensitivity

-- Revenue on Different Regions --
select customer_region,
		round(sum(total_revenue),3) as total_all_revenue
from amazon_sales.amazon_sales
group by customer_region
order by total_all_revenue desc;
-- Middle East is the most profit region that purchase from Amazon
-- Europe is the least profit region

-- Quantity Sold on Different Regions --
select customer_region,
       COUNT(quantity_sold) as total_quantity_sold
from amazon_sales.amazon_sales
group by customer_region
order by total_quantity_sold desc;
-- Asia is the region that buy most items on Amazon
-- Europe is the region that buy least items on Amazon

-- Payment Methods on Different Regions --
select customer_region,
       payment_method,
       COUNT(order_id) as total_orders
from amazon_sales.amazon_sales
group by customer_region, payment_method
order by customer_region, total_orders desc;
-- Asia prefer using UPI and Wallet for the Amazon payment
-- Europe prefer using Debit Card and Wallet 
-- Middle East prefer using Cash on Delivery and Wallet
-- North America prefer using Wallet and UPI

-- Average Order Value by Region --
select customer_region,
       round(sum(discounted_price * quantity_sold) / count(order_id),3) as avg_order_value
from amazon_sales.amazon_sales
group by customer_region;
-- North America customers spend most on Amazon order
-- Middle East customers spend least on Amazon order

-- In conclusion: 
-- 1. Middle East makes the highest total revenue indicating strong overall monetary contribution. However, 
-- North America has the highest average order value, meaning customers in this region spend more per transaction. This suggests 
-- that while Middle East drives volume revenue, North America customers tend to place higher-value orders
-- 2. Asia leads in total quantity sold, showing the highest purchase volume. However, since it does not lead in revenue or average 
-- order value, this indicates that customers in Asia may purchase lower-priced items or smaller basket values per order
-- 3. Europe ranks lowest in both revenue and quantity sold, suggesting weaker market performance compared to other regions. 
-- This may indicate lower demand, lower spending power or less market penetration.

-- Do Higher Ratings Sell More? --
select rating,
		product_category,
		count(quantity_sold) as avg_units_sold
from amazon_sales.amazon_sales
group by rating, product_category
order by rating DESC;

-- Correlation Proxy (Rating vs Revenue Trend) --
select 
    case 
		when rating >= 4 then 'High Rating'
		else 'Low Rating'
    end as rating_group,
    round(sum(discounted_price * quantity_sold),3) as total_revenue
from amazon_sales.amazon_sales
group by rating_group;
-- Amazon revenue from high rating is less than low rating
-- I will check if there are more low-rated products than high-rated ones
select 
    case 
        when rating >= 4 then 'High Rating'
        else 'Low Rating'
    end as rating_group,
    count(*) as total_rows
from amazon_sales.amazon_sales
group by rating_group;
-- More low rating rows so it will explain more about the differences in revenue
-- I will check with Average 
select 
    case 
		when rating >= 4 then 'High Rating'
		else 'Low Rating'
    end as rating_group,
    round(avg(discounted_price * quantity_sold),3) as avg_revenue
from amazon_sales.amazon_sales
group by rating_group;
-- High-rated items are more than low-rated items so, in general, high-rated items perform better individually while low-rated items are just 
-- have more volume


