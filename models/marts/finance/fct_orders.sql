with 
orders as (
    select * 
    from {{ ref("sgt_jaffle_shop_orders") }}
),

payements as (
    select * 
    from {{ref("stg_stripe_payments") }}
),

order_payments as (
    select
        order_id,
        sum(case when payment_status = 'success' then amount end) as amount
    from payements
    group by 1
),

final as(
    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        coalesce (order_payments.amount, 0) as amount
    from  orders
    left join order_payments using (order_id)
)

select * from final
