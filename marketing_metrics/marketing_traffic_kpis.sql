SELECT 
  YEAR,
  ISOWEEK,
  sum(users) as total_users,
  sum(sessions) as total_sessions,
  sum(orders) as total_orders,
  round((sum(sessions) / sum(users)), 0) as sessions_per_user,
  round((sum(orders) / sum(users)), 2) as orders_per_user,
  round((sum(orders) / sum(sessions)), 2) as conversion_ratio
FROM default.lieferando_traffic
GROUP BY YEAR, ISOWEEK
ORDER BY year, isoweek
