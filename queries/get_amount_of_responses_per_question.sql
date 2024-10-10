SELECT 
    question,
    COUNT(DISTINCT user_id) AS distinct_user_count
FROM survey
GROUP BY question
ORDER BY question;