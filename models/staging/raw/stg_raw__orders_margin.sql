with 

source as (

    select * from {{ source('raw', 'orders_margin') }}

),

renamed as (

    select

    from source

)

select * from renamed
