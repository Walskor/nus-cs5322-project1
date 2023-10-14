--drop policy if needed

-- ---------------------------------------------------------
--                  Customer Table
-- ---------------------------------------------------------
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
        POLICY_NAME => 'mask_Customer'
    );
END;
/

-- ---------------------------------------------------------
--                  Driver Table
-- ---------------------------------------------------------
BEGIN
    DBMS_RLS.DROP_POLICY (
        OBJECT_SCHEMA => 'system',
        OBJECT_NAME => 'Driver',
        POLICY_NAME => 'GET_DRIVER_POLICY'
    );
END;
/

BEGIN
    DBMS_REDACT.DROP_POLICY (
        OBJECT_SCHEMA => 'system',
        OBJECT_NAME => 'Driver',
        POLICY_NAME => 'mask_Driver'
    );
END;
/


-- ---------------------------------------------------------
--                  Agent Table
-- ---------------------------------------------------------
BEGIN
    DBMS_RLS.DROP_POLICY (
        OBJECT_SCHEMA => 'system',
        OBJECT_NAME => 'Agent',
        POLICY_NAME => 'GET_AGENT_POLICY'
    );
END;
/

BEGIN
    DBMS_REDACT.DROP_POLICY (
        OBJECT_SCHEMA => 'system',
        OBJECT_NAME => 'Agent',
        POLICY_NAME => 'mask_Agent'
    );
END;
/


-- ---------------------------------------------------------
--                  Manager Table
-- ---------------------------------------------------------
BEGIN
    DBMS_RLS.DROP_POLICY (
        OBJECT_SCHEMA => 'system',
        OBJECT_NAME => 'Manager',
        POLICY_NAME => 'GET_MANAGER_POLICY'
    );
END;
/

BEGIN
    DBMS_REDACT.DROP_POLICY (
        OBJECT_SCHEMA => 'system',
        OBJECT_NAME => 'Manager',
        POLICY_NAME => 'mask_Manager'
    );
END;
/


-- ---------------------------------------------------------
--                  Booking Table
-- ---------------------------------------------------------



-- ---------------------------------------------------------
--                  Feedback Table
-- ---------------------------------------------------------
BEGIN
    DBMS_RLS.DROP_POLICY (
        OBJECT_SCHEMA => 'system',
        OBJECT_NAME => 'Feedback',
        POLICY_NAME => 'GET_FEEDBACK_POLICY'
    );
END;
/

BEGIN
    DBMS_REDACT.DROP_POLICY (
        OBJECT_SCHEMA => 'system',
        OBJECT_NAME => 'Feedback',
        POLICY_NAME => 'mask_Feedback'
    );
END;
/