# AWS DBT Snowflake ETL Pipeline

An end-to-end ETL pipeline built using AWS, dbt, and Snowflake to ingest, transform, and model Airbnb data following modern data engineering practices.

## Project Overview

This project demonstrates how to build a scalable cloud-based ETL pipeline using:

- AWS S3 for data storage
- Snowflake as the cloud data warehouse
- dbt (Data Build Tool) for transformations
- SQL and Jinja for incremental data processing

The pipeline loads raw Airbnb data into Snowflake and transforms it into analytics-ready tables using dbt incremental models.

---

## Architecture

```text
Raw Data
    │
    ▼
 AWS S3
    │
    ▼
 Snowflake Staging Layer
    │
    ▼
 dbt Transformations
    │
    ▼
 Bronze Layer
    │
    ▼
 Analytics Ready Tables
```

## Tech Stack

| Technology | Purpose |
|------------|----------|
| AWS S3 | Data Storage |
| Snowflake | Cloud Data Warehouse |
| dbt | Data Transformation |
| SQL | Data Modeling |
| Jinja | Dynamic SQL Logic |
| Git & GitHub | Version Control |

---

## Project Structure

```text
aws-dbt-snowflake-etl/
│
├── models/
│   ├── bronze/
│   │   ├── bronze_bookings.sql
│   │   ├── bronze_hosts.sql
│   │   └── bronze_listings.sql
│   │
│   └── sources/
│       └── sources.yml
│
├── analyses/
├── macros/
├── snapshots/
├── tests/
├── seeds/
│
├── dbt_project.yml
├── packages.yml
└── README.md
```

---

## Data Model

### Source Tables

| Table | Description |
|---------|-------------|
| Listings | Property information |
| Hosts | Host information |
| Bookings | Booking transactions |

### Bronze Layer

#### bronze_listings

Contains cleaned listing data loaded from the staging layer.

#### bronze_hosts

Contains host-related information.

#### bronze_bookings

Contains booking transaction details.

---

## Incremental Loading

This project uses dbt incremental models to process only new records.

Example:

```sql
{{ config(materialized='incremental') }}

SELECT *
FROM {{ source('staging', 'bookings') }}

{% if is_incremental() %}
WHERE CREATED_AT >
(
    SELECT COALESCE(MAX(CREATED_AT), '1900-01-01')
    FROM {{ this }}
)
{% endif %}
```

Benefits:

- Faster execution
- Reduced warehouse costs
- Efficient handling of large datasets

---

## Setup Instructions

### Clone Repository

```bash
git clone https://github.com/your-username/aws-dbt-snowflake-etl.git
cd aws-dbt-snowflake-etl
```

### Create Virtual Environment

```bash
python -m venv aws-dbt-snowflake
```

Activate environment:

```bash
aws-dbt-snowflake\Scripts\activate
```

### Install Dependencies

```bash
pip install dbt-core
pip install dbt-snowflake
```

### Configure Snowflake Profile

Create:

```text
profiles.yml
```

Example:

```yaml
aws_dbt_snowflake_project:
  outputs:
    dev:
      type: snowflake
      account: <account_identifier>
      user: <username>
      password: <password>
      role: ACCOUNTADMIN
      warehouse: COMPUTE_WH
      database: AIRBNB
      schema: DBT_SCHEMA
      threads: 1
  target: dev
```

---

## Running the Project

Validate configuration:

```bash
dbt debug
```

Run models:

```bash
dbt run
```

Build project:

```bash
dbt build
```

Generate documentation:

```bash
dbt docs generate
```

Serve documentation locally:

```bash
dbt docs serve
```

---

## Key Features

- End-to-end ETL workflow
- Cloud-native architecture
- Incremental loading
- Snowflake data warehouse integration
- dbt-based transformations
- Reusable SQL models
- Git version control
- Analytics-ready datasets

---

## Learning Outcomes

Through this project, I gained experience with:

- Data warehousing using Snowflake
- Building dbt projects
- Incremental data loading strategies
- Cloud data engineering workflows
- SQL-based data transformation
- Version control using Git and GitHub

---

## Author

Sambeet



GitHub: Add your GitHub profile link here
