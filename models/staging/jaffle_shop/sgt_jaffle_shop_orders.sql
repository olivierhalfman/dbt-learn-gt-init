select
    id as order_id,
    user_id as customer_id,
    order_date,
    status
from {{ref('dbt_ohalfman', 'jaffle_shop_orders')}}