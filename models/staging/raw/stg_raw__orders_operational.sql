with 

source as (
    -- Sélectionner les données depuis la source 'int_orders_operational'
    select * from {{ source('dbt_lknoery', 'int_orders_operational') }}
),

renamed as (
    -- Je suppose que tu veux renommer ou transformer des colonnes ici
    select * from source
)

select * from renamed