-- Create application context
CREATE OR REPLACE CONTEXT MANAGER_CTX USING MANAGER_CTX_PKG;

-- Create a PL/SQL package to set the application context
CREATE OR REPLACE PACKAGE MANAGER_CTX_PKG IS
    PROCEDURE SET_MANAGER_ID;
END;
/

CREATE OR REPLACE PACKAGE BODY MANAGER_CTX_PKG IS
    PROCEDURE SET_MANAGER_ID AS
        MANAGER_ID NUMBER;
    BEGIN
        SELECT
            MANAGER_ID INTO MANAGER_ID
        FROM
            SYSTEM.MANAGER
        WHERE
            lower(USERNAME) = lower(SYS_CONTEXT('USERENV',
            'SESSION_USER'));
        DBMS_SESSION.SET_CONTEXT('manager_ctx', 'manager_id', MANAGER_ID);
        IDENTIFIER_CTX_PKG.SET_IDENTITY_MANAGER;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            NULL;
    END SET_MANAGER_ID;
END MANAGER_CTX_PKG;
/

-- Create a logon trigger to run the application context PL/SQL package
CREATE OR REPLACE TRIGGER SET_MANAGER_CTX_TRIG AFTER LOGON ON DATABASE
BEGIN
    MANAGER_CTX_PKG.SET_MANAGER_ID;
END;
/


-- Test this trigger 
SELECT SYS_CONTEXT('manager_ctx', 'manager_id') AS MANAGER_id,
       SYS_CONTEXT('IDENTIFIER', 'user_type') AS identifier
FROM DUAL;
/

-- Used to delete the context trigger (use only when needed)
DROP TRIGGER SET_MANAGER_CTX_TRIG;