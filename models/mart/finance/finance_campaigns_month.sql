SELECT 
concat(left(cast(date_date as string),7),'-01') datemonth,
ROUND(SUM(nb_transactions),2) as nb_transactions,
ROUND(SUM(revenue),2) as revenue,
ROUND(SUM(average_basket),2) as average_basket,
ROUND(SUM(average_basket_bis),2) as average_basket_bis,
ROUND(SUM(margin),2) as margin,
ROUND(SUM(operational_margin),2) as operational_margin,
ROUND(SUM(purchase_cost),2) as purchase_cost,
ROUND(SUM(shipping_fee),2) as shipping_fee,
ROUND(SUM(logcost),2) as logcost,
ROUND(SUM(ship_cost),2) as ship_cost,
ROUND(SUM(quantity),2) as quantity,
ROUND(SUM(ads_cost),2) as ads_cost,
ROUND(SUM(ads_impression),2) as ads_impression,
ROUND(SUM(ads_clicks),2) as ads_clicks,
ROUND(SUM(operational_margin-ads_cost),2) AS ads_margin
FROM {{ref("finance_campaigns_day")}}
GROUP BY datemonth
ORDER BY datemonth
