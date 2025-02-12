WITH campaign_data AS (
    SELECT
        c.date_date
        ,c.ads_cost
        ,c.ads_impression
        ,c.ads_clicks
        ,f.average_basket
        ,f.operational_margin
        ,f.quantity
        ,f.revenue
        ,f.purchase_cost
        ,f.margin
        ,f.shipping_fee
        ,f.logcost
        ,f.ship_cost
    FROM
        {{ ref("int_campaigns_day")}} AS c
    LEFT JOIN 
        {{ ref('finance_days')}} AS f
    
    ON 
        c.date_date = f.date_date
)

SELECT
    date_date
    ,(operational_margin-ads_cost) AS ads_margin
    ,average_basket
    ,operational_margin
    ,ads_cost
    ,ads_impression
    ,ads_clicks
    ,quantity
    ,revenue
    ,purchase_cost
    ,margin
    ,shipping_fee
    ,logcost
    ,ship_cost

FROM campaign_data
ORDER BY date_date DESC
