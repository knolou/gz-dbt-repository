with 

source as (
    select * from {{ source('dbt_lknoery', 'int_orders_margin') }}
),

renamed as (
    select
        orders_id,
        date_date,
        ROUND(SUM(revenue),2) as revenue,
        ROUND(SUM(quantity),2) as quantity,
        ROUND(SUM(purchase_cost),2) as purchase_cost,
        ROUND(SUM(margin),2) as margin
    from source
    group by orders_id, date_date
)

select * from renamed
