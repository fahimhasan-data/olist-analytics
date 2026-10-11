-- =====================================================================
-- A1_create_empty_tables.sql   (ALTERNATIVE PATH — only if you want to start fresh)
-- Creates the `olist` schema with empty, correctly typed tables (PostgreSQL 18).
-- If you already imported the CSVs, SKIP this folder and use 00 -> 01 -> 02 in the parent folder.
-- =====================================================================

-- Run in DBeaver: open this file -> Execute Script (Alt+X)
-- NOTE: Table names are shortened vs. the Kaggle CSV file names, and the
--       two misspelled Kaggle columns ("lenght") are corrected.
-- =====================================================================

CREATE SCHEMA IF NOT EXISTS olist;
SET search_path TO olist, public;

DROP TABLE IF EXISTS olist.order_reviews        CASCADE;
DROP TABLE IF EXISTS olist.order_payments       CASCADE;
DROP TABLE IF EXISTS olist.order_items          CASCADE;
DROP TABLE IF EXISTS olist.orders               CASCADE;
DROP TABLE IF EXISTS olist.customers            CASCADE;
DROP TABLE IF EXISTS olist.products             CASCADE;
DROP TABLE IF EXISTS olist.sellers              CASCADE;
DROP TABLE IF EXISTS olist.geolocation          CASCADE;
DROP TABLE IF EXISTS olist.category_translation CASCADE;

-- One row per ORDER's customer record. customer_id is unique PER ORDER;
-- customer_unique_id identifies the real PERSON (can repeat across orders).
CREATE TABLE olist.customers (
    customer_id              TEXT,
    customer_unique_id       TEXT,
    customer_zip_code_prefix INTEGER,
    customer_city            TEXT,
    customer_state           CHAR(2)
);

CREATE TABLE olist.sellers (
    seller_id              TEXT,
    seller_zip_code_prefix INTEGER,
    seller_city            TEXT,
    seller_state           CHAR(2)
);

-- Many rows per zip prefix (see problem Q0.8)
CREATE TABLE olist.geolocation (
    geolocation_zip_code_prefix INTEGER,
    geolocation_lat             DOUBLE PRECISION,
    geolocation_lng             DOUBLE PRECISION,
    geolocation_city            TEXT,
    geolocation_state           CHAR(2)
);

CREATE TABLE olist.category_translation (
    product_category_name         TEXT,
    product_category_name_english TEXT
);

CREATE TABLE olist.products (
    product_id                 TEXT,
    product_category_name      TEXT,
    product_name_length        INTEGER,   -- CSV header: product_name_lenght
    product_description_length INTEGER,   -- CSV header: product_description_lenght
    product_photos_qty         INTEGER,
    product_weight_g           INTEGER,
    product_length_cm          INTEGER,
    product_height_cm          INTEGER,
    product_width_cm           INTEGER
);

CREATE TABLE olist.orders (
    order_id                      TEXT,
    customer_id                   TEXT,
    order_status                  TEXT,
    order_purchase_timestamp      TIMESTAMP,
    order_approved_at             TIMESTAMP,
    order_delivered_carrier_date  TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);

-- Grain: one row per ITEM inside an order (order_id + order_item_id)
CREATE TABLE olist.order_items (
    order_id            TEXT,
    order_item_id       INTEGER,
    product_id          TEXT,
    seller_id           TEXT,
    shipping_limit_date TIMESTAMP,
    price               NUMERIC(12,2),
    freight_value       NUMERIC(12,2)
);

-- Grain: one row per PAYMENT ENTRY (an order can have several)
CREATE TABLE olist.order_payments (
    order_id             TEXT,
    payment_sequential   INTEGER,
    payment_type         TEXT,
    payment_installments INTEGER,
    payment_value        NUMERIC(12,2)
);

-- Grain: NOT clean. review_id repeats across orders; an order can have >1 review.
CREATE TABLE olist.order_reviews (
    review_id               TEXT,
    order_id                TEXT,
    review_score            INTEGER,
    review_comment_title    TEXT,
    review_comment_message  TEXT,
    review_creation_date    TIMESTAMP,
    review_answer_timestamp TIMESTAMP
);
