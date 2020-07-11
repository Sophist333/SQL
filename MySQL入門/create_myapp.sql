# comment
-- comment
/*
comment
comment
comment
*/

drop database if exists myapp;
create database myapp;

#myappのすべてのテーブルの権限をmyapp_user@localhostに与える
grant all on myapp.* to myapp_user@localhost identified by '2VNAh1go';
