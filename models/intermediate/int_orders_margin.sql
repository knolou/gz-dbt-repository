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
    ,ROUND(SUM(revenue),2) AS revenue
    ,SUM(quantity) AS quantity
    ,ROUND(SUM (quantity*purchase_price),2) AS purchase_cost
    ,ROUND(SUM (revenue-(quantity*purchase_price)),2) AS margin
FROM sales
GROUP BY 
    orders_id
    ,date_date
ORDER BY orders_id DESC