select
    id as customer_id,
    first_name,
    last_name
from {{ref('dbt_ohalfman', 'jaffle_shop_customers')}}