with 
source as (
    -- Je suppose que 'stg_raw__sales' et 'stg_raw__product' existent déjà comme modèles et sont correctement définis
    select 
        s.products_id,
        s.date_date,
        s.orders_id,
        s.revenue,
        s.quantity,
        p.purchase_price,
        ROUND(s.quantity * p.purchase_price, 2) AS purchase_cost,
        ROUND(s.revenue - (s.quantity * p.purchase_price), 2) AS margin
    from {{ ref('stg_raw__sales') }} s
    left join {{ ref('stg_raw__product') }} p
    using (products_id)
)

select * from source
