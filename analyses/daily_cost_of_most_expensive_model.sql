/* This is a query midified from
   https://select.dev/docs/dbt-snowflake-monitoring/example-usage#daily-dbt-model-running-costs
   to look at daily cost of the most expensive model based on top_five_costliest dbt models query */

select
    date(start_time) as date,
    sum(query_cost) as cost
from dev.dbt_giselacchengmailcom.dbt_queries
where dbt_node_id = 'model.dbt_snowflake_monitoring.stg_query_history'
group by 1
order by 1 desc
