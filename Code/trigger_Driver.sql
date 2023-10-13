-- Create application context
CREATE OR REPLACE CONTEXT DRIVER_CTX USING DRIVER_CTX_PKG;

-- Create a PL/SQL package to set the application context
CREATE OR REPLACE PACKAGE DRIVER_CTX_PKG IS
    PROCEDURE SET_DRIVER_ID;
END;
/

CREATE OR REPLACE PACKAGE BODY DRIVER_CTX_PKG IS
    PROCEDURE SET_DRIVER_ID AS
        DRIVER_ID NUMBER;
    BEGIN
        SELECT
            DRIVER_ID INTO DRIVER_ID
        FROM
            SYSTEM.DRIVER
        WHERE
            lower(USERNAME) = lower(SYS_CONTEXT('USERENV',
            'SESSION_USER'));
        DBMS_SESSION.SET_CONTEXT('driver_ctx', 'driver_id', DRIVER_ID);
        IDENTIFIER_CTX_PKG.SET_IDENTITY_DRIVER;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            NULL;
    END SET_DRIVER_ID;
END DRIVER_CTX_PKG;
/

-- Create a logon trigger to run the application context PL/SQL package
CREATE OR REPLACE TRIGGER SET_DRIVER_CTX_TRIG AFTER LOGON ON DATABASE
BEGIN
    DRIVER_CTX_PKG.SET_DRIVER_ID;
END;
/


-- Test this trigger 
SELECT SYS_CONTEXT('driver_ctx', 'driver_id') AS driver_id,
       SYS_CONTEXT('USERENV', 'IDENTITFIER') AS identifier
FROM DUAL;
/

-- Used to delete the context trigger (use only when needed)
DROP TRIGGER SET_DRIVER_CTX_TRIG;