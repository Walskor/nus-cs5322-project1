-- Create application context
CREATE OR REPLACE CONTEXT AGENT_CTX USING AGENT_CTX_PKG;

-- Create a PL/SQL package to set the application context
CREATE OR REPLACE PACKAGE AGENT_CTX_PKG IS
    PROCEDURE SET_AGENT_ID;
END;
/

CREATE OR REPLACE PACKAGE BODY AGENT_CTX_PKG IS
    PROCEDURE SET_AGENT_ID AS
        AGENT_ID NUMBER;
    BEGIN
        SELECT
            AGENT_ID INTO AGENT_ID
        FROM
            SYSTEM.AGENT
        WHERE
            lower(USERNAME) = lower(SYS_CONTEXT('USERENV',
            'SESSION_USER'));
        DBMS_SESSION.SET_CONTEXT('agent_ctx', 'agent_id', AGENT_ID);
        IDENTIFIER_CTX_PKG.SET_IDENTITY_AGENT;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            NULL;
    END SET_AGENT_ID;
END AGENT_CTX_PKG;
/

-- Create a logon trigger to run the application context PL/SQL package
CREATE TRIGGER SET_AGENT_CTX_TRIG AFTER LOGON ON DATABASE
BEGIN
    AGENT_CTX_PKG.SET_AGENT_ID;
END;
/


-- Test this trigger 
SELECT SYS_CONTEXT('agent_ctx', 'agent_id') AS AGENT_id,
       SYS_CONTEXT('USERENV', 'IDENTITFIER') AS identifier
FROM DUAL;
/

-- Used to delete the context trigger (use only when needed)
DROP TRIGGER SET_AGENT_CTX_TRIG;