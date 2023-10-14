--can only see his own record with id and password masked
SELECT * FROM SYSTEM.CUSTOMER;

--can only update his own record
UPDATE SYSTEM.CUSTOMER SET customer_contact = '123456' where username = 'johnDoe';
UPDATE SYSTEM.CUSTOMER SET customer_contact = '123456' where username = 'NOTjohnDoe';

--with no privilege
SELECT * FROM SYSTEM.DRIVER;

--with no privilege
SELECT * FROM SYSTEM.AGENT;

--with no privilege
SELECT * FROM SYSTEM.MANAGER;

--can only see records related to him with ids and driver_earned masked
SELECT * FROM SYSTEM.BOOKING;

--can only see records related to him with ids masked
SELECT * FROM SYSTEM.FEEDBACK;

--select SYS_CONTEXT('IDENTIFIER', 'user_type'), SYS_CONTEXT('customer_ctx', 'customer_id') from dual;

--join booking and feedback with ids masked and output necessary infos
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