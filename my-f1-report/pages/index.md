# 🏎️ F1 Championship Analytics
<LastRefreshed/>

## 🏆 Points Leaderboard
```sql top_drivers
select driver_name, sum(points_scored) as total
from f1.fct_race_results
group by 1 order by 2 desc limit 15
