-- SQL Basics: Simple NULL handling
SELECT 
id,
COALESCE(NULLIF(name, ''), '[product name not found]') as name,
price,
COALESCE(NULLIF(card_name, ''), '[card name not found]') as card_name,
card_number,
transaction_date
FROM  eusales
WHERE price IS NOT NULL AND price >=50;


--Piano Kata, Part 1
SELECT n,
  CASE (((n - 1) % 88) % 12)
    WHEN 0 THEN 'white'
    WHEN 2 THEN 'white'
    WHEN 3 THEN 'white'
    WHEN 5 THEN 'white'
    WHEN 7 THEN 'white'
    WHEN 8 THEN 'white'
    WHEN 10 THEN 'white'
    ELSE 'black'
  END AS res
FROM pianokeys;
