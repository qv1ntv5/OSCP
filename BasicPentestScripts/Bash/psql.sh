-----------------------------------
#Connect to the service

psql -h <IP> -p 5432 -U <username>
# if the service is internal, IP=localhost.

-----------------------------------
#PostgreSQL DBMS enumeration.

username=# \l <--- List databases.
username=# \c <database> <--- Connect to database in order to use it.
database=# \dt <--- List tables in database.
database=# select * from <table>; <--- Dump table content.
