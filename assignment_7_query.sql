/* 1. Write a query that lists each order number followed by the name of the 
customer who made the order. */

select c.cname , o.onum from customers c inner join orders o
ON c.cnum = o.cnum;
+----------+------+
| cname    | onum |
+----------+------+
| Cisneros | 3001 |
| Hoffman  | 3003 |
| Pereira  | 3002 |
| Liu      | 3005 |
| Cisneros | 3006 |
| Giovanni | 3009 |
| Grass    | 3007 |
| Clemens  | 3008 |
| Grass    | 3010 |
| Clemens  | 3011 |
+----------+------+

/* 2. Write a query that gives the names of both the salesperson and the 
customer for each order along with the order number.*/
select o.onum ,s.sname ,c.cname
    -> from salespeople s inner join customers c
    -> ON s.snum = c.snum
    -> inner join orders o
    -> ON s.snum = c.snum;
+------+---------+----------+
| onum | sname   | cname    |
+------+---------+----------+
| 3001 | Motika  | Pereira  |
| 3001 | Rifkin  | Cisneros |
| 3001 | Peel    | Clemens  |
| 3001 | Serres  | Grass    |
| 3001 | Serres  | Liu      |
| 3001 | Axelrod | Giovanni |
| 3001 | Peel    | Hoffman  |
| 3003 | Motika  | Pereira  |
| 3003 | Rifkin  | Cisneros |
| 3003 | Peel    | Clemens  |
| 3003 | Serres  | Grass    |
| 3003 | Serres  | Liu      |
| 3003 | Axelrod | Giovanni |
| 3003 | Peel    | Hoffman  |
| 3002 | Motika  | Pereira  |
| 3002 | Rifkin  | Cisneros |
| 3002 | Peel    | Clemens  |
| 3002 | Serres  | Grass    |
| 3002 | Serres  | Liu      |
| 3002 | Axelrod | Giovanni |
| 3002 | Peel    | Hoffman  |
| 3005 | Motika  | Pereira  |
| 3005 | Rifkin  | Cisneros |
| 3005 | Peel    | Clemens  |
| 3005 | Serres  | Grass    |
| 3005 | Serres  | Liu      |
| 3005 | Axelrod | Giovanni |
| 3005 | Peel    | Hoffman  |
| 3006 | Motika  | Pereira  |
| 3006 | Rifkin  | Cisneros |
| 3006 | Peel    | Clemens  |
| 3006 | Serres  | Grass    |
| 3006 | Serres  | Liu      |
| 3006 | Axelrod | Giovanni |
| 3006 | Peel    | Hoffman  |
| 3009 | Motika  | Pereira  |
| 3009 | Rifkin  | Cisneros |
| 3009 | Peel    | Clemens  |
| 3009 | Serres  | Grass    |
| 3009 | Serres  | Liu      |
| 3009 | Axelrod | Giovanni |
| 3009 | Peel    | Hoffman  |
| 3007 | Motika  | Pereira  |
| 3007 | Rifkin  | Cisneros |
| 3007 | Peel    | Clemens  |
| 3007 | Serres  | Grass    |
| 3007 | Serres  | Liu      |
| 3007 | Axelrod | Giovanni |
| 3007 | Peel    | Hoffman  |
| 3008 | Motika  | Pereira  |
| 3008 | Rifkin  | Cisneros |
| 3008 | Peel    | Clemens  |
| 3008 | Serres  | Grass    |
| 3008 | Serres  | Liu      |
| 3008 | Axelrod | Giovanni |
| 3008 | Peel    | Hoffman  |
| 3010 | Motika  | Pereira  |
| 3010 | Rifkin  | Cisneros |
| 3010 | Peel    | Clemens  |
| 3010 | Serres  | Grass    |
| 3010 | Serres  | Liu      |
| 3010 | Axelrod | Giovanni |
| 3010 | Peel    | Hoffman  |
| 3011 | Motika  | Pereira  |
| 3011 | Rifkin  | Cisneros |
| 3011 | Peel    | Clemens  |
| 3011 | Serres  | Grass    |
| 3011 | Serres  | Liu      |
| 3011 | Axelrod | Giovanni |
| 3011 | Peel    | Hoffman  |
+------+---------+----------+

/* 3. Write a query that produces all customers serviced by salespeople with a 
commission above 12%. Display the customer’s name, the salesperson’s 
name, and the salesperson’s rate of commission.*/

select c.cname,s.sname ,s.comm
from salespeople s inner join customers c
ON s.snum = c.snum
where s.comm > 0.12;
+----------+--------+------+
| cname    | sname  | comm |
+----------+--------+------+
| Liu      | Serres | 0.13 |
| Grass    | Serres | 0.13 |
| Cisneros | Rifkin | 0.15 |
+----------+--------+------+

/* 4. Write a query that calculates the commission earned by each 
salesperson for orders placed by customers with a rating above 100.*/
select distinct o.onum ,s.comm , round(s.comm * o.amt) as commision 
from salespeople s inner join customers c
ON s.snum = c.snum
inner join orders o 
ON s.snum = o.snum
where c.rating >100;
+------+------+-----------+
| onum | comm | commision |
+------+------+-----------+
| 3001 | 0.15 |         3 |
| 3005 | 0.13 |       671 |
| 3006 | 0.15 |       165 |
| 3009 | 0.10 |       171 |
| 3007 | 0.13 |        10 |
| 3010 | 0.13 |        40 |
+------+------+-----------+

/* 5. Write a query that produces all pairs of salespeople who are living in 
the same city. Exclude combinations of salespeople with themselves as 
well as duplicate rows with the order reversed.*/

SELECT s1.sname, s2.sname, s1.city
FROM salespeople s1
JOIN salespeople s2
ON s1.city = s2.city
AND s1.snum < s2.snum;
+-------+--------+--------+
| sname | sname  | city   |
+-------+--------+--------+
| Peel  | Motika | London |
+-------+--------+--------+

/* 1. Display the Supplier name and the Quantity sold. */
select s.sname ,SUM(sp.QTY) as qty_sold
from sp inner join s
ON s.`S#`=sp.`S#`
group by s.sname,sp.`s#`;

+-------+----------+
| sname | qty_sold |
+-------+----------+
| Smith |      900 |
| Jones |     3200 |
| Blake |      700 |
| Clark |      600 |
| Adams |     3100 |
+-------+----------+

/* 2. Display the Part name and Quantity sold. */
select p.pname,sum(sp.QTY)
from p inner join sp
ON p.`p#` = sp.`p#`
group by p.pname;
+-------+-------------+
| pname | sum(sp.QTY) |
+-------+-------------+
| Nut   |        1000 |
| Screw |        4800 |
| Cam   |        1100 |
| Cog   |        1300 |
| Bolt  |         300 |
+-------+-------------+

/* 3. Display the Job name and Quantity sold. */
select j.jname,sum(sp.QTY)
from j inner join sp
ON j.`j#` = sp.`j#`
group by j.jname;
+----------+-------------+
| jname    | sum(sp.QTY) |
+----------+-------------+
| Sorter   |         800 |
| Console  |        3300 |
| Punch    |        1200 |
| Reader   |         500 |
| Collator |        1100 |
| Terminal |         400 |
| Tape     |        1200 |
+----------+-------------+

/* 4. Display the Supplier name, Part name, Job name and Quantity sold.*/
select s.sname,p.pname,j.jname,sum(sp.QTY)
from sp inner join j
ON sp.`j#` = j.`j#`
inner join p
ON sp.`p#` = p.`p#`
inner join s
ON sp.`s#` = s.`s#`
group by s.sname,p.pname,j.jname;
+-------+-------+----------+-------------+
| sname | pname | jname    | sum(sp.QTY) |
+-------+-------+----------+-------------+
| Jones | Screw | Sorter   |         400 |
| Blake | Screw | Sorter   |         200 |
| Smith | Nut   | Sorter   |         200 |
| Adams | Cog   | Punch    |         200 |
| Jones | Cam   | Punch    |         100 |
| Blake | Screw | Punch    |         500 |
| Jones | Screw | Punch    |         200 |
| Adams | Bolt  | Punch    |         200 |
| Clark | Cog   | Reader   |         300 |
| Jones | Screw | Reader   |         200 |
| Adams | Cog   | Console  |         500 |
| Adams | Cam   | Console  |         400 |
| Adams | Screw | Console  |        1000 |
| Jones | Screw | Console  |         500 |
| Adams | Bolt  | Console  |         100 |
| Smith | Nut   | Console  |         700 |
| Adams | Nut   | Console  |         100 |
| Adams | Cam   | Collator |         500 |
| Jones | Screw | Collator |         600 |
| Jones | Screw | Terminal |         400 |
| Clark | Cog   | Tape     |         300 |
| Adams | Cam   | Tape     |         100 |
| Jones | Screw | Tape     |         800 |
+-------+-------+----------+-------------+

/* 5. Display the Supplier name, Supplying Parts to a Job in the same City. */
select s.sname
from sp inner join s
on sp.`s#` = s.`s#`
inner join p
on sp.`p#` = p.`p#`
group by s.sname;
+-------+
| sname |
+-------+
| Adams |
| Smith |
| Blake |
| Jones |
| Clark |
+-------+

/* 6. Display the Part name that is ‘Red’ in color, and the Total Quantity sold for that 
part.*/
select Pname, sum(sp.QTY)
from sp inner join p
ON sp.`p#` = p.`p#`
where color = 'Red'
group by pname;
+-------+-------------+
| Pname | sum(sp.QTY) |
+-------+-------------+
| Nut   |        1000 |
| Screw |        1300 |
| Cog   |        1300 |
+-------+-------------+

/* 7. Display all the Quantity sold by Suppliers with the Status = 20.*/
select sname , sum(sp.QTY)
from s inner join sp
on s.`s#` = sp.`s#`
where status= 20
group by sname;
+-------+-------------+
| sname | sum(sp.QTY) |
+-------+-------------+
| Smith |         900 |
| Clark |         600 |
+-------+-------------+

/* 8. Display all the Parts and their Total Quantity for the parts with the  
Weight > 14. */
select pname ,sum(sp.QTY)
from sp inner join p
on sp.`p#` = p.`p#`
where weight >14
group by pname;
+-------+-------------+
| pname | sum(sp.QTY) |
+-------+-------------+
| Screw |        3500 |
| Cog   |        1300 |
| Bolt  |         300 |
+-------+-------------+

/* 9. Display all the Job names and City, which has bought more than 500 Parts. */
select jname ,city ,sum(sp.QTY)
from sp inner join j
on sp.`j#`=j.`j#`
group by jname,city
having  sum(sp.QTY)>500;
+----------+--------+-------------+
| jname    | city   | sum(sp.QTY) |
+----------+--------+-------------+
| Sorter   | Paris  |         800 |
| Console  | Athens |        3300 |
| Punch    | Rome   |        1200 |
| Collator | London |        1100 |
| Tape     | London |        1200 |
+----------+--------+-------------+

/* 10. Display all the Part names and Quantity sold that have a Weight less than 15. */
select pname , sum(sp.QTY)
from sp inner join p
on sp.`p#`=p.`p#`
where p.weight<15
group by pname;
+-------+-------------+
| pname | sum(sp.QTY) |
+-------+-------------+
| Nut   |        1000 |
| Cam   |        1100 |
| Screw |        1300 |
+-------+-------------+

/* 11. Display all the Suppliers with the same Status as the supplier, ‘CLARK’. */

select s1.sname , s2.status 
from s s1 join s s2 
on s1.status = s2.status 
where s2.sname = 'clark' 
AND s1.sname != 'clark';
+-------+--------+
| sname | status |
+-------+--------+
| Smith |     20 |
+-------+--------+

/* 12. Display all the Parts which have more Weight than any “Red” parts.*/
select distinct p1.pname , p1.weight,p1.color 
from p p1 join p p2 
on p1.weight > p2.weight 
where p2.color = 'red' ;
+-------+--------+-------+
| pname | weight | color |
+-------+--------+-------+
| Bolt  |     17 | Green |
| Screw |     17 | Blue  |
| Screw |     14 | Red   |
| Cog   |     19 | Red   |
+-------+--------+-------+s
/* 13. Display all the Jobs going on in the same city as the job ‘TAPE’. */
select j1.jname , j1.city
from j j1 join j j2
on j1.city = j2.city
where j2.jname='Tape'
and j1.jname != 'Tape';
+----------+--------+
| jname    | city   |
+----------+--------+
| Collator | London |
+----------+--------+

/* 14. Display all the Parts with Weight less than any of the “Green” parts. */
select p1.pname,p1.weight
from p p1 join p p2
on p1.weight < p2.weight
where p2.color='green';
+-------+--------+
| pname | weight |
+-------+--------+
| Nut   |     12 |
| Screw |     14 |
| Cam   |     12 |
+-------+--------+

/* 15. Display the name of the Supplier who has sold the maximum Quantity (in one 
sale). */
select sname,max(sp.QTY)
from sp inner join s
on sp.`s#`=s.`s#`
group by sname 
order by max(sp.qty)desc 
limit 1 ;
+-------+-------------+
| sname | max(sp.QTY) |
+-------+-------------+
| Adams |         800 |
+-------+-------------+
16. Display the name of the Supplier who has sold the maximum overall  
Quantity (sum of Sales).
select sname,sum(sp.QTY)
from sp inner join s
on sp.`s#`=s.`s#`
group by sname 
order by sum(sp.qty)desc 
limit 1 ;
+-------+-------------+
| sname | sum(sp.QTY) |
+-------+-------------+
| Jones |        3200 |
+-------+-------------+




