CREATE DATABASE wordpress;
CREATE USER 'ael-hadd'@'%' IDENTIFIED BY 'kemosabe';
GRANT ALL PRIVILEGES ON wordpress.* TO 'ael-hadd'@'%';
FLUSH PRIVILEGES;

ALTER USER 'root'@'localhost' IDENTIFIED BY 'voldemort';