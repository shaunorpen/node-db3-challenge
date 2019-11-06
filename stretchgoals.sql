select
	e.firstname,
    e.lastname,
    sum(od.quantity * p.price) TotalSales
from
	employees e
    left join orders o on e.employeeid = o.employeeid
    left join orderdetails od on o.orderid = od.orderid
    left join products p on od.productid = p.productid
group by
	e.firstname,
    e.lastname
order by
	sum(od.quantity * p.price) desc
limit
	5
;

select
	c.categoryname,
    sum(od.quantity * p.price) as TotalSales
from
	products p
    left join categories c on p.categoryid = c.categoryid
    left join orderdetails od on p.productid = od.productid
group by
	c.categoryname
order by
	sum(od.quantity * p.price) desc
limit 
    1
;

select
	c.country, 
    count(*) TotalOrders
from
	customers c
    join orders o on c.customerid = o.customerid
group by
	c.country
order by
	count(*) desc
limit 
	1
;

select 
	s.shippername,
    sum(od.quantity) TotalUnitsOfCheeseShipped
from
	orderdetails od
    join products p on od.productid = p.productid and p.categoryid = 4
    join orders o on od.orderid = o.orderid
    join shippers s on o.shipperid = s.shipperid
group by
	s.shippername
order by
	sum(od.quantity) desc
limit
	1
;