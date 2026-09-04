/*1. Write a query that uses a subquery to obtain all orders for the customer named Cisneros. Assume you do not know his customer cnum*/
select * from orders
where snum = (select snum from customers where cname = 'Cisneros');
+------+---------+------------+------+------+
| onum | amt     | odate      | cnum | snum |
+------+---------+------------+------+------+
| 3001 |   18.69 | 1990-10-03 | 2008 | 1007 |
| 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
+------+---------+------------+------+------+

/* 2. Write a query that will find all salespeople who have no customers 
located in their city. (Hint: Choose the correct keyword ANY/ALL).*/
select * from salespeople
where city <> ALL (select city from customers);
+------+---------+-----------+------+
| snum | sname   | city      | comm |
+------+---------+-----------+------+
| 1007 | Rifkin  | Barcelona | 0.15 |
| 1003 | Axelrod | New York  | 0.10 |
+------+---------+-----------+------+

/* 3. Extract all the orders of Motika.*/
select * from orders
where snum = (select snum from salespeople where sname = 'Motika');
+------+---------+------------+------+------+
| onum | amt     | odate      | cnum | snum |
+------+---------+------------+------+------+
| 3002 | 1900.10 | 1990-10-03 | 2007 | 1004 |
+------+---------+------------+------+------+

/* 4. Find all the orders of salespeople servicing customers in London.*/
select * from orders
where snum = ANY (select snum from customers where city = 'London');
+------+---------+------------+------+------+
| onum | amt     | odate      | cnum | snum |
+------+---------+------------+------+------+
| 3003 |  767.19 | 1990-10-03 | 2001 | 1001 |
| 3008 | 4723.00 | 1990-10-04 | 2006 | 1001 |
| 3011 | 9891.88 | 1990-10-04 | 2006 | 1001 |
+------+---------+------------+------+------+

/* 5. Find names and numbers of all salesperson who have more than one 
customer. */
select snum,sname from salespeople
where snum =ANY( select snum from customers group by snum having count(snum)>1); 
+------+--------+
| snum | sname  |
+------+--------+
| 1001 | Peel   |
| 1002 | Serres |
+------+--------+

/* 6. Select customers who have a greater rating than any other customer in 
Rome.*/
select * from customers
where rating > ANY (select rating from customers where city = 'Rome');
+------+----------+----------+--------+------+
| cnum | cname    | city     | rating | snum |
+------+----------+----------+--------+------+
| 2002 | Giovanni | Rome     |    200 | 1003 |
| 2003 | Liu      | San Jose |    200 | 1002 |
| 2004 | Grass    | Berlin   |    300 | 1002 |
| 2008 | Cisneros | San Jose |    300 | 1007 |
+------+----------+----------+--------+------+

/* 7. Select all orders that had amounts that were greater than at least one 
of the orders from ‘1990-10-04’.*/
select * from orders
where amt > ANY (select amt from orders where odate = '1990-10-04');
+------+---------+------------+------+------+
| onum | amt     | odate      | cnum | snum |
+------+---------+------------+------+------+
| 3003 |  767.19 | 1990-10-03 | 2001 | 1001 |
| 3002 | 1900.10 | 1990-10-03 | 2007 | 1004 |
| 3005 | 5160.45 | 1990-10-03 | 2003 | 1002 |
| 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
| 3009 | 1713.23 | 1990-10-04 | 2002 | 1003 |
| 3008 | 4723.00 | 1990-10-04 | 2006 | 1001 |
| 3010 |  309.95 | 1990-10-04 | 2004 | 1002 |
| 3011 | 9891.88 | 1990-10-04 | 2006 | 1001 |
+------+---------+------------+------+------+

/* 8.Select those customers whose rating are higher than every customer in 
London. */
select * from customers
where rating > ALL (select rating from customers where city = 'London');
+------+----------+----------+--------+------+
| cnum | cname    | city     | rating | snum |
+------+----------+----------+--------+------+
| 2002 | Giovanni | Rome     |    200 | 1003 |
| 2003 | Liu      | San Jose |    200 | 1002 |
| 2004 | Grass    | Berlin   |    300 | 1002 |
| 2008 | Cisneros | San Jose |    300 | 1007 |
+------+----------+----------+--------+------+



