/* 1. Display the PNAME and COLOR from the P table for the 
CITY=”London”.*/
SELECT Pname ,color FROM p
WHERE city = 'London'; 
+-------+-------+
| Pname | color |
+-------+-------+
| Nut   | Red   |
| Screw | Red   |
| Cog   | Red   |
+-------+-------+

/* 2. Display all the Suppliers from London.*/
SELECT * FROM p
WHERE CITY = 'London';
+----+-------+-------+--------+--------+
| P# | Pname | color | weight | city   |
+----+-------+-------+--------+--------+
| P1 | Nut   | Red   |     12 | London |
| P4 | Screw | Red   |     14 | London |
| P6 | Cog   | Red   |     19 | London |
+----+-------+-------+--------+--------+

/* 3. Display all the Suppliers from Paris or Athens.*/
SELECT * FROM p
WHERE CITY = 'Paris' OR CITY = 'Athens';
+----+-------+-------+--------+-------+
| P# | Pname | color | weight | city  |
+----+-------+-------+--------+-------+
| P2 | Bolt  | Green |     17 | Paris |
| P5 | Cam   | Blue  |     12 | Paris |
+----+-------+-------+--------+-------+

/* 4. Display all the Jobs in Athens.*/
SELECT * FROM j
WHERE City = 'Athens';
+----+---------+--------+
| J# | Jname   | City   |
+----+---------+--------+
| J3 | Reader  | Athens |
| J4 | Console | Athens |
+----+---------+--------+

/* 5. Display all the Part names with the weight between 12 and 14 
(inclusive of both).*/
SELECT Pname FROM p
WHERE WEIGHT BETWEEN 12 AND 14;
+-------+
| Pname |
+-------+
| Nut   |
| Screw |
| Cam   |
+-------+

/* 6. Display all the Suppliers with a Status greater than or equal
to 20.*/
SELECT * FROM sp 
where QTY >= 20;
+----+----+----+------+
| S# | P# | J# | QTY  |
+----+----+----+------+
| S1 | P1 | J1 |  200 |
| S1 | P1 | J4 |  700 |
| S2 | P3 | J1 |  400 |
| S2 | P3 | J2 |  200 |
| S2 | P3 | J3 |  200 |
| S2 | P3 | J4 |  500 |
| S2 | P3 | J5 |  600 |
| S2 | P3 | J6 |  400 |
| S2 | P3 | J7 |  800 |
| S2 | P5 | J2 |  100 |
| S3 | P3 | J1 |  200 |
| S3 | P4 | J2 |  500 |
| S4 | P6 | J3 |  300 |
| S4 | P6 | J7 |  300 |
| S5 | P2 | J2 |  200 |
| S5 | P2 | J4 |  100 |
| S5 | P5 | J5 |  500 |
| S5 | P5 | J7 |  100 |
| S5 | P6 | J2 |  200 |
| S5 | P1 | J4 |  100 |
| S5 | P3 | J4 |  200 |
| S5 | P4 | J4 |  800 |
| S5 | P5 | J4 |  400 |
| S5 | P6 | J4 |  500 |
+----+----+----+------+

/* 7. Display all the Suppliers except the Suppliers from London.*/
SELECT * FROM s
WHERE city = 'London';
+----+-------+--------+--------+
| S# | Sname | status | city   |
+----+-------+--------+--------+
| S1 | Smith |     20 | London |
| S4 | Clark |     20 | London |
+----+-------+--------+--------+

/* 8. Display only the Cities from where the Suppliers come from*/
SELECT DISTINCT city FROM s;
+--------+
| city   |
+--------+
| London |
| Paris  |
| Athens |
+--------+

/* 9. Display the Supplier table in the descending order of CITY.*/
SELECT * FROM s
ORDER BY city DESC;
| S# | Sname | status | city   |
+----+-------+--------+--------+
| S2 | Jones |     10 | Paris  |
| S3 | Blake |     30 | Paris  |
| S1 | Smith |     20 | London |
| S4 | Clark |     20 | London |
| S5 | Adams |     30 | Athens |
+----+-------+--------+--------+

/* 10. Display the Part Table in the ascending order of CITY and 
within the city in the ascending order of Part names.*/
SELECT * FROM p
ORDER BY city ASC ,Pname ASC;
+----+-------+-------+--------+--------+
| P# | Pname | color | weight | city   |
+----+-------+-------+--------+--------+
| P6 | Cog   | Red   |     19 | London |
| P1 | Nut   | Red   |     12 | London |
| P4 | Screw | Red   |     14 | London |
| P2 | Bolt  | Green |     17 | Paris  |
| P5 | Cam   | Blue  |     12 | Paris  |
| P3 | Screw | Blue  |     17 | Rome   |
+----+-------+-------+--------+--------+

/* 11. Display all the Suppliers with a status between 10 and 20*/
SELECT * FROM s 
WHERE status BETWEEN 10 AND 20; 
+----+-------+--------+--------+
| S# | Sname | status | city   |
+----+-------+--------+--------+
| S1 | Smith |     20 | London |
| S2 | Jones |     10 | Paris  |
| S4 | Clark |     20 | London |
+----+-------+--------+--------+

/* 12. Display all the Parts and their Weight, which are not in the
range of 10 and 15.*/
SELECT Pname , weight FROM p
WHERE WEIGHT BETWEEN 10 AND 15;
+-------+--------+
| Pname | weight |
+-------+--------+
| Nut   |     12 |
| Screw |     14 |
| Cam   |     12 |
+-------+--------+