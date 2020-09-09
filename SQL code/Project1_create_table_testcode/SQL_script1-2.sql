/* This is a practice scrip using SQL */

/* This code builds a table with some variables, then we insert some data, later we select all the columns.
Then we select some particular columns, later on we update the city of instructor 1. To conclude we delete a particular row*/

DROP table INSTRUCTOR;

CREATE table INSTRUCTOR  (
			ins_id INTEGER PRIMARY KEY NOT NULL,
			lastname VARCHAR(15),
			firstname VARCHAR(15),
			city VARCHAR(15),
			country CHAR(2)
		);



INSERT INTO INSTRUCTOR
	VALUES  ( 1, 'Ahuja', 'Raj', 'Toronto', 'CA');

INSERT INTO INSTRUCTOR
 		VALUES			( 2, 'Chong', 'Raul', 'Toronto', 'CA'),
								( 3, 'Vasudevan', 'Hima', 'Chicago', 'US');


SELECT * FROM INSTRUCTOR;

SELECT FIRSTNAME, CITY, COUNTRY FROM INSTRUCTOR
				WHERE CITY = 'Toronto';
				
/* The syntaxis distinguish capital letters. For instance, if we write 'TORONTO' the last line of code does not work*/

UPDATE INSTRUCTOR
                SET CITY = 'Markham' WHERE INS_ID = 1;
                
 DELETE FROM INSTRUCTOR 
 		WHERE INS_ID = 2;
 		
 SELECT * FROM INSTRUCTOR;
 
 		
                
