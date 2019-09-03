show databases;

--- means ust the mysql db and read from the user table
select * from mysql.user;

-- select the user and host col fm user table
select user, host FROM mysql.user;

-- select all col fm help_topic
SELECT * FROM mysql.help_topic;

-- not sure what this is - selects help topic, category and url
SELECT help_topic_id, help_category_id, url FROM mysql.help_topic;