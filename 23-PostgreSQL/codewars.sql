--https://www.codewars.com/kata/5811315e04adbbdb5000050e/train/sql
-- Create your SELECT statement here
SELECT 
id,
COALESCE(NULLIF(name, ''), '[product name not found]') as name,
price,
COALESCE(NULLIF(card_name, ''), '[product name not found]') as card_name,
card_number,
transaction_date
FROM  eusales
WHERE price IS NOT NULL AND price >=50;
