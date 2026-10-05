# GLOBAL SUPERSTORE BUSINESS ANALYSIS

# SQL Analysis File

# Database: SQLite

# Table: Global_Superstore2

---

## -- 1. OVERALL BUSINESS KPIs

SELECT
ROUND(SUM(Sales), 2) AS Total_Sales,
ROUND(SUM(Profit), 2) AS Total_Profit,
COUNT(DISTINCT "Order ID") AS Total_Orders,
SUM(Quantity) AS Total_Quantity,
ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM Global_Superstore2;

---

## -- 2. YEARLY SALES AND PROFIT

SELECT
CAST(substr("Order Date", 7, 4) AS INTEGER) AS Year,
ROUND(SUM(Sales), 2) AS Total_Sales,
ROUND(SUM(Profit), 2) AS Total_Profit,
ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM Global_Superstore2
GROUP BY Year
ORDER BY Year;

---

## -- 3. MONTHLY SALES AND PROFIT

SELECT
CASE substr("Order Date", 4, 2)
WHEN '01' THEN 'January'
WHEN '02' THEN 'February'
WHEN '03' THEN 'March'
WHEN '04' THEN 'April'
WHEN '05' THEN 'May'
WHEN '06' THEN 'June'
WHEN '07' THEN 'July'
WHEN '08' THEN 'August'
WHEN '09' THEN 'September'
WHEN '10' THEN 'October'
WHEN '11' THEN 'November'
WHEN '12' THEN 'December'
END AS Month,
ROUND(SUM(Sales), 2) AS Total_Sales,
ROUND(SUM(Profit), 2) AS Total_Profit
FROM Global_Superstore2
GROUP BY substr("Order Date", 4, 2)
ORDER BY substr("Order Date", 4, 2);

---

## -- 4. CATEGORY PERFORMANCE

SELECT
Category,
ROUND(AVG(Discount) * 100, 2) AS Average_Discount_Percent,
ROUND(SUM(Sales), 2) AS Total_Sales,
ROUND(SUM(Profit), 2) AS Total_Profit,
ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM Global_Superstore2
GROUP BY Category
ORDER BY Total_Profit DESC;

---

## -- 5. REGION × CATEGORY PERFORMANCE

SELECT
Region,
Category,
ROUND(SUM(Sales), 2) AS Total_Sales,
ROUND(SUM(Profit), 2) AS Total_Profit,
ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM Global_Superstore2
GROUP BY Region, Category
ORDER BY Region, Total_Profit DESC;

---

## -- 6. PRODUCT PROFITABILITY

SELECT
"Product Name",
ROUND(SUM(Sales), 2) AS Total_Sales,
ROUND(SUM(Profit), 2) AS Total_Profit,
SUM(Quantity) AS Total_Quantity,
ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM Global_Superstore2
GROUP BY "Product Name"
ORDER BY Total_Profit ASC
LIMIT 10;

---

## -- 7. PRODUCTS WITH HIGHEST PROFIT

SELECT
"Product Name",
ROUND(SUM(Sales), 2) AS Total_Sales,
ROUND(SUM(Profit), 2) AS Total_Profit,
SUM(Quantity) AS Total_Quantity,
ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM Global_Superstore2
GROUP BY "Product Name"
ORDER BY Total_Profit DESC
LIMIT 10;

---

## -- 8. PRODUCTS WITH LOWEST PROFIT / LOSSES

SELECT
"Product Name",
ROUND(SUM(Sales), 2) AS Total_Sales,
ROUND(SUM(Profit), 2) AS Total_Profit,
SUM(Quantity) AS Total_Quantity,
ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM Global_Superstore2
GROUP BY "Product Name"
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC
LIMIT 10;

---

## -- 9. DISCOUNT VS PROFIT

SELECT
"Product Name",
ROUND(AVG(Discount) * 100, 2) AS Average_Discount_Percent,
ROUND(SUM(Sales), 2) AS Total_Sales,
ROUND(SUM(Profit), 2) AS Total_Profit,
ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM Global_Superstore2
GROUP BY "Product Name"
ORDER BY Average_Discount_Percent DESC
LIMIT 10;

---

## -- 10. LOSS-MAKING PRODUCTS WITH DISCOUNT

SELECT
"Product Name",
ROUND(AVG(Discount) * 100, 2) AS Average_Discount_Percent,
ROUND(SUM(Sales), 2) AS Total_Sales,
ROUND(SUM(Profit), 2) AS Total_Profit,
ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM Global_Superstore2
GROUP BY "Product Name"
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC
LIMIT 10;

---

## -- 11. SHIPPING COST ANALYSIS

SELECT
"Product Name",
ROUND(SUM(Sales), 2) AS Total_Sales,
ROUND(SUM("Shipping Cost"), 2) AS Total_Shipping_Cost,
ROUND(SUM(Profit), 2) AS Total_Profit,
ROUND(SUM("Shipping Cost") / SUM(Sales) * 100, 2)
AS Shipping_Cost_Percent,
ROUND(SUM(Profit) / SUM(Sales) * 100, 2)
AS Profit_Margin_Percent
FROM Global_Superstore2
GROUP BY "Product Name"
ORDER BY Total_Shipping_Cost DESC
LIMIT 10;

---

## -- 12. CUSTOMER PERFORMANCE

SELECT
"Customer Name",
ROUND(SUM(Sales), 2) AS Total_Sales,
ROUND(SUM(Profit), 2) AS Total_Profit,
SUM(Quantity) AS Total_Quantity
FROM Global_Superstore2
GROUP BY "Customer Name"
ORDER BY Total_Sales DESC
LIMIT 10;

---

## -- 13. LOSS-MAKING REGIONS

SELECT
Region,
ROUND(SUM(Sales), 2) AS Total_Sales,
ROUND(SUM(Profit), 2) AS Total_Profit,
ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM Global_Superstore2
GROUP BY Region
ORDER BY Total_Profit ASC;

---

## -- 14. LOSS-MAKING REGION × CATEGORY

SELECT
Region,
Category,
ROUND(SUM(Sales), 2) AS Total_Sales,
ROUND(SUM(Profit), 2) AS Total_Profit,
ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM Global_Superstore2
GROUP BY Region, Category
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC;

---

## -- 15. CATEGORY WITH HIGHEST PROFIT MARGIN

SELECT
Category,
ROUND(SUM(Sales), 2) AS Total_Sales,
ROUND(SUM(Profit), 2) AS Total_Profit,
ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM Global_Superstore2
GROUP BY Category
ORDER BY Profit_Margin_Percent DESC;

---

## -- 16. TOP REGIONS BY PROFIT

SELECT
Region,
ROUND(SUM(Sales), 2) AS Total_Sales,
ROUND(SUM(Profit), 2) AS Total_Profit,
ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM Global_Superstore2
GROUP BY Region
ORDER BY Total_Profit DESC;

---

## -- 17. HIGH-DISCOUNT PRODUCTS

SELECT
"Product Name",
ROUND(AVG(Discount) * 100, 2) AS Average_Discount_Percent,
ROUND(SUM(Sales), 2) AS Total_Sales,
ROUND(SUM(Profit), 2) AS Total_Profit
FROM Global_Superstore2
GROUP BY "Product Name"
ORDER BY Average_Discount_Percent DESC
LIMIT 10;

---

## -- 18. HIGH SHIPPING COST PRODUCTS

SELECT
"Product Name",
ROUND(SUM("Shipping Cost"), 2) AS Total_Shipping_Cost,
ROUND(SUM(Sales), 2) AS Total_Sales,
ROUND(SUM(Profit), 2) AS Total_Profit
FROM Global_Superstore2
GROUP BY "Product Name"
ORDER BY Total_Shipping_Cost DESC
LIMIT 10;
