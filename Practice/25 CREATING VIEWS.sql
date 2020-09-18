/*
CREATE VIEW >>> COMMAND THAT CREATES A LOGICAL (VIRTUAL) TABLE

CREATE VIEW view AS
    SELECT column1, column2, column3
    FROM table
    WHERE conditions;

);
*/

CREATE VIEW PRICEGT50 AS
    SELECT P_DESCRIPT, P_QOH, P_PRICE
    FROM PRODUCT
    WHERE P_PRICE > 50;
    
SELECT *
FROM PRICEGT50;

SELECT * 
FROM PRICEGT50
WHERE P_QOH > 8;

CREATE VIEW PROD_STATS AS
    SELECT V_CODE, SUM(P_QOH*P_PRICE) AS TOTCOST, MAX(P_QOH) AS MAXQTY, MIN(P_QOH) AS MINQTY, AVG(P_QOH) AS AVGQTY
    FROM PRODUCT
    GROUP BY V_CODE;
    
SELECT * 
FROM PROD_STATS;