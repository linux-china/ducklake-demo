CREATE TABLE ducklake_metadata
(
    key   VARCHAR NOT NULL,
    value VARCHAR NOT NULL
);
CREATE TABLE ducklake_snapshot
(
    snapshot_id     BIGINT PRIMARY KEY,
    snapshot_time   TIMESTAMPTZ,
    schema_version  BIGINT,
    next_catalog_id BIGINT,
    next_file_id    BIGINT
);
CREATE TABLE ducklake_snapshot_changes
(
    snapshot_id  BIGINT PRIMARY KEY,
    changes_made VARCHAR
);
CREATE TABLE ducklake_schema
(
    schema_id      BIGINT PRIMARY KEY,
    schema_uuid    UUID,
    begin_snapshot BIGINT,
    end_snapshot   BIGINT,
    schema_name    VARCHAR
);
CREATE TABLE ducklake_table
(
    table_id       BIGINT,
    table_uuid     UUID,
    begin_snapshot BIGINT,
    end_snapshot   BIGINT,
    schema_id      BIGINT,
    table_name     VARCHAR
);
CREATE TABLE ducklake_view
(
    view_id        BIGINT,
    view_uuid      UUID,
    begin_snapshot BIGINT,
    end_snapshot   BIGINT,
    schema_id      BIGINT,
    view_name      VARCHAR,
    dialect        VARCHAR,
    sql            VARCHAR,
    column_aliases VARCHAR
);
CREATE TABLE ducklake_tag
(
    object_id      BIGINT,
    begin_snapshot BIGINT,
    end_snapshot   BIGINT,
    key            VARCHAR,
    value          VARCHAR
);
CREATE TABLE ducklake_column_tag
(
    table_id       BIGINT,
    column_id      BIGINT,
    begin_snapshot BIGINT,
    end_snapshot   BIGINT,
    key            VARCHAR,
    value          VARCHAR
);
CREATE TABLE ducklake_data_file
(
    data_file_id      BIGINT PRIMARY KEY,
    table_id          BIGINT,
    begin_snapshot    BIGINT,
    end_snapshot      BIGINT,
    file_order        BIGINT,
    path              VARCHAR,
    path_is_relative  BOOLEAN,
    file_format       VARCHAR,
    record_count      BIGINT,
    file_size_bytes   BIGINT,
    footer_size       BIGINT,
    row_id_start      BIGINT,
    partition_id      BIGINT,
    encryption_key    VARCHAR,
    partial_file_info VARCHAR
);
CREATE TABLE ducklake_file_column_statistics
(
    data_file_id      BIGINT,
    table_id          BIGINT,
    column_id         BIGINT,
    column_size_bytes BIGINT,
    value_count       BIGINT,
    null_count        BIGINT,
    min_value         VARCHAR,
    max_value         VARCHAR,
    contains_nan      BOOLEAN
);
CREATE TABLE ducklake_delete_file
(
    delete_file_id   BIGINT PRIMARY KEY,
    table_id         BIGINT,
    begin_snapshot   BIGINT,
    end_snapshot     BIGINT,
    data_file_id     BIGINT,
    path             VARCHAR,
    path_is_relative BOOLEAN,
    format           VARCHAR,
    delete_count     BIGINT,
    file_size_bytes  BIGINT,
    footer_size      BIGINT,
    encryption_key   VARCHAR
);
CREATE TABLE ducklake_column
(
    column_id       BIGINT,
    begin_snapshot  BIGINT,
    end_snapshot    BIGINT,
    table_id        BIGINT,
    column_order    BIGINT,
    column_name     VARCHAR,
    column_type     VARCHAR,
    initial_default VARCHAR,
    default_value   VARCHAR,
    nulls_allowed   BOOLEAN,
    parent_column   BIGINT
);
CREATE TABLE ducklake_table_stats
(
    table_id        BIGINT,
    record_count    BIGINT,
    next_row_id     BIGINT,
    file_size_bytes BIGINT
);
CREATE TABLE ducklake_table_column_stats
(
    table_id      BIGINT,
    column_id     BIGINT,
    contains_null BOOLEAN,
    contains_nan  BOOLEAN,
    min_value     VARCHAR,
    max_value     VARCHAR
);
CREATE TABLE ducklake_partition_info
(
    partition_id   BIGINT,
    table_id       BIGINT,
    begin_snapshot BIGINT,
    end_snapshot   BIGINT
);
CREATE TABLE ducklake_partition_column
(
    partition_id        BIGINT,
    table_id            BIGINT,
    partition_key_index BIGINT,
    column_id           BIGINT,
    transform           VARCHAR
);
CREATE TABLE ducklake_file_partition_value
(
    data_file_id        BIGINT PRIMARY KEY,
    table_id            BIGINT,
    partition_key_index BIGINT,
    partition_value     VARCHAR
);
CREATE TABLE ducklake_files_scheduled_for_deletion
(
    data_file_id     BIGINT,
    path             VARCHAR,
    path_is_relative BOOLEAN,
    schedule_start   TIMESTAMPTZ
);
CREATE TABLE ducklake_inlined_data_tables
(
    table_id        BIGINT,
    table_name      VARCHAR,
    schema_snapshot BIGINT
);

