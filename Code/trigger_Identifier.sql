-- Create application context
CREATE OR REPLACE CONTEXT IDENTIFIER USING IDENTIFIER_CTX_PKG;

-- Create a PL/SQL package to set the application context
CREATE OR REPLACE PACKAGE IDENTIFIER_CTX_PKG IS
    PROCEDURE SET_IDENTITY_CUSTOMER;
    PROCEDURE SET_IDENTITY_DRIVER;
    PROCEDURE SET_IDENTITY_AGENT;
    PROCEDURE SET_IDENTITY_MANAGER;
END;
/

CREATE OR REPLACE PACKAGE BODY IDENTIFIER_CTX_PKG IS
    PROCEDURE SET_IDENTITY_CUSTOMER AS
    BEGIN 
        DBMS_SESSION.SET_CONTEXT('IDENTIFIER', 'user_type', 'customer');
    END SET_IDENTITY_CUSTOMER;

    PROCEDURE SET_IDENTITY_DRIVER AS
    BEGIN
        DBMS_SESSION.SET_CONTEXT('IDENTIFIER', 'user_type', 'driver');
    END SET_IDENTITY_DRIVER;

    PROCEDURE SET_IDENTITY_AGENT AS
    BEGIN
        DBMS_SESSION.SET_CONTEXT('IDENTIFIER', 'user_type', 'agent');
    END SET_IDENTITY_AGENT;

    PROCEDURE SET_IDENTITY_MANAGER AS
    BEGIN
        DBMS_SESSION.SET_CONTEXT('IDENTIFIER', 'user_type', 'manager');
    END SET_IDENTITY_MANAGER;
END IDENTIFIER_CTX_PKG;
/