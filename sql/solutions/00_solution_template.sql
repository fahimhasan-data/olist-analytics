/* =====================================================================
   CASE ID    : Q<chapter>.<n>            (e.g. Q3.2)  or  C<n> for capstones
   CASE TITLE : <title from the Problem Bank>
   DIFFICULTY : 🟢 / 🟡 / 🔴            AUTHOR: <you>          DATE: <YYYY-MM-DD>
   =====================================================================

   1. THE STORY  (who asked, what is at stake?)
      Requester : <e.g. Carlos Mendes, COO>
      Situation : <1-2 sentences in your own words>
      Decision this analysis supports : <what will they do with the answer?>

   2. METRIC DEFINITIONS  (precision here is what interviewers look for)
      e.g. "Late" = order_delivered_customer_date > order_estimated_delivery_date
           Revenue = SUM(order_items.price), delivered orders only

   3. GRAIN & TABLES
      Output grain : one row per ...
      Tables used  : olist.orders, olist.order_items, ...
      Joins        : orders.order_id = order_items.order_id   (1 : many)

   4. ASSUMPTIONS & DECISIONS
      - Excluded canceled/unavailable orders because ...
      - Used customer_unique_id (not customer_id) because ...
      - Analysis window: <from Q0.2>

   5. APPROACH  (plain English, 2-5 lines)
      Step 1 -> Step 2 -> Step 3
   ===================================================================== */

SET search_path TO olist, public;

-- ---------- QUERY ----------------------------------------------------
WITH base AS (
    SELECT 1 AS placeholder          -- replace with your first logical step
)
SELECT *
FROM base;

-- ---------- VALIDATION (never skip: two independent checks) ----------
-- [ ] Row count matches the expected grain?
-- [ ] Totals reconcile with a simpler, independent query?
-- [ ] NULLs / duplicates / fan-out checked?
-- [ ] Edge cases (incomplete months, canceled orders) handled?

-- ---------- RESULT SNAPSHOT (paste the top rows as a comment) --------
-- month      | orders | revenue
-- 2018-01-01 | ...    | ...

/* ---------- THE STORY  (Headline -> Evidence -> Action) --------------
   HEADLINE : one sentence a CEO could repeat in a lift.
   EVIDENCE : 2-3 numbers from the query above (state the definition used).
   ACTION   : what should the business do? What would you analyse next?
   RISKS    : what could make this conclusion wrong?
   ------------------------------------------------------------------- */
