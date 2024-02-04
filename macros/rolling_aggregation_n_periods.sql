{% macro rolling_aggregation_n_periods(column_name, partition_by, order_by='created_at', aggregation='avg', n=7) %}
    {{ aggregation }}( {{ column_name }} ) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY {{ order_by }}
                ROWS BETWEEN {{ n-1 }} PRECEDING AND CURRENT ROW
            ) AS {{ aggregation }}_{{ n }}_periods_{{ column_name }}
{% endmacro %}
