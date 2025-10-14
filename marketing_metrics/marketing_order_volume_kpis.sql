SELECT 
  year,
  weeknumber,
  ordertype,
  ordertypeclass,
  partner_type,
  sum(NumberofOrders) as total_orders,
  sum(ov_w_discount) as total_discount,
  sum(NewCustomers) as new_customers,
  case 
    when sum(ov_w_discount) != 0  and sum(NumberofOrders)  != 0 then sum(ov_w_discount)/sum(NumberofOrders)
    else 0
  end as discounted_orders_ratio,
  case 
    when sum(NewCustomers) != 0 and sum(NumberofOrders)  != 0 then sum(NewCustomers)/sum(NumberofOrders) 
    else 0
  end as orders_per_new_customer,
  case 
    when sum(ov_w_discount) != 0 and sum(NewCustomers) != 0 then sum(ov_w_discount)/sum(NewCustomers)
    else 0
  end as discounted_orders_per_new_customer
FROM default.lieferando_ov_data
GROUP BY year, weeknumber, ordertype, ordertypeclass, partner_type
ORDER BY year, weeknumber, ordertype, ordertypeclass, partner_type
