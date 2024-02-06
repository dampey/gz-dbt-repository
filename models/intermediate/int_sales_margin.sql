WITH sales AS 
(
select product_id, 
round(sum(quantity),2) as quantity, 
round(sum(revenue),2) as revenue
from {{ref('stg_raw__sales')}}
group by product_id
),

product AS 
(select products_id,
round((quantity * cast(purchase_price as float64)),2) as purchase_cost
from {{ref('stg_raw__product')}}
JOIN sales
ON products_id = sales.product_id 
)

select product_id, 
quantity, 
revenue,
purchase_cost,
round((revenue-cast(purchase_cost as float64)),2) as margin
from sales
JOIN product
ON products_id = sales.product_id 