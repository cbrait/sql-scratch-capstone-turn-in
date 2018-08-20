-- QUESTION 1

SELECT * 
FROM survey 
LIMIT 10; 

-- QUESTION 2

SELECT question, COUNT(DISTINCT user_id) AS number_of_responses
FROM survey
GROUP BY question; 

-- QUESTION 3 

-- completed on Excel 

-- QUESTION 4

SELECT * 
FROM quiz
LIMIT 5; 

SELECT * 
FROM home_try_on
LIMIT 5;

SELECT * 
FROM purchase
LIMIT 5;

-- Question 5 

SELECT DISTINCT quiz.user_id,
   home_try_on.user_id IS NOT NULL AS 'is_home_try_on',
   home_try_on.number_of_pairs,
   purchase.user_id IS NOT NULL AS 'is_purchase'
FROM quiz
LEFT JOIN home_try_on
   ON quiz.user_id = home_try_on.user_id
LEFT JOIN purchase
   ON purchase.user_id = quiz.user_id
LIMIT 10;

-- QUESTION 6

-- Most popular colors in the quiz
SELECT color, COUNT(*) 
FROM quiz
GROUP BY color
ORDER BY COUNT(*) DESC;

-- Colors that were actually purchased
SELECT color, COUNT(*)
FROM purchase
GROUP BY color
ORDER BY COUNT(*) DESC;

-- Total price, by product_id
SELECT product_id, style, SUM(price)
FROM purchase
GROUP BY product_id
ORDER BY price DESC;

SELECT * FROM purchase WHERE product_id = 3 LIMIT 1;

-- Total number of customers who tried on at home
SELECT number_of_pairs, COUNT(*) FROM home_try_on
GROUP BY number_of_pairs; 

-- Total number of customers who purchased after trying on at home, grouped by the number of pairs they tried on at home.
SELECT number_of_pairs, COUNT(purchase.user_id)
FROM purchase
LEFT JOIN  home_try_on
ON purchase.user_id = home_try_on.user_id
GROUP BY number_of_pairs
LIMIT 10;

-- Purchases ordered by most to least
SELECT product_id, style, model_name, color, COUNT(*) FROM purchase GROUP BY product_id ORDER BY COUNT(*) DESC;



