SELECT Default_Status, COUNT(*) AS def_count
FROM loan_default
GROUP BY Default_Status;



SELECT Loan_Purpose, COUNT(*) AS cnt_loan
FROM loan_default
WHERE Default_Status=1
GROUP BY Loan_Purpose
ORDER BY cnt_loan DESC;


SELECT Employment_Type, 
       COUNT(Client_ID) AS total_customers,
       SUM(CASE WHEN Default_Status=1 THEN 1 ELSE 0 END) AS defaulted_customers
FROM loan_default
GROUP BY Employment_Type;



SELECT
  CASE 
    WHEN Credit_Score BETWEEN 300 AND 450 THEN '300-450'
    WHEN Credit_Score BETWEEN 451 AND 600 THEN '451-600'
    WHEN Credit_Score BETWEEN 601 AND 750 THEN '601-750'
    ELSE '751-900'
  END AS credit_range,
  COUNT(Client_ID) AS total_customers,
  SUM(CASE WHEN Default_Status=1 THEN 1 ELSE 0 END) AS defaulted_customers
FROM loan_default
GROUP BY credit_range;




SELECT
  CASE
    WHEN Income BETWEEN 20000 AND 50000 THEN '20,000-50,000'
    WHEN Income BETWEEN 51000 AND 80000 THEN '51,000-80,000'
    WHEN Income BETWEEN 81000 AND 100000 THEN '81,000-1,00,000'
    WHEN Income BETWEEN 100001 AND 130000 THEN '1,00,001-1,30,000'
    WHEN Income BETWEEN 131000 AND 150000 THEN '1,31,000-1,50,000'
    ELSE '1,50,001 and above'
  END AS income_range,
  COUNT(Client_ID) AS total_customers,
  SUM(CASE WHEN Default_Status=1 THEN 1 ELSE 0 END) AS defaulted_customers
FROM loan_default
GROUP BY income_range
ORDER BY MIN(Income);



SELECT
  CASE
    WHEN Loan_Amount BETWEEN 50000 AND 200000 THEN '50,000-2,00,000'
    WHEN Loan_Amount BETWEEN 200001 AND 400000 THEN '2,00,001-4,00,000'
    WHEN Loan_Amount BETWEEN 400001 AND 600000 THEN '4,00,001-6,00,000'
    WHEN Loan_Amount BETWEEN 600001 AND 900000 THEN '6,00,001-9,00,000'
    ELSE '9,00,001 and above'
  END AS loan_amount_range,
  COUNT(Client_ID) AS total_customers,
  SUM(CASE WHEN Default_Status=1 THEN 1 ELSE 0 END) AS defaulted_customers
FROM loan_default
GROUP BY loan_amount_range
ORDER BY MIN(Loan_Amount);




