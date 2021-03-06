/*
UNION >>> COMBINES ROWS FROM TWO OR MORE QUERIES WITHOUT INCLUDING
          DUPLICATE ROWS
          QUERY UNION QUERY

UNION ALL >>> COMBINES ROWS FROM TWO OR MORE QUERIES AND INCLUDES
              DUPLICATE ROWS
              QUERY UNION ALL QUERY
              
INTERSECT >>> COMBINES ROWS FROM TWO QUERIES, RETURNING ONLY THE ROWS 
              THAT APPEAR IN BOTH SETS
              QUERY INTERSECT QUERY
              
EXCEPT (MINUS) >>> COMBINES ROWS FROM TWO QUERIES AND RETURNS ONLY THE 
                   ROWS THAT APPEAR IN THE FIRST SET BUT NOT IN THE SECOND SET
                   QUERY EXCEPT QUERY
*/

SELECT CUS_CODE
FROM CUSTOMER
UNION
SELECT CUS_CODE
FROM INVOICE;

SELECT CUS_CODE
FROM CUSTOMER
UNION ALL
SELECT CUS_CODE
FROM INVOICE;

SELECT CUS_CODE 
FROM CUSTOMER
WHERE CUS_AREACODE = '615'
INTERSECT
SELECT DISTINCT CUS_CODE
FROM INVOICE;

SELECT CUS_CODE
FROM CUSTOMER
MINUS
SELECT CUS_CODE
FROM INVOICE;