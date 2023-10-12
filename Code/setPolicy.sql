CREATE OR REPLACE FUNCTION GET_CUSTOMER(
    SCHEMA_P IN VARCHAR2,
    TABLE_P IN VARCHAR2
) RETURN VARCHAR2 AS
    condition VARCHAR2 (400);
BEGIN
    IF SYS_CONTEXT('IDENTITY', 'user_type') = 'customer'
        THEN condition := 'customer_id = SYS_CONTEXT(''IDENTITY'', ''user_id'')';
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

--drop policy if needed
BEGIN
    DBMS_RLS.DROP_POLICY (
        OBJECT_SCHEMA => 'system',
        OBJECT_NAME => 'Customer',
        POLICY_NAME => 'GET_CUSTOMER_POLICY'
    );
END;
/

BEGIN
    DBMS_REDACT.DROP_POLICY (
        OBJECT_SCHEMA => 'system',
        OBJECT_NAME => 'Customer',
        POLICY_NAME => 'mask_password'
    );
END;
/

BEGIN
    DBMS_RLS.ADD_POLICY (
        OBJECT_SCHEMA => 'system',
        OBJECT_NAME => 'Customer',
        POLICY_NAME => 'GET_CUSTOMER_POLICY',
        POLICY_FUNCTION => 'GET_CUSTOMER',
        STATEMENT_TYPES => 'select',
        POLICY_TYPE => DBMS_RLS.CONTEXT_SENSITIVE
    );
END;
/

BEGIN
   DBMS_REDACT.ADD_POLICY(
     object_schema        => 'system',
     object_name          => 'Customer',
     column_name          => 'password',
     policy_name          => 'mask_password',
     function_type        => DBMS_REDACT.FULL,
     expression           => '1=1');
END;
/

--add more than one policy on one table
BEGIN
   DBMS_REDACT.ALTER_POLICY(
     object_schema          => 'system',
     object_name            => 'Customer',
     policy_name            => 'mask_password',
     column_name            => 'customer_id',
     function_type        => DBMS_REDACT.FULL,
     expression           => '1=1');
END;
/



