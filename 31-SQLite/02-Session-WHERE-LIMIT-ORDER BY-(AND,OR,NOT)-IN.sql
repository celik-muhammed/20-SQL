/*===================================================
WHERE
====================================================*/

/* Ask for songs with Jimi Hendrix from Composer.
	Composer'ı Jimi Hendrix olan şarkıları sorgulayiniz*/
SELECT name
FROM tracks
WHERE Composer = 'Jimi Hendrix';

/* Query all the information of invoices with Total value greater than $10 
in the Invoices table.
		Invoices tablosunda Total değeri 10$ dan büyük olan faturaların 
tüm bilgilerini sorgulayiniz */

SELECT *
FROM invoices
WHERE total > 10;

/*===================================================
LIMIT
====================================================*/

/* In the Invoices table, query the InvoiceId, InvoiceDate and 
total information of the first 4 records whose Total value is greater than $10.
	Invoices tablosunda Total değeri 10$'dan büyük olan ilk 4 kayıt'ın 
InvoiceId,InvoiceDate ve total bilgilerini sorgulayiniz */
SELECT InvoiceId,invoicedate,total 
FROM invoices
WHERE total > 10
LIMIT 4;


/*===================================================
ORDER BY
====================================================*/
	
/* In the Invoices table, list all the information of the 10 records with 
the most recent InvoiceDate from records with a Total value greater than $10.
	Invoices tablosunda Total değeri 10$'dan büyük olan kayıtlardan işlem tarihi 
(InvoiceDate) en yeni olan 10 kaydın tüm bilgilerini listeyiniz */

SELECT * 
FROM invoices
WHERE total > 10
ORDER BY InvoiceDate DESC
LIMIT 10; 
 
 /* Query the CustomerId, InvoiceDate, BillingCity, total values 
 ​​from the Invoices table. Rank the BillingCity values ​​in ascending order 
 and the total values ​​in descending order.
	Invoices tablosundan CustomerId, InvoiceDate, BillingCity, total 
değerlerini sorgulayınız. BillingCity artan sırayla ve total değerlerini 
azalan sırayla sıralayınız.*/
 SELECT CustomerId, InvoiceDate,BillingCity,total
 FROM invoices
 ORDER BY BillingCity ASC,total DESC;
 
/*===================================================
LOGICAL OPERATORS (AND,OR,NOT)
====================================================*/

/* In the Invoices table, list the records whose country (BillingCountry) 
is not USA, in DECISING order according to their total value.
	Invoices tablosunda ülkesi (BillingCountry) USA olmayan
 kayıtları total değerine göre  AZALAN sırada listeyiniz */ 
 
 SELECT *
 FROM invoices
 WHERE NOT BillingCountry = "USA" 
 --WHERE BillingCountry != "USA" 
 -- WHERE BillingCountry <> "USA"
 ORDER BY total DESC;
  	
/* In the Invoices table, list the records whose country (BillingCountry) is 
USA or Germany in ascending order in InvoiceId.
	Invoices tablosunda, ülkesi (BillingCountry) USA veya Germany 
olan kayıtları,InvoiceId sırasına göre artan sırada listeyiniz */ 
	
 SELECT *
 FROM invoices
 WHERE BillingCountry = 'USA' OR BillingCountry = 'Germany'
 ORDER BY InvoiceId ASC;
 
 /* In the Invoices table, list all the information of the invoices 
 between the date of invoice (InvoiceDate) 01-01-2012 and 02-01-2013.
	Invoices tablosunda fatura tarihi (InvoiceDate) 01-01-2012 ile 02-01-2013 
 tarihleri arasındaki faturaların tüm bilgilerini listeleyiniz */

SELECT *
FROM invoices
WHERE InvoiceDate>= '2012-01-01' AND InvoiceDate <= '2013-01-02 00:00:00';

SELECT *
FROM invoices
WHERE InvoiceDate BETWEEN '2012-01-01' AND '2013-01-02 00:00:00';

/* In the Invoices table, write the query that lists the most recent invoice 
from the date of invoice (InvoiceDate) 2009 to 2011.
	Invoices tablosunda fatura tarihi (InvoiceDate) 2009 ila 2011 
tarihleri arasındaki en yeni faturayı listeleyen sorguyu yazınız */ 

 SELECT *
 FROM invoices
 WHERE InvoiceDate BETWEEN '2009-01-01' AND '2011-12-31'
 ORDER BY InvoiceDate DESC
 LIMIT 1;
 
 	
/*===================================================
 IN
====================================================*/

/* 
In the customers table, list the FirstName, LastName, country information 
of the customers ordering from Belgium, Norway, Canada or USA.
	Customers tablosunda Belgium, Norway,Canada veya USA ülkelerinden sipariş 
veren müşterilerin FirstName, LastName, country bilgilerini listeyiniz.	*/

SELECT FirstName,LastName,country
FROM customers
WHERE country IN('Belgium', 'Norway','Canada','USA');