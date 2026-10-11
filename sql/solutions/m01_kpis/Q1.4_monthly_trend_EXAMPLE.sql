/* =====================================================================
   CASE ID    : Q1.4  (WORKED EXAMPLE — study the documentation standard;
                       solve every other case yourself before looking at help!)
   CASE TITLE : The Growth Chart
   DIFFICULTY : 🟢                                      
   =====================================================================

   1. THE STORY
      Requester : Helena Duarte, CEO
      Situation : The board will stare at one chart: orders and revenue per
                  month. Investors suspect growth has stalled.
      Decision  : Whether to present 2018 as "slowdown" or "still growing".

   2. METRIC DEFINITIONS
      Orders  = distinct DELIVERED orders, by purchase month
      Revenue = SUM(order_items.price)   (excludes freight)
      Freight = SUM(order_items.freight_value)

   3. GRAIN & TABLES
      Output grain : one row per calendar month
      Tables       : olist.orders (1) --- (many) olist.order_items

   4. ASSUMPTIONS & DECISIONS
      - Only order_status = 'delivered' (realised revenue).
      - Early (2016) and last months are incomplete (see Q0.2) -> kept in the
        output but flagged; headline uses only complete months.

   5. APPROACH
      Join orders to items -> filter delivered -> truncate purchase timestamp
      to month -> aggregate. COUNT(DISTINCT order_id), because the join repeats
      an order once per item (fan-out!).
   ===================================================================== */

SET search_path TO olist, public;

SELECT
    date_trunc('month', o.order_purchase_timestamp)::date AS month,
    COUNT(DISTINCT o.order_id)                            AS orders,
    ROUND(SUM(oi.price), 2)                               AS item_revenue,
    ROUND(SUM(oi.freight_value), 2)                       AS freight,
    ROUND(SUM(oi.price) / COUNT(DISTINCT o.order_id), 2)  AS revenue_per_order
FROM orders o
JOIN order_items oi USING (order_id)
WHERE o.order_status = 'delivered'
GROUP BY 1
ORDER BY 1;

-- VALIDATION
-- [x] SUM(item_revenue) over all months = SUM(price) of delivered orders (independent query)
-- [x] COUNT(DISTINCT order_id) total = delivered orders from Q0.3
-- [x] Replaced COUNT(DISTINCT) with COUNT(*) -> bigger number => proves the fan-out

/* THE STORY (what "good" looks like — numbers deliberately left as placeholders)
   HEADLINE : Orders grew strongly through 2017 and plateaued in 2018; the sharp
              drop in the final months is a data-window artefact, not a decline.
   EVIDENCE : Complete-month orders rose from <A> (Jan-17) to <B> (Aug-18);
              the November-2017 spike (<C>) is Black Friday.
   ACTION   : Present growth using complete months only; investigate WHY 2018 is
              flat (new vs returning customers -> Q7.2).
   RISKS    : Only delivered orders are counted; canceled orders are excluded. */
