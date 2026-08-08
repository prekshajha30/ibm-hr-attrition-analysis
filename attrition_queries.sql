-- IBM HR Attrition Analysis — SQL Practice
-- Full dataset (1,470 records) analyzed and visualized in Tableau: https://public.tableau.com/authoring/IBMHRAttritionAnalysis_17862102796690/IBMHRAttritionAnalysis#1
-- This file uses a 40-row sample of the same dataset to demonstrate 
-- SQL querying (joins, aggregations, conditional logic) at a scale 
-- practical for manual entry in an online SQL editor.
CREATE TABLE attrition (
  EmployeeNumber INT,
  Department VARCHAR(50),
  Attrition VARCHAR(5),
  MonthlyIncome INT,
  YearsAtCompany INT,
  OverTime VARCHAR(5)
);


INSERT INTO attrition VALUES
(1, 'Sales', 'Yes', 5993, 6, 'Yes'),
(2, 'Research & Development', 'No', 5130, 10, 'No'),
(3, 'Research & Development', 'Yes', 2090, 0, 'Yes'),
(4, 'Research & Development', 'No', 2909, 8, 'Yes'),
(5, 'Research & Development', 'No', 3419, 1, 'Yes'),
(6, 'Sales', 'No', 10239, 1, 'No'),
(7, 'Sales', 'No', 9739, 9, 'No'),
(8, 'Sales', 'Yes', 2325, 0, 'No'),
(9, 'Sales', 'Yes', 3140, 4, 'Yes'),
(10, 'Research & Development', 'No', 3690, 3, 'No'),
(11, 'Research & Development', 'No', 6553, 1, 'No'),
(12, 'Research & Development', 'No', 6261, 7, 'No'),
(13, 'Research & Development', 'No', 4298, 2, 'No'),
(14, 'Research & Development', 'No', 6804, 7, 'Yes'),
(15, 'Research & Development', 'No', 3815, 5, 'Yes'),
(16, 'Research & Development', 'No', 2741, 7, 'Yes'),
(17, 'Research & Development', 'Yes', 6673, 1, 'Yes'),
(18, 'Sales', 'Yes', 7639, 10, 'No'),
(19, 'Research & Development', 'No', 2328, 4, 'Yes'),
(20, 'Research & Development', 'No', 2153, 8, 'No'),
(21, 'Research & Development', 'No', 4876, 3, 'No'),
(22, 'Research & Development', 'No', 9396, 4, 'No'),
(23, 'Sales', 'Yes', 10400, 14, 'No'),
(24, 'Research & Development', 'No', 8474, 11, 'No'),
(25, 'Sales', 'No', 9981, 7, 'No'),
(26, 'Research & Development', 'No', 12490, 10, 'No'),
(27, 'Research & Development', 'Yes', 2657, 5, 'Yes'),
(28, 'Sales', 'No', 13591, 1, 'Yes'),
(29, 'Sales', 'Yes', 6696, 6, 'No'),
(30, 'Research & Development', 'Yes', 2058, 6, 'No'),
(31, 'Sales', 'No', 8865, 19, 'No'),
(32, 'Sales', 'No', 5940, 6, 'No'),
(33, 'Research & Development', 'No', 5914, 13, 'No'),
(34, 'Research & Development', 'No', 2622, 3, 'No'),
(35, 'Research & Development', 'No', 12185, 10, 'Yes'),
(36, 'Sales', 'No', 10609, 16, 'No'),
(37, 'Research & Development', 'No', 4345, 5, 'No'),
(38, 'Research & Development', 'No', 2177, 1, 'No'),
(39, 'Sales', 'No', 2793, 9, 'No'),
(40, 'Sales', 'No', 7918, 11, 'No');

-- Q1: Attrition by Department
-- Groups employees by department and attrition status, counts how many fall in each group
-- Mirrors the Tableau "Attrition by Department" chart
SELECT Department, Attrition, COUNT(*) AS employee_count
FROM attrition
GROUP BY Department, Attrition;

-- Q2: Average Income by Attrition
-- Compares average monthly income between employees who left vs stayed
-- ROUND() is used to avoid messy decimals in the output
SELECT Attrition, ROUND(AVG(MonthlyIncome), 0) AS avg_income
FROM attrition
GROUP BY Attrition;

-- Q3: Attrition by Tenure Bucket
-- CASE WHEN creates custom groups (buckets) since YearsAtCompany is a continuous number
-- This mirrors what "bins" did in Tableau, but done manually in SQL
SELECT 
  CASE 
    WHEN YearsAtCompany <= 3 THEN '0-3 years'
    WHEN YearsAtCompany <= 6 THEN '3-6 years'
    ELSE '6+ years'
  END AS tenure_bucket,
  Attrition, COUNT(*) AS employee_count
FROM attrition
GROUP BY tenure_bucket, Attrition;

-- Q4: Attrition by OverTime Status
-- Simple group-by showing whether working overtime correlates with leaving
SELECT OverTime, Attrition, COUNT(*) AS employee_count
FROM attrition
GROUP BY OverTime, Attrition;

CREATE TABLE department_info (
  Department VARCHAR(50),
  Location VARCHAR(50)
);

INSERT INTO department_info VALUES
('Sales', 'Building A'),
('Research & Development', 'Building B'),
('Human Resources', 'Building A');

-- JOIN — Attrition by Department Location
-- Combines two tables (attrition + department_info) using JOIN
-- ON specifies the shared column (Department) used to match rows between tables
SELECT a.Department, a.Attrition, d.Location, COUNT(*) AS employee_count
FROM attrition a
JOIN department_info d ON a.Department = d.Department
GROUP BY a.Department, a.Attrition, d.Location;