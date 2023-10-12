create context IDENTITY using set_user_context;

create or replace procedure set_user_context(user_type in varchar, user_id in number) as
begin
  dbms_session.set_context('IDENTITY', 'user_type', user_type);
  dbms_session.set_context('IDENTITY', 'user_id', user_id);
end;
/

exec set_user_context('customer', 6);

select sys_context('IDENTITY', 'user_type'),  sys_context('IDENTITY', 'user_id') from dual;

exec set_user_context('driver', 7);

select sys_context('IDENTITY', 'user_type'),  sys_context('IDENTITY', 'user_id') from dual;
