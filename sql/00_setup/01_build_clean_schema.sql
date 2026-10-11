-- =====================================================================
-- 01_build_clean_schema.sql           (PostgreSQL 18 · DBeaver)
-- STEP 2 of setup: turn the raw tables YOU imported (schema `raw`) into a clean,
-- correctly-typed analysis schema called  olist.
--
--   • Works whether DBeaver stored columns as TEXT, VARCHAR, FLOAT or real types
--   • Converts empty strings to NULL, fixes timestamp/number types
--   • Gives short, friendly table names (orders, customers, ...)
--   • Fixes Kaggle's misspelled columns (lenght -> length)
--   • Never modifies your raw tables — you can re-run this script any time
--
-- HOW TO RUN: open in DBeaver -> Execute Script (Alt+X) once.
-- IF YOUR TABLE NAMES / SCHEMA DIFFER (e.g. you imported into `public`): edit ONLY the "EDIT HERE" block below.
-- =====================================================================

CREATE SCHEMA IF NOT EXISTS olist;

DO $build$
DECLARE
    -- ============================ EDIT HERE ============================
    src            text := 'raw';                            -- schema where DBeaver imported the CSVs
    t_customers    text := 'olist_customers_dataset';
    t_geolocation  text := 'olist_geolocation_dataset';
    t_items        text := 'olist_order_items_dataset';
    t_payments     text := 'olist_order_payments_dataset';
    t_reviews      text := 'olist_order_reviews_dataset';
    t_orders       text := 'olist_orders_dataset';
    t_products     text := 'olist_products_dataset';
    t_sellers      text := 'olist_sellers_dataset';
    t_translation  text := 'product_category_name_translation';
    -- ===================================================================
    c_name_len text;
    c_desc_len text;
BEGIN
    -- Kaggle spells these two columns "lenght"; some people fix them on import.
    SELECT column_name INTO c_name_len FROM information_schema.columns
     WHERE table_schema = src AND table_name = t_products
       AND column_name IN ('product_name_lenght', 'product_name_length');
    SELECT column_name INTO c_desc_len FROM information_schema.columns
     WHERE table_schema = src AND table_name = t_products
       AND column_name IN ('product_description_lenght', 'product_description_length');
    IF c_name_len IS NULL OR c_desc_len IS NULL THEN
        RAISE EXCEPTION 'Could not find product_name_length/description_length in %.% — check names in the EDIT HERE block', src, t_products;
    END IF;

    -- Start clean (CASCADE removes dependent views from earlier attempts)
    DROP TABLE IF EXISTS olist.order_reviews, olist.order_payments, olist.order_items,
                         olist.orders, olist.customers, olist.products, olist.sellers,
                         olist.geolocation, olist.category_translation CASCADE;

    EXECUTE format($q$
        CREATE TABLE olist.customers AS
        SELECT customer_id::text                                     AS customer_id,
               customer_unique_id::text                              AS customer_unique_id,
               NULLIF(customer_zip_code_prefix::text,'')::numeric::integer AS customer_zip_code_prefix,
               customer_city::text                                   AS customer_city,
               customer_state::char(2)                               AS customer_state
        FROM %I.%I $q$, src, t_customers);

    EXECUTE format($q$
        CREATE TABLE olist.sellers AS
        SELECT seller_id::text                                       AS seller_id,
               NULLIF(seller_zip_code_prefix::text,'')::numeric::integer AS seller_zip_code_prefix,
               seller_city::text                                     AS seller_city,
               seller_state::char(2)                                 AS seller_state
        FROM %I.%I $q$, src, t_sellers);

    EXECUTE format($q$
        CREATE TABLE olist.geolocation AS
        SELECT NULLIF(geolocation_zip_code_prefix::text,'')::numeric::integer AS geolocation_zip_code_prefix,
               NULLIF(geolocation_lat::text,'')::double precision    AS geolocation_lat,
               NULLIF(geolocation_lng::text,'')::double precision    AS geolocation_lng,
               geolocation_city::text                                AS geolocation_city,
               geolocation_state::char(2)                            AS geolocation_state
        FROM %I.%I $q$, src, t_geolocation);

    EXECUTE format($q$
        CREATE TABLE olist.category_translation AS
        SELECT product_category_name::text         AS product_category_name,
               product_category_name_english::text AS product_category_name_english
        FROM %I.%I $q$, src, t_translation);

    EXECUTE format($q$
        CREATE TABLE olist.products AS
        SELECT product_id::text                                      AS product_id,
               NULLIF(product_category_name::text,'')                AS product_category_name,
               NULLIF(%I::text,'')::numeric::integer                 AS product_name_length,
               NULLIF(%I::text,'')::numeric::integer                 AS product_description_length,
               NULLIF(product_photos_qty::text,'')::numeric::integer AS product_photos_qty,
               NULLIF(product_weight_g::text,'')::numeric::integer   AS product_weight_g,
               NULLIF(product_length_cm::text,'')::numeric::integer  AS product_length_cm,
               NULLIF(product_height_cm::text,'')::numeric::integer  AS product_height_cm,
               NULLIF(product_width_cm::text,'')::numeric::integer   AS product_width_cm
        FROM %I.%I $q$, c_name_len, c_desc_len, src, t_products);

    EXECUTE format($q$
        CREATE TABLE olist.orders AS
        SELECT order_id::text                                        AS order_id,
               customer_id::text                                     AS customer_id,
               order_status::text                                    AS order_status,
               NULLIF(order_purchase_timestamp::text,'')::timestamp      AS order_purchase_timestamp,
               NULLIF(order_approved_at::text,'')::timestamp             AS order_approved_at,
               NULLIF(order_delivered_carrier_date::text,'')::timestamp  AS order_delivered_carrier_date,
               NULLIF(order_delivered_customer_date::text,'')::timestamp AS order_delivered_customer_date,
               NULLIF(order_estimated_delivery_date::text,'')::timestamp AS order_estimated_delivery_date
        FROM %I.%I $q$, src, t_orders);

    EXECUTE format($q$
        CREATE TABLE olist.order_items AS
        SELECT order_id::text                                        AS order_id,
               NULLIF(order_item_id::text,'')::numeric::integer      AS order_item_id,
               product_id::text                                      AS product_id,
               seller_id::text                                       AS seller_id,
               NULLIF(shipping_limit_date::text,'')::timestamp       AS shipping_limit_date,
               NULLIF(price::text,'')::numeric(12,2)                 AS price,
               NULLIF(freight_value::text,'')::numeric(12,2)         AS freight_value
        FROM %I.%I $q$, src, t_items);

    EXECUTE format($q$
        CREATE TABLE olist.order_payments AS
        SELECT order_id::text                                        AS order_id,
               NULLIF(payment_sequential::text,'')::numeric::integer AS payment_sequential,
               payment_type::text                                    AS payment_type,
               NULLIF(payment_installments::text,'')::numeric::integer AS payment_installments,
               NULLIF(payment_value::text,'')::numeric(12,2)         AS payment_value
        FROM %I.%I $q$, src, t_payments);

    EXECUTE format($q$
        CREATE TABLE olist.order_reviews AS
        SELECT review_id::text                                       AS review_id,
               order_id::text                                        AS order_id,
               NULLIF(review_score::text,'')::numeric::integer       AS review_score,
               NULLIF(review_comment_title::text,'')                 AS review_comment_title,
               NULLIF(review_comment_message::text,'')               AS review_comment_message,
               NULLIF(review_creation_date::text,'')::timestamp      AS review_creation_date,
               NULLIF(review_answer_timestamp::text,'')::timestamp   AS review_answer_timestamp
        FROM %I.%I $q$, src, t_reviews);

    RAISE NOTICE 'olist schema built successfully.';
END
$build$;

-- ---------------------------------------------------------------------
-- VERIFY: clean tables vs raw tables should show identical row counts,
-- and data types should now be timestamp / numeric / integer (not text).
-- ---------------------------------------------------------------------
SELECT table_name, column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'olist'
  AND (column_name LIKE '%timestamp%' OR column_name LIKE '%_date' OR column_name LIKE '%_at'
       OR column_name IN ('price','freight_value','payment_value'))
ORDER BY table_name, column_name;
