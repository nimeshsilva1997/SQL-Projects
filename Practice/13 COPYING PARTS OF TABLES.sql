/*
INSERT INTO target_table(target_columns)
SELECT source_columns
FROM source_table;
*/

CREATE TABLE PART(
    PT_CODE CHAR(8) PRIMARY KEY,
    PT_DESCRIPTION CHAR(35),
    PT_PRICE DECIMAL(8,2),
    V_CODE INTEGER);
    
INSERT INTO PART(PT_CODE, PT_DESCRIPTION, PT_PRICE, V_CODE)
SELECT P_CODE, P_DESCRIPTION, P_PRICE, V_CODE
FROM PRODUCT;

SELECT * FROM PART;