with 

source as (

    select * from {{ source('raw', 'sales_margin') }}

),

renamed as (

    select

    from source

)

select * from renamed
