/*
FUNCTION >>> SQL COMMAND USED TO MANIPULATE (NUMERICAL, DATE, OR STRING) DATA

TO_CHAR >>> RETURNS A CHARACTER STRING OR A FORMATTED STRING FROM A DATE VALUE
            TO_CHAR(DATE_VALUE, FORMAT), WHERE FORMAT = (1) MONTH - FULL NAME OF 
            MONTH; (2) MON - THREE LETTER ABBREVIATION FOR MONTH; (3) MM - TWO 
            DIGIT MONTH NUMBER; (4) D - NUMBER OF DAY OF WEEK; (5) DD - NUMBER OF 
            DAY OF MONTH; (6) DAY - NAME OF DAY OF WEEK; (7) YYYY - FOUR DIGIT YEAR
            NUMBER; (8) YY - TWO DIGIT YEAR NUMBER
            
TO_DATE >>> RETURNS A DATE VALUE USING A CHARACTER STRING AND A DATE FORMAT MASK; ALSO
            USED TO TRANSLATE A DATE BETWEEN FORMATS
            TO_DATE(CHAR_VALUE, FORMAT), WHERE FORMAT = (1) MONTH - FULL NAME OF 
            MONTH; (2) MON - THREE LETTER ABBREVIATION FOR MONTH; (3) MM - TWO 
            DIGIT MONTH NUMBER; (4) D - NUMBER OF DAY OF WEEK; (5) DD - NUMBER OF 
            DAY OF MONTH; (6) DAY - NAME OF DAY OF WEEK; (7) YYYY - FOUR DIGIT YEAR
            NUMBER; (8) YY - TWO DIGIT YEAR NUMBER

SYSDATE >>> RETURN TODAY'S DATE

ADD_MONTHS >>> ADDS A NUMBER OF MONTHS OR YEARS TO A DATE
               ADD_MONTHS(DATE_VALUE, N), WHERE N = NUMBER OF MONTHS

LAST_DATE >>> RETURNS THE DATE OF THE LAST DAY OF THE MONTH GIVEN IN A DATE
              LAST_DAY(DATE_VALUE)
              
ABS >>> RETURNS THE ABSOLUTE VALUE OF A NUMBER
        ABS(NUMERIC_VALUE)
        
ROUND >>> ROUNDS A VALUE TO A SPECIFIED PRECISION (NUMBER OF DIGITS)
          ROUND(NUMERIC_VALUE, P), WHERE P = PRECISION
          
CEIL/FLOOR >>> RETURNS THE SMALLEST INTEGER GREATER THAN OR EQUAL TO A NUMBER OR 
               RETURNS THE LARGEST INTEGER EQUAL TO OR LESS THAN A NUMBER, 
               RESPECTIVELY CEIL(NUMERIC_VALUE) OR FLOOR(NUMERIC_VALUE)
         
CONCATENATION >>> CONCATENATES DATA FROM TWO DIFFERENT CHARACTER COLUMNS
                  AND RETURNS A SINGLE COLUMN
                  STRING_VALUE || STRING_VALUE
                  
UPPER/LOWER >>> RETURNS A STRING IN ALL CAPITAL OR ALL LOWERCASE LETTERS
                UPPER(STRING_VALUE) OR LOWER(STRING)VALUE)
                
SUBSTRING >>> RETURNS A SUBSTRING OR PART OF A GIVEN STRING PARAMETER
              SUBSTR(STRING_VALUE, P, L) WHERE P = START POSITION, L = LENGTH OF CHARACTERS
              
LENGTH >>> RETURNS THE NUMBER OF CHARACTERS IN A STRING VALUE
           LENGTH(STRING_VALUE)
           
TO_CHAR >>> RETURNS A CHARACTER STRING FROM A NUMERIC OR DATE VALUE
            TO_CHAR(VALUE_TO_CONVERT, FORMAT), WHERE FORMAT = (1) 9 - DISPLAYS A DIGIT;
            (2) 0 - DISPLAYS A LEADING ZERO; (3) , - DISPLAYS THE COMMA; (4) . = DISPLAYS
            THE DECIMAL; (5) $ - DISPLAYS THE DOLLAR SIGN; (6) B - LEADING BLANK; (7) S -
            LEADING SIGN; (8) MI - TRAILING MINUS SIGN
            CAST(VALUE_TO_CONVERT AS CHAR(LENGTH))
            
TO_NUMBER >>> RETURNS A NUMBER FROM A CHARACTER STRING
              TO_NUMBER(CHAR_VALUE, FORMAT), WHERE FORMAT = (1) 9 - INDICATES A DIGIT;
              (2) B - LEADING BLANK; (3) S - LEADING SIGN; (4) MI - TRAILING MINUS SIGN
              CAST(VALUE_TO_CONVERT AS NUMERIC_DATA_TYPE)
              
DECODE >>> COMPARES AN ATTRIBUTE OR EXPRESSION WITH A SERIES OF VALUES AND RETURNS 
           AN ASSOCIATED VALUE OR A DEFAULT VALUE IF NO MATCH IS FOUND
           DECODE(E, X, Y, D), WHERE E = ATTRIBUTE/EXPRESSION; X = VALUE WITH WHICH TO COMPARE E
           Y = VALUE TO RETURN IN E=X; D = DEFAULT VALUE TO RETURN IF E IS NOT EQUAL TO X
           CASE WHEN CONDITION THEN VALUE1 ELSE VALUE2 END
*/

SELECT P_CODE, P_INDATE
FROM PRODUCT
WHERE TO_CHAR(P_INDATE, 'YYYY') = '2015';

SELECT P_CODE, P_INDATE
FROM PRODUCT
WHERE TO_CHAR(P_INDATE, 'MON') = 'DEC';

SELECT P_CODE, P_INDATE
FROM PRODUCT
WHERE TO_CHAR(P_INDATE, 'DD') = '24';

SELECT P_CODE, P_INDATE
FROM PRODUCT
WHERE P_INDATE = TO_DATE('2016/02/24', 'YYYY/MM/DD');

SELECT P_CODE, P_INDATE
FROM PRODUCT
WHERE P_INDATE = TO_DATE('FEB-24-2016', 'MON-DD-YYYY');

SELECT P_CODE, P_INDATE
FROM PRODUCT
WHERE P_INDATE <= SYSDATE;

SELECT P_CODE, P_INDATE, ADD_MONTHS(P_INDATE, 5) AS PLUS_5_MOS
FROM PRODUCT;

SELECT P_CODE, LAST_DAY(P_INDATE)
FROM PRODUCT;

SELECT P_PRICE-10000 AS DIFF_PRICE, ABS(P_PRICE - 10000) AS ABS_DIFF_PRICE
FROM PRODUCT;

SELECT P_PRICE/99 AS DIV_PRICE, ROUND(P_PRICE/99, 2) AS RND_DIV_PRICE
FROM PRODUCT;

SELECT P_PRICE, CEIL(P_PRICE), FLOOR(P_PRICE)
FROM PRODUCT;

SELECT VENDOR.V_NAME || ' - ' || PRODUCT.P_DESCRIPT AS TITLE
FROM PRODUCT, VENDOR
WHERE PRODUCT.V_CODE = VENDOR.V_CODE;

SELECT UPPER(P_DESCRIPT) AS PROD_UPPER, LOWER(P_DESCRIPT) AS PROD_LOWER
FROM PRODUCT;

SELECT P_CODE, P_DESCRIPT, SUBSTR(P_DESCRIPT, 1, 3) AS FIRST_3_CHAR
FROM PRODUCT;

SELECT P_CODE, P_DESCRIPT, LENGTH(P_DESCRIPT) AS DESCRIPT_SIZE
FROM PRODUCT;

SELECT P_CODE, TO_CHAR(P_PRICE, '999.99') AS PRICE, 
    TO_CHAR(P_INDATE, 'MM/DD/YYYY') AS INDATE, 
    TO_CHAR(P_DISCOUNT, '0.99') AS DISC
FROM PRODUCT;

SELECT P_CODE, CAST(P_PRICE AS VARCHAR(8)) AS PRICE,
    CAST(P_INDATE AS VARCHAR(20)) AS INDATE,
    CAST(P_DISCOUNT AS VARCHAR(4)) AS DISC
FROM PRODUCT;   

SELECT V_CODE, V_STATE, DECODE(V_STATE, 'CA', .08, 'FL', .05, 'TN', .085, 0.00) AS TAX
FROM VENDOR;

SELECT V_CODE, V_STATE,
CASE WHEN V_STATE = 'CA' THEN .08
     WHEN V_STATE = 'FL' THEN .05
     WHEN V_STATE = 'TN' THEN .085
     ELSE 0.00 
END AS TAX
FROM VENDOR;     