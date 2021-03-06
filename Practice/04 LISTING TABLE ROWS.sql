/*
SELECT >>> COMMAND THAT YIELDS THE VALUES OF ALL ROWS OR
A SUBSET OF ROWS IN A TABLE; USED TO RETRIEVE DATA FROM TABLES

FROM >>> CLAUSE THAT SPECIFIES THE TABLE(S) FROM WHICH DATA IS 
TO BE RETRIEVED

WILDCARD >>> SYMBOL THAT CAN BE USED AS A GENERAL SUBSTITUTE FOR
ALL COLUMNS IN A TABLE (*) WHEN USED IN AN ATTRIBUTE LIST OF
A SELECT STATEMENT

SELECT column1, column2, column3
FROM table;

SELECT *
FROM table;

NOTE THE ASTERISK (*) IS USED AS A WILDCARD TO BRING BACK ALL OF 
THE COLUMNS IN A TABLE WITHOUT HAVING TO LIST EACH INDIVIDUALLY
*/

SELECT * 
FROM PRODUCT;

SELECT P_CODE, P_DESCRIPTION, P_INDATE, P_QOH, P_MIN, P_PRICE, P_DISCOUNT, V_CODE
FROM PRODUCT;