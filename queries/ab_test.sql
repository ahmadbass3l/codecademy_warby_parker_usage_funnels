WITH ab_query AS (
    SELECT q.user_id,
        h.user_id IS NOT NULL AS 'is_home_try_on',
        CASE h.number_of_pairs
            WHEN h.number_of_pairs IS NULL THEN 0
            ELSE h.number_of_pairs
        END AS 'number_of_pairs',
        p.user_id IS NOT NULL AS 'is_purchase'
    FROM quiz AS 'q'
    LEFT JOIN home_try_on AS 'h'
        ON q.user_id = h.user_id
    LEFT JOIN purchase AS 'p'
        ON h.user_id = p.user_id
)
SELECT number_of_pairs, 
    COUNT(is_purchase) AS 'purchase_count'
FROM ab_query
WHERE number_of_pairs > 0
GROUP BY number_of_pairs
;
