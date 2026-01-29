# 🏎️ F1 Championship Analytics
<LastRefreshed/>
# 🏎️ F1 Championship Analytics

[Go to Driver Comparison →](/compare)
## 🏆 Points Leaderboard
```sql top_drivers
select driver_name, sum(points_scored) as total
from f1.fct_race_results
group by 1 order by 2 desc limit 15
