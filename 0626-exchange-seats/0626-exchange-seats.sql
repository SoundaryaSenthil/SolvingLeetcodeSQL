WITH cte AS (
    SELECT *,
           ROW_NUMBER() OVER (ORDER BY id) AS rownum,
           LEAD(id) OVER (ORDER BY id) AS lead_id,
           LAG(id) OVER (ORDER BY id) AS lag_id,
           COUNT(*) OVER () AS total_rows
    FROM seat
)
SELECT
    CASE
        WHEN rownum % 2 = 1 AND rownum < total_rows THEN lead_id
        WHEN rownum % 2 = 0 THEN lag_id
        ELSE id
    END AS id,
    student
FROM cte
ORDER BY id;