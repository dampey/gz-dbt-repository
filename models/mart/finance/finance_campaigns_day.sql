SELECT 
date_date,
nb_transactions,
revenue,
average_basket,
average_basket_bis,
margin,
operational_margin,
purchase_cost,
shipping_fee,
logcost,
ship_cost,
quantity,
ads_cost,
ads_impression,
ads_clicks,
ROUND((operational_margin-ads_cost),2) AS ads_margin
FROM {{ref("finance_days")}}
LEFT JOIN {{ref("int_campaigns_day")}}
  USING(date_date)
ORDER BY date_date desc
