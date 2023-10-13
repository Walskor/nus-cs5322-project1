-- Create application context
CREATE OR REPLACE CONTEXT CUSTOMER_CTX USING CUSTOMER_CTX_PKG;

-- Create a PL/SQL package to set the application context
CREATE OR REPLACE PACKAGE CUSTOMER_CTX_PKG IS
    PROCEDURE SET_CUSTOMER_ID;
END;
/

CREATE OR REPLACE PACKAGE BODY CUSTOMER_CTX_PKG IS
    PROCEDURE SET_CUSTOMER_ID AS
        CUSTOMER_ID NUMBER;
    BEGIN
        SELECT
            CUSTOMER_ID INTO CUSTOMER_ID
        FROM
            SYSTEM.CUSTOMER
        WHERE
            lower(USERNAME) = lower(SYS_CONTEXT('USERENV',
            'SESSION_USER'));
        DBMS_SESSION.SET_CONTEXT('customer_ctx', 'customer_id', CUSTOMER_ID);
        IDENTIFIER_CTX_PKG.SET_IDENTITY_CUSTOMER;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            NULL;
    END SET_CUSTOMER_ID;
END CUSTOMER_CTX_PKG;
/

-- Create a logon trigger to run the application context PL/SQL package
CREATE OR REPLACE TRIGGER SET_CUSTOMER_CTX_TRIG AFTER LOGON ON DATABASE
BEGIN
    CUSTOMER_CTX_PKG.SET_CUSTOMER_ID;
END;
/


-- Test this trigger 
SELECT SYS_CONTEXT('customer_ctx', 'customer_id') AS CUSTOMER_id,
       SYS_CONTEXT('USERENV', 'IDENTITFIER') AS identifier
FROM DUAL;
/

-- Used to delete the context trigger (use only when needed)
DROP TRIGGER SET_CUSTOMER_CTX_TRIG;