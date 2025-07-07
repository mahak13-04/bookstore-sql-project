// retrieve alll the books inn fantasy genre

select * from books
where genre = 'Fiction'


//find the average price ofbooks in_the fantasy genre

select avg(price)  from books
where genre ='Fantasy'



//list customers who have atleast 2quantity

select * from customers c 
inner join orders o 
on c.customer_id = o.Customer_ID
where o.quantity >=2


//most frequently ordered book 


select b.genre,b.author,b.title, o.book_id, count(o.order_id) as freq_orderd_book 
from orders o inner join books b
on o.book_id =b.book_id
group by o.Book_ID 
order by freq_orderd_book desc
limit 1;



//book published after1950

select*from books
where published_year =1950;

// canada customers 

select name, customer_id,city from customers 
where country = 'Canada'


select*from orders
where order_date  between '01-11-2023' and '31-11-2023'


//retrieve the total stock of books available 

select sum(stock) 
as total_stock
from books

//most expensive book 

 select book_id, author, genre ,max(price)
 from books
 
 //ORR
 
 select* from Books b 
 order by price desc 
 limit 1;
 
  //whole customers who ordered  >1 quantity of_a book 
  
   select* from orders o inner join customers c 
   on o.customer_id = c.customer_id
   where o.quantity >1
   
   //  retrieve alll orders wheree the total amount exceeds $20 
   
   select*from orders 
   where total_amount >20
   
   
   //list alll genre available inn the books tablee 
   
    select distinct(genre)
    from books
    
    // find the book wi_th the lowest stock

SELECT * FROM Books
WHERE Stock = (SELECT MIN(Stock) FROM Books);

//orr

select * from books 
order by stock asc 
limit 1;

//calculate the total revenue generated_from all_orders

select sum(price) as total_revenue from books




//total_num off sold book

select b.genre,sum(o.quantity) from orders o
inner join books b
on o.book_id =b.book_id
group by genre


//show the most top 3 expensive books off 'fantasy' genre //

select*from books
where genre ='Fantasy'
order by price desc
LIMIT 3;


// RETRIEVE the total quantity of_books sold by_each author

select b.Author , sum(quantity) as total_sold
from books b inner join orders o 
on b.book_id = o.book_id 
group  by author
order by total_sold desc


// list the cities wheres customers who spents overr dollar thirty located

select c.city from customers c inner join orders o 
on c.customer_id = o.Customer_ID
where o.total_amount >30


// find the top3 customers who spent the most on_the orderr


select c.name, c.customer_id,sum(o.total_amount) as spent_amount 
from orders o inner join customers c 
on o.customer_id = c.customer_id
group by c.customer_id
order by spent_amount desc
limit 3;
