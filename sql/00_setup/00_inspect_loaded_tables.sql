-- =====================================================================
-- 00_inspect_loaded_tables.sql        (PostgreSQL 18 · DBeaver)
-- STEP 1 of setup: "What exactly did my CSV import create?"
-- Run each block separately (Ctrl+Enter on a statement).
-- =====================================================================

-- A) Which tables exist, in which schema, with how many columns?
SELECT table_schema, table_name,
       (SELECT COUNT(*) FROM information_schema.columns c
         WHERE c.table_schema = t.table_schema AND c.table_name = t.table_name) AS n_columns
FROM information_schema.tables t
WHERE table_type = 'BASE TABLE'
  AND table_schema NOT IN ('pg_catalog', 'information_schema')
ORDER BY table_schema, table_name;
-- Expect 9 tables. Typical names from a DBeaver import:
--   olist_customers_dataset, olist_geolocation_dataset, olist_order_items_dataset,
--   olist_order_payments_dataset, olist_order_reviews_dataset, olist_orders_dataset,
--   olist_products_dataset, olist_sellers_dataset, product_category_name_translation
-- Note the schema (this guide uses "raw") — you need it in step 2.

-- B) What data types did DBeaver choose? (timestamps stored as TEXT is common!)
SELECT table_name, column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'raw'                -- <- change if your tables live elsewhere
  AND (table_name LIKE 'olist_%' OR table_name = 'product_category_name_translation')
ORDER BY table_name, ordinal_position;

-- C) Quick row counts of the raw tables (edit names/schema if yours differ)
SELECT 'customers' AS tbl, COUNT(*) FROM raw.olist_customers_dataset
UNION ALL SELECT 'geolocation',  COUNT(*) FROM raw.olist_geolocation_dataset
UNION ALL SELECT 'order_items',  COUNT(*) FROM raw.olist_order_items_dataset
UNION ALL SELECT 'order_payments', COUNT(*) FROM raw.olist_order_payments_dataset
UNION ALL SELECT 'order_reviews',  COUNT(*) FROM raw.olist_order_reviews_dataset
UNION ALL SELECT 'orders',       COUNT(*) FROM raw.olist_orders_dataset
UNION ALL SELECT 'products',     COUNT(*) FROM raw.olist_products_dataset
UNION ALL SELECT 'sellers',      COUNT(*) FROM raw.olist_sellers_dataset
UNION ALL SELECT 'category_translation', COUNT(*) FROM raw.product_category_name_translation;
-- Rough expectation: orders ≈ 99k · items ≈ 113k · payments ≈ 104k · reviews ≈ 99k
--                    customers ≈ 99k · products ≈ 33k · sellers ≈ 3.1k · geolocation ≈ 1M
