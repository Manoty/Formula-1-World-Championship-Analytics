# 🏎️ Formula 1 Data Analytics (dbt + DuckDB)

An end-to-end ELT pipeline that transforms raw Formula 1 CSV data into a high-performance analytics layer. This project demonstrates modern analytics engineering practices including modular modeling, data testing, and resilient ingestion.

## 🚀 The Stack
- **Database:** [DuckDB](https://duckdb.org/) (In-process OLAP)
- **Transformation:** [dbt (data build tool)](https://www.getdbt.com/)
- **Data Source:** Ergast F1 Historical Dataset (Kaggle)

## 🏗️ Data Architecture
The project follows the **Medallion Architecture** to ensure data quality and maintainability:

1.  **Staging (`stg_`):** Initial cleanup of raw CSVs. Handles the ingestion of non-standard null characters (`\N`) and enforces schema types.
2.  **Intermediate (`int_`):** Complex logic layer. Joins races, results, and drivers. Includes **SQL Window Functions** to calculate cumulative championship points and race-by-race rankings.
3.  **Marts (`dim_` / `fct_`):** The "Gold" layer optimized for BI tools.
    - `fct_race_results`: Granular race performance data.
    - `dim_drivers`: Driver biographical data with calculated age metrics.
    - `int_driver_standings`: Running season totals.



## 🛠️ Installation & Usage
### 1. Prerequisites
- Python 3.10+
- dbt-duckdb adapter

### 2. Setup
Clone the repo and install dependencies:
```bash
pip install dbt-duckdb