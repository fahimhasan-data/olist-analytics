-- =====================================================================
-- A2_load_csv_with_psql.sql  — load CSVs into the empty tables from A1 (ALTERNATIVE PATH)
-- Download: https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce
-- Put the CSVs in  data/raw/   (this folder is git-ignored on purpose)
-- =====================================================================

-- ---------------------------------------------------------------------
-- OPTION A (recommended, fastest): psql  \copy
-- \copy is a psql command, NOT SQL -> it does NOT run in DBeaver's SQL editor.
-- Open "SQL Shell (psql)" (installed with PostgreSQL) or any terminal:
--   psql -h localhost -U postgres -d <your_db>
-- then paste the lines below (change the path to your folder; use forward slashes).
-- ---------------------------------------------------------------------
/*
\set d 'C:/Users/YOU/olist-analytics/data/raw'

\copy olist.customers   FROM :'d'/olist_customers_dataset.csv   WITH (FORMAT csv, HEADER true)
\copy olist.sellers     FROM :'d'/olist_sellers_dataset.csv     WITH (FORMAT csv, HEADER true)
\copy olist.geolocation FROM :'d'/olist_geolocation_dataset.csv WITH (FORMAT csv, HEADER true)
\copy olist.category_translation FROM :'d'/product_category_name_translation.csv WITH (FORMAT csv, HEADER true)
\copy olist.products    FROM :'d'/olist_products_dataset.csv    WITH (FORMAT csv, HEADER true)
\copy olist.orders      FROM :'d'/olist_orders_dataset.csv      WITH (FORMAT csv, HEADER true)
\copy olist.order_items FROM :'d'/olist_order_items_dataset.csv WITH (FORMAT csv, HEADER true)
\copy olist.order_payments FROM :'d'/olist_order_payments_dataset.csv WITH (FORMAT csv, HEADER true)
\copy olist.order_reviews  FROM :'d'/olist_order_reviews_dataset.csv  WITH (FORMAT csv, HEADER true)
*/
-- If the :'d'/file syntax gives you trouble, write the full quoted path per line:
--   \copy olist.orders FROM 'C:/Users/YOU/olist-analytics/data/raw/olist_orders_dataset.csv' WITH (FORMAT csv, HEADER true)

-- ---------------------------------------------------------------------
-- OPTION B: DBeaver GUI import (no psql needed)
-- 1. Refresh the DB navigator -> Schemas -> olist -> Tables
-- 2. Right-click a table -> Import Data -> CSV
-- 3. Pick the matching CSV. Mapping: "existing" columns, header = true,
--    delimiter ",", quote char ", and TICK "Set empty strings to NULL".
-- 4. For olist_products: map product_name_lenght -> product_name_length and
--    product_description_lenght -> product_description_length.
-- 5. Import in this order: customers, sellers, geolocation, category_translation,
--    products, orders, order_items, order_payments, order_reviews.
-- (geolocation has ~1M rows; it takes a few minutes in the GUI.)
-- ---------------------------------------------------------------------

-- ---------------------------------------------------------------------
-- VERIFY (run in DBeaver after loading). Don't trust — check:
-- ---------------------------------------------------------------------
SELECT 'customers' AS tbl, COUNT(*) FROM olist.customers
UNION ALL SELECT 'sellers',      COUNT(*) FROM olist.sellers
UNION ALL SELECT 'geolocation',  COUNT(*) FROM olist.geolocation
UNION ALL SELECT 'category_translation', COUNT(*) FROM olist.category_translation
UNION ALL SELECT 'products',     COUNT(*) FROM olist.products
UNION ALL SELECT 'orders',       COUNT(*) FROM olist.orders
UNION ALL SELECT 'order_items',  COUNT(*) FROM olist.order_items
UNION ALL SELECT 'order_payments', COUNT(*) FROM olist.order_payments
UNION ALL SELECT 'order_reviews',  COUNT(*) FROM olist.order_reviews;
-- Rough expectation: orders ~99k, order_items ~113k, customers ~99k,
-- products ~33k, sellers ~3.1k, payments ~104k, reviews ~99k, geolocation ~1M.
