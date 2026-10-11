# 📘 Data Dictionary — Olist (schema `olist`)

*Row counts are approximate — **verify them yourself** (Q0.1).*

## Tables, grain & keys

| Table | One row = (grain) | Key | ≈ Rows |
|---|---|---|---:|
| `customers` | a customer record **per order** | `customer_id` (unique); `customer_unique_id` = the real person | 99k |
| `orders` | one order | `order_id` | 99k |
| `order_items` | one **item** within an order | `(order_id, order_item_id)` | 113k |
| `order_payments` | one payment entry (orders can split payments) | `(order_id, payment_sequential)` | 104k |
| `order_reviews` | one review **(grain is messy)** | none clean | 99k |
| `products` | one product | `product_id` | 33k |
| `sellers` | one seller | `seller_id` | 3.1k |
| `category_translation` | Portuguese → English category | `product_category_name` | 71 |
| `geolocation` | a lat/lng sample for a zip prefix **(many per prefix)** | none | ~1M |

## Join map

| From | To | On | Cardinality |
|---|---|---|---|
| orders | customers | `customer_id` | many : 1 |
| orders | order_items | `order_id` | 1 : many |
| orders | order_payments | `order_id` | 1 : many |
| orders | order_reviews | `order_id` | 1 : many (usually 1) |
| order_items | products | `product_id` | many : 1 |
| order_items | sellers | `seller_id` | many : 1 |
| products | category_translation | `product_category_name` | many : 1 |
| customers / sellers | geolocation | zip prefix | **many : many ⚠️ (dedupe first)** |

## Key columns

| Column | Meaning |
|---|---|
| `order_status` | `created, approved, invoiced, processing, shipped, delivered, unavailable, canceled` |
| `order_purchase_timestamp` | when the customer placed the order |
| `order_approved_at` | payment approval time |
| `order_delivered_carrier_date` | when the seller handed over to the logistics partner |
| `order_delivered_customer_date` | actual delivery to customer |
| `order_estimated_delivery_date` | delivery date promised at purchase |
| `price`, `freight_value` | per item, in BRL; freight is **not** in `price` |
| `shipping_limit_date` | seller's deadline to hand the item to the carrier |
| `payment_type` | `credit_card, boleto, voucher, debit_card, not_defined` |
| `payment_installments` | number of installments chosen |
| `review_score` | 1 (worst) – 5 (best) |

## ⚠️ Known traps (each one is tested in the problem bank)

| Trap | Consequence | Problem |
|---|---|---|
| `customer_id` is unique per order | repeat-purchase rate looks like ~0% | Q0.4, Q7.1 |
| Joining items × payments × reviews | revenue inflated (fan-out) | Q2.4 |
| `geolocation` has many rows per zip | duplicated rows after join | Q0.8 |
| `review_id` repeats; orders with several reviews | wrong review averages | Q0.4, Q5.9, Q10.6 |
| Incomplete first/last months | fake growth or fake decline | Q0.2, Q5.10 |
| `price` vs `payment_value` vs `price+freight` | three "revenues" | Q1.2 |
| Canceled/unavailable orders may still have items | revenue overstated | Q3.1, C3 |
| Products with NULL category / missing translation | blank categories in BI | Q0.7 |
| Timestamps with illogical order | negative durations | Q0.6 |
| Timestamps are local Brazilian time, no time zone | careful with date boundaries | Q6.7 |
| Portuguese text in reviews | keyword search needs accents handled | Q6.5 |

## Naming conventions used in this repo

- Tables/columns: `snake_case`, English where possible (Kaggle's `lenght` typo corrected).
- Solution files: `Q<module>.<n>_<short_title>.sql`, e.g. `Q3.2_late_delivery_rate.sql`.
- Views: `v_…` · materialized views: `mv_…` · functions: `fn_…` · marts: schema `mart`.
