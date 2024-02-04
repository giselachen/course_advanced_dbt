{% macro get_current_user_subscription_properties(function_name, column_name) -%}
    {{ function_name }}(CASE WHEN is_subscribed_current_month THEN {{ column_name}} END) OVER (PARTITION BY user_id, subscription_id)
{% endmacro %}
