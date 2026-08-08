# IBM HR Attrition Analysis
HR employee attrition analysis using Tableau (full dataset) and MySQL (query practice) — identifying key drivers of attrition across department, tenure, income, and overtime.

## Overview
An analysis of the IBM HR Employee Attrition dataset, exploring what factors 
are associated with employees leaving the company. The project uses Tableau 
for visualization on the full dataset, and MySQL to demonstrate SQL querying 
on a representative sample.

## Tools Used
- **Tableau Public** — data visualization (full dataset)
- **MySQL** — querying practice (40-row sample)

## Dashboard (Full Dataset — 1,470 records)
🔗 [View the interactive dashboard on Tableau Public](https://public.tableau.com/authoring/IBMHRAttritionAnalysis_17862102796690/IBMHRAttritionAnalysis#1)

### Key Insights (from Tableau, full dataset)
- **Department**: Research & Development has the highest attrition in 
  absolute numbers, followed by Sales. Human Resources has the lowest.
- **Income**: Employees who left had a lower average monthly income (₹4,787) 
  than those who stayed (₹6,833) — a gap of nearly ₹2,000.
- **Tenure**: Attrition is heavily concentrated in the first 3–6 years, 
  dropping sharply after year 6.
- **Overtime**: Employees working overtime show a higher attrition rate 
  relative to their group size, despite being a smaller group overall.

## SQL Queries (Sample Dataset — 40 records)
📄 [attrition_queries.sql](./attrition_queries.sql)
🔗 [Live, runnable version on DB Fiddle](https://dbfiddle.uk/xof72UyO)

This file demonstrates SQL querying — `GROUP BY`, aggregate functions, 
`CASE WHEN` (for tenure bucketing), and `JOIN` (combining department and 
location data) — using a 40-row sample of the same dataset, chosen to keep 
manual data entry practical in an online SQL editor.

**Note:** Because this uses a smaller sample, exact figures in the SQL 
output (e.g., average income, department counts) will differ slightly from 
the Tableau numbers above, which reflect the full 1,470-record dataset. 
The underlying patterns — lower income and shorter tenure correlating with 
attrition — hold in both.

## Dataset Source
[IBM HR Analytics Employee Attrition Dataset](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset) 
— Kaggle
