{{config(materialized='incremental')}}
select
    concat(c.c_custkey, '#', o.o_orderkey) as cust_purchasekey,
    c.c_custkey,
    c.c_name,
    c.c_nationkey,
    o.o_orderdate,
    o.o_orderstatus,
    o.o_totalprice

from  demo_db.raw.customer c
join demo_db.raw.orders o on c.c_custkey = o.o_custkey

{% if is_incremental() %}
    where o_orderdate > (select max(o_orderdate) from {{ this }} )
{% endif %}