SELECT 
  YEAR,
  ISOWEEK,
  Marketing_group,
  subgroup,
  case 
    when sum(Clicks) = 0 then 'Organic'
    else 'Paid'
  end as marketing_type,
  case
    when ordertypeclass like 'Logistics%' then 'Logistics/Delivery'
    when ordertypeclass like 'Marketplace%' then 'Marketplace'
    else 'Self Pickup'
  end as operating_model_type,
  sum(Clicks) as total_clicks,
  sum(sessions) as total_sessions,
  sum(orders) as total_orders,
  case 
    when sum(Clicks) != 0 then sum(sessions)/sum(Clicks)
    else 0
  end as sessions_per_click,
  case 
    when sum(Clicks) != 0 then sum(orders)/sum(Clicks)
    else 0
  end as orders_per_click,
  case 
    when sum(sessions) != 0 then sum(orders)/sum(sessions)
    else 0
  end as orders_per_session
FROM default.lieferando_mktg_channels
GROUP BY ALL
ORDER BY year, isoweek, Marketing_group, subgroup
