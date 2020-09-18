/*
PROCEDURAL LANGUAGE SQL (PL/SQL) >>> ORACLE-SPECIFIC PROGRAMMING LANGUAGE BASED ON SQL WITH 
                                     PROCEDURAL EXTENSIONS DESIGNED TO RUN INSIDE THE ORACLE 
                                     DATABASE
                                     
ANONYMOUS PL/SQL BLOCKS >>> A PL/SQL BLOCK THAT HAS NOT BEEN GIVEN A SPECIFIC NAME

BEGIN
    INSERT INTO table VALUES(list of values);
END;

DECLARE variables
BEGIN
WHILE condition LOOP
    SELECT columns
    FROM tables
    WHERE conditions;
END LOOP;
END;
*/

BEGIN
    INSERT INTO VENDOR VALUES(25772, 'Clue Store', 'Issac Hayes', '456', '323-2009', 'VA', 'N');
    DBMS_OUTPUT.PUT_LINE('New Vendor Added!');
END;

DECLARE
W_P1 NUMBER(3) := 0;
W_P2 NUMBER(3) := 10;
W_NUM NUMBER(2) := 0;
BEGIN
WHILE W_P2 < 300 LOOP
    SELECT COUNT(P_CODE) INTO W_NUM FROM PRODUCT
    WHERE P_PRICE BETWEEN W_P1 AND W_P2;
    DBMS_OUTPUT.PUT_LINE('There are ' || W_NUM || ' Products with price between ' || W_P1 || ' and ' || W_P2);
    W_P1 := W_P2 + 1;
    W_P2 := W_P2 + 50;
END LOOP;
END;