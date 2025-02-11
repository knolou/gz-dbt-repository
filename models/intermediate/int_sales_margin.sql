WITH sales AS (
    SELECT 
        s.date_date
        ,s.orders_id
        ,s.products_id
        ,s.revenue
        ,s.quantity
        ,p.purchase_price
    FROM 
        {{ ref('stg_raw__sales') }} s
    LEFT JOIN 
       {{ ref('stg_raw__product') }} p
    
    ON 
        s.products_id = p.products_id
)

SELECT
    orders_id
    ,date_date
    ,revenue
    ,quantity
    ,(quantity*purchase_price) AS purchase_cost
    ,(revenue-(quantity*purchase_price)) AS margin
FROM sales
ORDER BY
    orders_id DESC