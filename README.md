# amazon_sales_analysis

## 📊 Amazon Sales Analysis 

## 📌 Project Overview

This project analyzes an Amazon sales dataset using MySQL to explore regional performance, customer behavior, pricing strategy, and revenue trends. The objective is to extract actionable business insights using structured query language and analytical reasoning.

The analysis focuses on revenue distribution, sales volume, payment preferences, discount effectiveness, rating impact and time-based revenue growth.


## 🗂 Dataset Description

The dataset contains transactional and product-level information, including:

* Order details such as order ID and order date
* Product information including category, price, discount percent, and discounted price
* Sales metrics such as quantity sold
* Customer attributes including region and payment method
* Product feedback metrics including rating and review count

The combination allows for multi-dimensional analysis across geography, pricing strategy and customer behavior.



# 🔎 Analysis Conducted

## 1️⃣ Regional Revenue Performance

Revenue was aggregated by customer region to identify which markets contribute the most financially.

### Key Findings

* The Middle East generates the highest total revenue.
* Europe generates the lowest total revenue.

This suggests that the Middle East is a strong revenue-driving market, while Europe may require further strategic attention to improve performance.



## 2️⃣ Sales Volume by Region

Total quantity sold was analyzed to compare purchasing volume across regions.

### Key Findings

* Asia has the highest sales volume.
* Europe has the lowest sales volume.

Although Asia leads in volume, it does not generate the highest revenue. This indicates that customers in Asia may purchase lower-priced products or have lower average order values compared to other regions.


## 3️⃣ Payment Method Preferences by Region

Payment behavior was segmented by region to understand consumer preferences.

### Key Findings

* Asia prefers UPI and digital wallets.
* Europe favors debit cards and wallets.
* The Middle East frequently uses cash on delivery and wallets.
* North America primarily uses wallets and UPI.

These variations highlight the importance of localized payment strategies. Adapting payment options to regional preferences can improve customer satisfaction and conversion rates.



## 4️⃣ Average Order Value by Region

Average order value was calculated to evaluate spending behavior per transaction.

### Key Findings

* North America has the highest average order value.
* Middle East has the lowest average order value.

This indicates that North American customers tend to spend more per order, even if they do not generate the highest total revenue overall.



## 5️⃣ Discount Impact on Sales Volume

Products were grouped into discounted and non-discounted categories to evaluate whether discounts significantly increase purchase quantity.

### Key Findings

Average quantity sold between discounted and non-discounted products was nearly identical.

This suggests that discounting may not strongly influence purchase quantity in this dataset. Further segmentation by discount level or product category may provide deeper insights into price sensitivity.



## 6️⃣ Rating Impact on Revenue

Products were grouped into high-rating and low-rating categories to analyze revenue contribution.

### Key Findings

Lower-rated products generated higher total revenue compared to higher-rated products.

This may indicate:

* A larger number of lower-rated products in the dataset
* High-demand products receiving mixed reviews
* Ratings not being the primary driver of revenue

This finding suggests that customer ratings alone may not determine commercial performance.



## 7️⃣ Monthly Revenue Trend and Growth

Monthly revenue trends were analyzed to observe time-based performance and calculate month-over-month revenue changes.

### Key Insights

* Revenue trends can be tracked over time.
* Month-over-month growth provides insight into business momentum.
* Window functions were used to calculate revenue changes between consecutive months.





# 📈 Overall Business Insights

* Asia drives the highest sales volume.
* Middle East generates the highest total revenue.
* North America shows the highest spending per transaction.
* Europe underperforms in both revenue and volume.
* Payment preferences differ significantly across regions.
* Discounts show minimal impact on average quantity sold.
* Higher product ratings do not necessarily result in higher total revenue.

These findings suggest that regional strategies, pricing policies and payment customization are critical for maximizing performance.



# 🛠 Skills Demonstrated

* Data aggregation and grouping
* Conditional segmentation using CASE logic
* Revenue and behavioral analysis
* Regional market comparison
* Time-series trend evaluation
* Business-oriented data interpretation



# 🎯 Project Purpose

This project demonstrates the ability to:

* Translate raw transactional data into business insights
* Apply SQL to real-world analytical scenarios
* Identify patterns across geography, pricing and customer behavior
* Present findings in a structured, business-focused format


