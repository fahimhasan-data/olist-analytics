-- =====================================================================
-- 02_keys_indexes.sql — run AFTER 01_build_clean_schema.sql (PostgreSQL 18)
-- Adds primary keys where the grain is clean + indexes on join columns.
-- If a PRIMARY KEY fails, you found duplicates -> that is a data finding (see Q0.4); investigate, don't force it.
-- Foreign keys are intentionally NOT added: whether they would succeed is
-- itself a data-quality finding (see problem Q0.5).
-- order_reviews and geolocation get NO primary key: their grain is messy (Q0.4, Q0.8).
-- =====================================================================
SET search_path TO olist, public;

ALTER TABLE customers            ADD PRIMARY KEY (customer_id);
ALTER TABLE sellers              ADD PRIMARY KEY (seller_id);
ALTER TABLE products             ADD PRIMARY KEY (product_id);
ALTER TABLE orders               ADD PRIMARY KEY (order_id);
ALTER TABLE order_items          ADD PRIMARY KEY (order_id, order_item_id);
ALTER TABLE order_payments       ADD PRIMARY KEY (order_id, payment_sequential);
ALTER TABLE category_translation ADD PRIMARY KEY (product_category_name);

CREATE INDEX idx_orders_customer     ON orders (customer_id);
CREATE INDEX idx_orders_purchase_ts  ON orders (order_purchase_timestamp);
CREATE INDEX idx_orders_status       ON orders (order_status);
CREATE INDEX idx_items_product       ON order_items (product_id);
CREATE INDEX idx_items_seller        ON order_items (seller_id);
CREATE INDEX idx_reviews_order       ON order_reviews (order_id);
CREATE INDEX idx_customers_unique    ON customers (customer_unique_id);
CREATE INDEX idx_geo_zip             ON geolocation (geolocation_zip_code_prefix);

ANALYZE;  -- refresh planner statistics
