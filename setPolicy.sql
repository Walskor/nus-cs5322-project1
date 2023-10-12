CREATE OR REPLACE FUNCTION GET_CUSTOMER(
    SCHEMA_P IN VARCHAR2,
    TABLE_P IN VARCHAR2
) RETURN VARCHAR2 AS
    condition VARCHAR2 (400);
BEGIN
    IF SYS_CONTEXT('IDENTITY', 'user_type') = 'customer'
        THEN condition := 'customer_id = SYS_CONTEXT("IDENTITY", "user_id")';
    ELSIF SYS_CONTEXT('IDENTITY', 'user_type') = 'driver'
        THEN condition := '1=0';
    ELSIF SYS_CONTEXT('IDENTITY', 'user_type') = 'agent'
        THEN NULL;
    ELSIF SYS_CONTEXT('IDENTITY', 'user_type') = 'admin'
        THEN NULL;
    END IF;
    RETURN condition;
END;
/

BEGIN
    DBMS_RLS.ADD_POLICY (
        OBJECT_SCHEMA => 'system',
        OBJECT_NAME => 'CUSTOMER',
        POLICY_NAME => 'GET_CUSTOMER_POLICY',
        POLICY_FUNCTION => 'GET_CUSTOMER',
        STATEMENT_TYPES => 'select',
        POLICY_TYPE => DBMS_RLS.CONTEXT_SENSITIVE
    );
END;
/