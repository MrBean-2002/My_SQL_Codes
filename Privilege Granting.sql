--create user
CREATE USER mia
WITH PASSWORD 'mia123';

--create role
CREATE ROLE analyst_emp;

--grant privileges
-- 1. selct
GRANT SELECT
ON ALL TABLES IN SCHEMA PUBLIC
TO analyst_emp;

--2. insert and dlelete
GRANT INSERT,UPDATE
ON employee
TO analyst_emp;

--permission to create databases on role
ALTER ROLE analyst_emp CREATEDB;

--Assign role to user
GRANT analyst_emp TO mia;






























































































