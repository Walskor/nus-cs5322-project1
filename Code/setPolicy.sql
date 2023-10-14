CREATE OR REPLACE FUNCTION Is_Customer RETURN BOOLEAN IS
BEGIN
    -- To check whether current user is a 'customer'
    IF SYS_CONTEXT('IDENTIFIER', 'user_type') = 'customer' THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END Is_Customer;
/

CREATE OR REPLACE FUNCTION Is_Driver RETURN BOOLEAN IS
BEGIN
    -- To check whether current user is a 'driver'
    IF SYS_CONTEXT('IDENTIFIER', 'user_type') = 'driver' THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END Is_Driver;
/

CREATE OR REPLACE FUNCTION Is_Manager RETURN BOOLEAN IS
BEGIN
    -- To check whether current user is a 'manager'
    IF SYS_CONTEXT('IDENTIFIER', 'user_type') = 'manager' THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END Is_Manager;
/
-- ---------------------------------------------------------
--                  Customer Table
-- ---------------------------------------------------------

CREATE OR REPLACE FUNCTION GET_CUSTOMER(
    SCHEMA_P IN VARCHAR2,
    TABLE_P IN VARCHAR2
) RETURN VARCHAR2 AS
    condition VARCHAR2 (400);
BEGIN
    IF SYS_CONTEXT('IDENTIFIER', 'user_type') = 'customer'
        THEN condition := 'customer_id = SYS_CONTEXT(''customer_ctx'', ''customer_id'')';
    ELSIF SYS_CONTEXT('IDENTIFIER', 'user_type') = 'driver'
        THEN condition := '1=0';
    ELSIF SYS_CONTEXT('IDENTIFIER', 'user_type') = 'agent'
        THEN NULL;
    ELSIF SYS_CONTEXT('IDENTIFIER', 'user_type') = 'manager'
        THEN NULL;
    END IF;
    RETURN condition;
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

-- Mask Password in Customer for all Users

BEGIN
   DBMS_REDACT.ADD_POLICY(
     object_schema        => 'system',
     object_name          => 'Customer',
     column_name          => 'password',
     policy_name          => 'mask_Customer',
     function_type        => DBMS_REDACT.FULL,
     expression           => '1=1');
END;
/


--Add more than one policy on one table: Mask ID for all Users except Managers
BEGIN
   DBMS_REDACT.ALTER_POLICY(
     object_schema          => 'system',
     object_name            => 'Customer',
     policy_name            => 'mask_Customer',
     column_name            => 'customer_id',
     function_type        => DBMS_REDACT.FULL,
     expression           => 'SYS_CONTEXT(''IDENTIFIER'', ''user_type'') = ''manager''');
END;
/

-- For some reason, the expression in the last statement does not work, so Create another expression to apply.
BEGIN
   DBMS_REDACT.CREATE_POLICY_EXPRESSION(
     policy_expression_name          => 'only_manager_can_see',
     expression                      => 'SYS_CONTEXT(''IDENTIFIER'', ''user_type'') != ''manager''');
END;
/

BEGIN
   DBMS_REDACT.APPLY_POLICY_EXPR_TO_COL(
      object_schema           => 'system',
      object_name             => 'Customer',
      column_name             => 'customer_id',
      policy_expression_name  => 'only_manager_can_see');
END;
/

-- ---------------------------------------------------------
--                  Driver Table
-- ---------------------------------------------------------
CREATE OR REPLACE FUNCTION GET_DRIVER(
    SCHEMA_P IN VARCHAR2,
    TABLE_P IN VARCHAR2
) RETURN VARCHAR2 AS
    condition VARCHAR2 (400);
BEGIN
    IF SYS_CONTEXT('IDENTIFIER', 'user_type') = 'customer'
        THEN condition := '1=0';
    ELSIF SYS_CONTEXT('IDENTIFIER', 'user_type') = 'driver'
        THEN condition := 'driver_id = SYS_CONTEXT(''driver_ctx'', ''driver_id'')';
    ELSIF SYS_CONTEXT('IDENTIFIER', 'user_type') = 'agent'
        THEN NULL;
    ELSIF SYS_CONTEXT('IDENTIFIER', 'user_type') = 'manager'
        THEN NULL;
    END IF;
    RETURN condition;
END;
/

BEGIN
    DBMS_RLS.ADD_POLICY (
        OBJECT_SCHEMA => 'system',
        OBJECT_NAME => 'Driver',
        POLICY_NAME => 'GET_DRIVER_POLICY',
        POLICY_FUNCTION => 'GET_DRIVER',
        STATEMENT_TYPES => 'select',
        POLICY_TYPE => DBMS_RLS.CONTEXT_SENSITIVE
    );
END;
/
-- Mask Password in Driver for all User

BEGIN
   DBMS_REDACT.ADD_POLICY(
     object_schema        => 'system',
     object_name          => 'Driver',
     column_name          => 'password',
     policy_name          => 'mask_Driver',
     function_type        => DBMS_REDACT.FULL,
     expression           => '1=1');
END;
/

--Add more than one policy on one table: Mask ID for all Users except Managers
BEGIN
   DBMS_REDACT.ALTER_POLICY(
     object_schema          => 'system',
     object_name            => 'Driver',
     policy_name            => 'mask_Driver',
     column_name            => 'driver_id',
     function_type        => DBMS_REDACT.FULL);
END;
/

BEGIN
   DBMS_REDACT.APPLY_POLICY_EXPR_TO_COL(
      object_schema           => 'system',
      object_name             => 'Driver',
      column_name             => 'driver_id',
      policy_expression_name  => 'only_manager_can_see');
END;
/
-- ---------------------------------------------------------
--                  Agent Table
-- ---------------------------------------------------------
CREATE OR REPLACE FUNCTION GET_AGENT(
    SCHEMA_P IN VARCHAR2,
    TABLE_P IN VARCHAR2
) RETURN VARCHAR2 AS
    condition VARCHAR2 (400);
BEGIN
    IF SYS_CONTEXT('IDENTIFIER', 'user_type') = 'customer'
        THEN condition := '1=0';
    ELSIF SYS_CONTEXT('IDENTIFIER', 'user_type') = 'driver'
        THEN condition := '1=0';
    ELSIF SYS_CONTEXT('IDENTIFIER', 'user_type') = 'agent'
        THEN condition := 'agent_id = SYS_CONTEXT(''agent_ctx'', ''agent_id'')';
    ELSIF SYS_CONTEXT('IDENTIFIER', 'user_type') = 'manager'
        THEN NULL;
    END IF;
    RETURN condition;
END;
/

BEGIN
    DBMS_RLS.ADD_POLICY (
        OBJECT_SCHEMA => 'system',
        OBJECT_NAME => 'Driver',
        POLICY_NAME => 'GET_AGENT_POLICY',
        POLICY_FUNCTION => 'GET_AGENT',
        STATEMENT_TYPES => 'select',
        POLICY_TYPE => DBMS_RLS.CONTEXT_SENSITIVE
    );
END;
/

-- Mask Password in Agent for all User

BEGIN
   DBMS_REDACT.ADD_POLICY(
     object_schema        => 'system',
     object_name          => 'Agent',
     column_name          => 'password',
     policy_name          => 'mask_password',
     function_type        => DBMS_REDACT.FULL,
     expression           => '1=1');
END;
/
-- ---------------------------------------------------------
--                  Manager Table
-- ---------------------------------------------------------


-- Mask Password in Manager for all User

BEGIN
   DBMS_REDACT.ADD_POLICY(
     object_schema        => 'system',
     object_name          => 'Manager',
     column_name          => 'password',
     policy_name          => 'mask_password',
     function_type        => DBMS_REDACT.FULL,
     expression           => '1=1');
END;
/
-- ---------------------------------------------------------
--                  Booking Table
-- ---------------------------------------------------------



-- ---------------------------------------------------------
--                  Feedback Table
-- ---------------------------------------------------------
