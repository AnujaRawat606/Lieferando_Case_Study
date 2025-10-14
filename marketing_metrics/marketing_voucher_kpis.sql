SELECT 
  year(a.order_week) as year,
  weekofyear(a.order_week) as week,
  a.voucher_type,
  sum(a.vouchercost) as total_cost,
  sum(a.orders) as total_voucher_orders,
  sum(a.vouchercost) / sum(a.orders) as voucher_cost_per_order
FROM lieferando_voucher a 
GROUP BY year(a.order_week) as year, weekofyear(a.order_week) as week, a.voucher_type
