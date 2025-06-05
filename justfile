# lake1 with DuckDB + MinIO
lake1:
    duckdb --cmd "create secret ducklake_oss (type s3, key_id 'minioadmin', secret 'minioadmin', endpoint '127.0.0.1:9000', use_ssl false, url_style 'path'); ATTACH 'ducklake:lakes/lake1.ducklake' as lake1 (DATA_PATH 's3://lake1'); use lake1;"

# lake2 with DuckDB + Local File System
lake2:
    duckdb --cmd "ATTACH 'ducklake:lakes/lake2.ducklake' AS lake2; use lake2;"

# lake3 with DuckDB + PostgreSQL
lake3:
    duckdb --cmd "create secret ducklake_oss (type s3, key_id 'minioadmin', secret 'minioadmin', endpoint '127.0.0.1:9000', use_ssl false, url_style 'path'); ATTACH 'ducklake:postgres:dbname=ducklake host=127.0.0.1 port=55432 user=ducklake password=123456' as lake3 (DATA_PATH 's3://lake3'); use lake3;"

# Connect to ducklake postgresql
postgres:
    psql -d "postgres://ducklake:123456@127.0.0.1:55432/ducklake"
