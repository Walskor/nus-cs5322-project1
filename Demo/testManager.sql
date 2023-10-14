SELECT * FROM SYSTEM.CUSTOMER;

SELECT * FROM SYSTEM.DRIVER;

SELECT * FROM SYSTEM.AGENT;

SELECT * FROM SYSTEM.MANAGER;

SELECT * FROM SYSTEM.BOOKING;

--select SYS_CONTEXT('IDENTIFIER', 'user_type'), SYS_CONTEXT('manager_ctx', 'manager_id') from dual;

--join booking and feedback with nothing masked and output necessary infos
SELECT 
    feedback_id, 
    f.booking_id as booking_id, 
    b.customer_name,
    b.driver_name,
    rating, 
    comments, 
    time 
FROM 
    SYSTEM.FEEDBACK f left join SYSTEM.Booking b on f.booking_id=b.booking_id
/