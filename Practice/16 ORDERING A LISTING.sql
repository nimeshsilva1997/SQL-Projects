/*
ORDER BY >>> CLAUSE USED TO ORDER THE OUTPUT OF A
SELECT QUERY IN EITHER ASCENDING (ASC) OR DESCENDING 
(DESC) ORDER

SELECT columns
FROM table
WHERE condition
ORDER BY columns ASC;

SELECT columns
FROM table
WHERE condition
ORDER BY columns DESC;
*/

SELECT P_CODE, P_DESCRIPTION, P_QOH, P_PRICE
FROM PRODUCT
ORDER BY P_PRICE;

SELECT P_CODE, P_DESCRIPTION, P_INDATE, P_PRICE
FROM PRODUCT
ORDER BY P_PRICE DESC;

SELECT *
FROM CUSTOMER
ORDER BY C_LNAME, C_FNAME;

SELECT *
FROM PRODUCT
WHERE P_INDATE < TO_DATE('21-JAN-2016', 'DD-MON-YYYY')
AND P_PRICE <= 50.00
ORDER BY V_CODE, P_PRICE DESC;