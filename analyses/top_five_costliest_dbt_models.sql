/* This is a query midified from
   https://select.dev/docs/dbt-snowflake-monitoring/example-usage#top-10-costliest-dbt-models-in-the-last-30-days
   to look at top 5 costlierst dbt model in the last 30 days */

with
dbt_queries as (
    select *
    from dev.dbt_giselacchengmailcom.dbt_queries
),

max_date as (
    select max(date(end_time)) as date
    from dbt_queries
)

select
    dbt_queries.dbt_node_id,
    sum(dbt_queries.query_cost) as total_cost_last_30d,
    total_cost_last_30d*12 as estimated_annual_cost
from dbt_queries
cross join max_date
where
    dbt_queries.start_time >= dateadd('day', -30, max_date.date)
    and dbt_queries.start_time < max_date.date -- don't include partial day of data
group by 1
order by 2 desc
limit 5

/* Example query result
                 DBT_NODE_ID	                         TOTAL_COST_LAST_30D	    ESTIMATED_ANNUAL_COST
 model.dbt_snowflake_monitoring.stg_query_history	        0.6686653039	            8.023983647
 null	                                                    0.6623243638	            7.947892366
 model.dbt_snowflake_monitoring.stg_access_history	        0.3926857343	            4.712228812
 model.dbt_snowflake_monitoring.query_history_enriched	    0.3562028335	            4.274434002
 model.dbt_snowflake_monitoring.hourly_spend	            0.2800140436	            3.360168523
