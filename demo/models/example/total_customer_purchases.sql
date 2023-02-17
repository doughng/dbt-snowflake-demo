select
    c_custkey,
    c_name,
    sum(o_totalprice) as customer_total_price
from  {{ref('customer_purchases')}}
group by 1, 2