DuckLake demo
================

DuckLake is an integrated data lake and catalog format.

![DuckLake Specification](https://ducklake.select/images/manifesto/ducklake-schema-1.png)

# Features

* PostgreSQL database for metadata storage
* MinIO for data storage

![DuckLake PostgreSQL MinIO](./ducklake-pg-minio.png)

# Data Lakes

- lake1: a lake with DuckDB and MinIO
- lake2: a lake with DuckDB and Local File System
- lake2: a lake with PostgreSQL and MinIO

Please refer to [justfile](./justfile) for commands.

# Getting Started

- Start PostgreSQL and MinIO using Docker Compose: docker-compose up -d
- Use DuckDB CLI to create a new lake: `duckdb --cmd "ATTACH 'ducklake:lakes/lake2.ducklake' AS lake2; use lake2;"`
- Create `city` table from [demo.sql](./demo.sql)

# References

* [DuckLake](https://ducklake.select/)
* Welcome to the age of $10/month Lakehouses: https://tobilg.com/the-age-of-10-dollar-a-month-lakehouses
* Learn How to Use DuckLake with DuckDB to Build Datalakes on S3: https://medium.com/@shahsoumil519/learn-how-to-use-ducklake-with-duckdb-to-build-iceberg-tables-on-s3-274ca0495261
* DuckLake: This is your Data Lake on ACID https://www.definite.app/blog/ducklake
* Digging into Ducklake: https://rmoff.net/2025/06/02/digging-into-ducklake/
