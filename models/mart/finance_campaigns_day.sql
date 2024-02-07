SELECT *,
ROUND((operational_margin-ads_cost),2) AS ads_margin
FROM {{ref("finance_days")}}
LEFT JOIN {{ref("int_campaigns_day")}}
  USING(date_date)
ORDER BY date_date desc
