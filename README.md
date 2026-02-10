# E-Commerce Sales & Customer Analytics Dashboard

## Overview
This project delivers an end-to-end analysis of e-commerce performance using SQL for data modeling and analysis and Power BI for interactive visualization. The objective is to evaluate revenue trends, customer behavior, and product performance to support data-driven business decisions.

## Objectives
- Design a structured relational database for e-commerce operations  
- Generate business KPIs using advanced SQL queries  
- Build an interactive Power BI dashboard for executive reporting  
- Derive actionable insights on revenue drivers and customer segments  

## Tech Stack
- SQL (MySQL) — data modeling, transformations, and analysis  
- Power BI — KPI dashboard and interactive reporting  
- Data Modeling — relational schema design  
- Business Analytics — performance measurement and insight generation  

## Data Model
The analysis is based on a relational schema including:
- Customers
- Orders
- Order_Items
- Products
- Cities

## Key Metrics
- Total Revenue
- Total Orders
- Active Customers
- Average Order Value
- Repeat Customers

## Dashboard Capabilities
- Monthly revenue trend analysis  
- Revenue distribution by city  
- Customer segmentation (High, Medium, Low value)  
- Top products by revenue  
- Interactive slicers (Product, City)

## Business Insights
- Study Table is the highest revenue-generating product.  
- Chennai contributes the largest share of total revenue.  
- Medium-value customers represent the dominant customer segment.

## Repository Structure

```text
ecommerce-sql-powerbi-analytics/
│
├── e-commerce_delivery_project
|
|
├── dataset/
│   └── sample_data.sql
│
├── sql/
│   ├── schema.sql
│   ├── data_insert.sql
│   ├── analysis_queries.sql
│   └── powerbi_queries.sql
│
├── powerbi/
│   └── Ecommerce_Dashboard.pbix
│
├── dashboard-preview/
│   └── dashboard_screenshot.png
|
├──sql/
|   ├── output_screenshots.png
│
└── README.md
```

## How to Use
1. Execute `schema.sql` to create database tables.  
2. Run `data_insert.sql` to populate sample data.  
3. Use `analysis_queries.sql` for business metrics.  
4. Open the Power BI file to explore the interactive dashboard.

## Author
Garima Sharma  
Business Analytics Enthusiast  
Focus: Data-driven decision making, product thinking, and performance analytics.
