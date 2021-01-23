-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

select p.ProductName, c.CategoryName
from product p
join category c
    on p.CategoryId = c.Id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

select ord.Id, s.CompanyName, ord.OrderDate
from [order] ord
join [Shipper] s
    on ord.ShipVia = s.Id
    where OrderDate < '2012-08-09'

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

select p.ProductName, od.Quantity
from [OrderDetail] od
join [Order] o
    on od.OrderId = o.Id
join [Product] p
    on od.ProductId = p.Id
where od.OrderId = 10251
order by p.ProductName

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

select 
ord.Id, c.CompanyName, e.LastName
from [OrderDetail] od
join [Order] ord
    on od.OrderId = ord.Id
join [Product] p
    on od.ProductId = p.Id
join [Customer] c
    on ord.CustomerId = c.Id
join [Employee] e
    on ord.EmployeeId = e.Id
group by ord.Id