import duckdb

# attach ducklake
duckdb.execute("ATTACH 'ducklake:lakes/lake2.ducklake' AS lake2; use lake2;")

# execute query
duckdb.sql("SELECT * FROM city").show()
