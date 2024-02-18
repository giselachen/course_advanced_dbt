# Welcome to the Bingeflix Data Team

### Coding Conventions
#### General
- Use UPPER case for all keywords
- Use trailing commas in SELECT statements
- Use Snowflake dialect
- Use consistent style in GROUP BY and ORDER BY (either names or numbers, not both)


### Testing Conventions
#### Sources
- The primary key source column must have not_null and unique generic tests.
- All boolean columns must have an accepted_values schema test. The accepted values are true and false.
- Columns that contain category values must have an accepted_values schema test.
- Columns that should never be null must have a not_null schema test.
- Columns that should be unique must have a unique schema test.

#### Models
- The primary key column must have not_null and unique schema tests.
- All boolean columns must have an accepted_values schema test. The accepted values are true and false.
- Columns that contain category values must have an accepted_values schema test.
- Columns that should never be null must have a not_null schema test.
- Columns that should be unique must have a unique schema test.
- Where possible, use schema tests from the dbt_utils or dbt_expectations packages to perform extra verification.

### Project work
#### Week 1 - Major updates
- Project environment installation
- Added model yml file for `fct_events`
- Updated `docs_bingeflix.md` to standardize description for event related table/fields
- Installed `dbt_project_evaluator` package and resolve errors in the project
- Added color-highlight to the DAG

#### Week 2 - Major updates
- Added pre-commit to pipfile package list
- Added `.pre-commit-config.yaml` file
- Installed and ran the following three pre-commit hooks
  - pre-commit
  - sqlfluff
  - dbt-checkpoint
- Fix pre-commit errors
  - `check the model has all columns in properties file`
  - `fix end of files`
  - `trim trailing whitespace`
  - `dbt compile`
- Add rolling_aggregation_n_periods and get_current_user_subscription_properties macro

#### Week 3 - Major updates
- Deleted redundant tests from `staging_bingeflix__subscriptions` and `dim_subscriptions`
- Converted `assert_valid_event_name` from a custom test to a generic test
- Added a custom unit test to `fct_mrr` model

#### Week 4 - Major updates
- Added incremental logic to `stg_bingeflix__events` model
- Added dbt-snowflake-monitoring package to the project and two queries to check for top 5 costliest dbt models and daily cost of the most expensive models in the analyses folder
- Refactored `fct_mrr` model to push some logic into the `int_subscription_periods` model
