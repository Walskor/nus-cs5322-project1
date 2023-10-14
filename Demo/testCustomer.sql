SELECT * FROM SYSTEM.CUSTOMER;

SELECT * FROM SYSTEM.DRIVER;

SELECT * FROM SYSTEM.AGENT;

SELECT * FROM SYSTEM.MANAGER;


SELECT 
    feedback_id, 
    booking_id, 
    c.username, 
    driver_id, 
    rating, 
    comments, 
    time 
FROM 
    SYSTEM.FEEDBACK f left join system.customer c on f.customer_id = c.customer_id;
/

SELECT 
    feedback_id, 
    f.booking_id as booking_id, 
    c.username, 
    d.username, 
    rating, 
    comments, 
    time 
FROM 
    SYSTEM.FEEDBACK f left join SYSTEM.Booking b on f.booking_id=b.booking_id
    left join system.customer c on b.customer_id = c.customer_id 
    left join system.driver d  on b.driver_id = d.driver_id;
/