WITH duplicates AS (
    SELECT 
        orders_id,
        pdt_id,
        COUNT(*) AS count_occurrences
    FROM `gz_raw_data.raw_gz_sales`
    GROUP BY orders_id, pdt_id
    HAVING COUNT(*) > 1
)

SELECT * FROM duplicates