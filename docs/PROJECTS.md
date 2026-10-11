# 🏆 Portfolio Projects

The [Problem Bank](SQL_PROBLEM_BANK.md) has 122 cases. That is a **learning track**: every case is worth doing, but not every case deserves a polished write-up. A reviewer will spend about two minutes on this repo, so five projects are curated from the cases. Each answers one business question end to end.

## ✅ What "showcase-ready" means

A project counts as done only when **all** of these exist:

- [ ] SQL files for every case in the project follow [`sql/solutions/00_solution_template.sql`](../sql/solutions/00_solution_template.sql) (definitions, grain, assumptions, **two independent validation checks**)
- [ ] A one-page write-up in `reports/insights/` with: a one-sentence pitch, a headline, **3 findings with numbers**, **2–3 sized recommendations**, risks and assumptions, and what to analyse next
- [ ] At least **one chart or diagram** in `reports/figures/`, embedded in the write-up (build it in any tool; the analysis itself stays in SQL)
- [ ] A row added to the **Key insights** table in the main README (finding, number, recommendation)
- [ ] A **learning-log** entry: what was hard, what I would do differently
- [ ] Merged through a pull request using the PR template

## 🗂️ The five projects

### P1 · Growth & trusted KPIs
**Question:** Is growth really slowing, and can the board trust the numbers?
**Cases:** Q0.2 · Q0.4 · Q1.1–Q1.4 · Q2.4 · Q5.10 · C3 *(Reconcile the Revenue)* · **C1 *(Is Growth Really Slowing?)***
**Skills:** data audit, metric definitions, fan-out control, honest year-over-year comparison
**Deliverable:** `reports/insights/C1_growth.md` + a chart of monthly orders with incomplete months flagged

### P2 · Late deliveries
**Question:** Where do deliveries run late, and how do we cut them by 30%?
**Cases:** Q3.2 · Q3.3 · Q3.4 · Q3.6 · Q3.10 · Q8.3 · Q8.5 · Q8.9 · **C2 *(Cut Late Deliveries by 30%)***
**Skills:** conditional aggregation, percentiles, lane analysis, seller-vs-carrier root cause
**Deliverable:** one-pager with a sized recommendation + a late-rate-by-route or by-stage chart

### P3 · Retention & marketing
**Question:** Why do so few customers come back, and where should marketing spend?
**Cases:** Q0.4 · Q7.1 · Q7.2 · Q7.3 · Q7.5 · Q7.8 · **C4 *(Where Should Marketing Spend?)***
**Skills:** `customer_unique_id` vs `customer_id`, cohorts, RFM segments, impact of late delivery on repeat purchase
**Deliverable:** one-pager + a cohort retention heat-map or curve

### P4 · Seller quality
**Question:** Which sellers should we coach, and which should we drop?
**Cases:** Q8.1 · Q8.2 · Q8.3 · Q8.8 · **C5 *(Coach or Drop?)***
**Skills:** scorecards, thresholds with minimum-volume rules, concentration risk
**Deliverable:** one-pager + a seller watch-list table (anonymised IDs are fine)

### P5 · Analytics data model
**Question:** Can the raw tables become a fast, reusable reporting model?
**Cases:** Q11.2 · **Q11.3 *(The Star Schema)*** · Q11.4 · Q11.5 · Q11.9 *(One-Click Rebuild)*
**Skills:** dimensional modelling, views/materialised views, `EXPLAIN`, reproducible builds
**Deliverable:** ER diagram in `reports/figures/`, the model build script, and a before/after `EXPLAIN` comparison

## 🧭 Suggested order

| Phase | Learning chapters | Project finished |
|---|---|---|
| 1 | 0 → 1 → 2 | **P1** |
| 2 | 3 → 4 → 5 | **P2** |
| 3 | 6 → 7 | **P3** |
| 4 | 8 | **P4** |
| 5 | 9 → 10 → 11 | **P5** |
| 6 | remaining capstones C6–C8 | optional extras |

A few cases (Q0.4, Q8.3) serve two projects; solve them once and reuse them.

Don't wait until the end to write: draft each one-pager as soon as its last case is validated, while the details are fresh.

## 📊 Status

| Project | Cases done | One-pager | Chart | Merged |
|---|:--:|:--:|:--:|:--:|
| P1 | 0 / 10 | ⬜ | ⬜ | ⬜ |
| P2 | 0 / 9 | ⬜ | ⬜ | ⬜ |
| P3 | 0 / 7 | ⬜ | ⬜ | ⬜ |
| P4 | 0 / 5 | ⬜ | ⬜ | ⬜ |
| P5 | 0 / 5 | ⬜ | ⬜ | ⬜ |
