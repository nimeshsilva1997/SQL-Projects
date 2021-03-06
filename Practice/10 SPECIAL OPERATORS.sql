/*
SPECIAL OPERATORS:
BETWEEN >>> USED TO CHECK WHETHER A VALUE IS WITHIN A RANGE

IS NULL >>> USED TO CHECK WHETHER AN ATTRIBUTE HAS A VALUE

LIKE >>> USED TO CHECK WHETHER AN ATTRIBUTE'S TEXT VALUE
MATCHES A SPECIFIED STRING PATTERN

IN >>> USED TO CHECK WHETHER A VALUE IS AMONG A LIST OF 
SPECIFIED VALUES

EXISTS >>> USED TO CHECK WHETHER A SUBQUERY RETURNS ANY ROWS
*/

SELECT *
FROM PRODUCT
WHERE P_PRICE BETWEEN 50.00 AND 100.00;

SELECT *
FROM PRODUCT
WHERE V_CODE IS NULL;

SELECT *
FROM PRODUCT
WHERE P_INDATE IS NULL;

SELECT *
FROM VENDOR
WHERE V_CONTACT LIKE 'Smith%';

SELECT *
FROM VENDOR
WHERE V_CONTACT LIKE 'SMITH%';

SELECT * 
FROM VENDOR
WHERE UPPER(V_CONTACT) LIKE 'SMITH%';

SELECT *
FROM VENDOR
WHERE V_CONTACT NOT LIKE 'Smith%';

SELECT *
FROM VENDOR
WHERE V_CONTACT LIKE 'Flu%ng';

SELECT *
FROM PRODUCT
WHERE V_CODE IN (21225, 21228);

SELECT *
FROM PRODUCT
WHERE P_CODE IN ('BRT-345', '13-Q2/P2', '1546-QQ2', 'WER-0293');

SELECT * 
FROM VENDOR
WHERE V_CODE IN (SELECT V_CODE FROM PRODUCT);

SELECT * 
FROM VENDOR
WHERE EXISTS (SELECT * FROM PRODUCT WHERE P_QOH <= P_MIN);

SELECT *
FROM VENDOR 
WHERE EXISTS (SELECT * FROM PRODUCT WHERE P_QOH < P_MIN * 2);