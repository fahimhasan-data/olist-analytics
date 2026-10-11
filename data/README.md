# Data

Raw data is **not stored in Git** (size + license).

1. Download: https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce
2. Unzip the 9 CSV files into `data/raw/`
3. Create the database and import into schema `raw`: see `docs/guides/DBEAVER_DATABASE_AND_UPLOAD_GUIDE.md`
4. Run `sql/00_setup/00_inspect_loaded_tables.sql`, `01_build_clean_schema.sql`, `02_keys_indexes.sql`

Expected files:
```
olist_customers_dataset.csv        olist_orders_dataset.csv
olist_geolocation_dataset.csv      olist_order_payments_dataset.csv
olist_order_items_dataset.csv      olist_order_reviews_dataset.csv
olist_products_dataset.csv         olist_sellers_dataset.csv
product_category_name_translation.csv
```
License: CC BY-NC-SA 4.0 (Olist). Credit the source in any publication.
