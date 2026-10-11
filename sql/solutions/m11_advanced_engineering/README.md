# Chapter 11 — Building the Platform

> *Diego leans over your monitor. "You've been querying raw tables for weeks. That's fine for exploring — terrible for a company. Let's turn your work into a **reliable data product**: a star schema for reporting, fast views, reusable functions, and a pipeline that rebuilds itself."*

**🎯 Chapter goal:** from writing queries to building trustworthy data assets.

## ✅ Case tracker (change `[ ]` to `[x]` when a case is solved, validated and committed)

- [ ] **Q11.1** 🔴 Streaks and Droughts · ⏱ 60 min → `Q11.1_streaks_and_droughts.sql`
- [ ] **Q11.2** 🔴 A Real Calendar · ⏱ 45 min → `Q11.2_a_real_calendar.sql`
- [ ] **Q11.3** 🔴 The Star Schema · ⏱ 120 min → `Q11.3_the_star_schema.sql`
- [ ] **Q11.4** 🔴 Fast Dashboards · ⏱ 60 min → `Q11.4_fast_dashboards.sql`
- [ ] **Q11.5** 🔴 Why Is This Query Slow? · ⏱ 75 min → `Q11.5_why_is_this_query_slow.sql`
- [ ] **Q11.6** 🔴 The Alarm Bell · ⏱ 50 min → `Q11.6_the_alarm_bell.sql`
- [ ] **Q11.7** 🔴 Top 3 Per Seller · ⏱ 45 min → `Q11.7_top_3_per_seller.sql`
- [ ] **Q11.8** 🔴 A Seller Lookup Function · ⏱ 45 min → `Q11.8_a_seller_lookup_function.sql`
- [ ] **Q11.9** 🔴 One-Click Rebuild · ⏱ 90 min → `Q11.9_one_click_rebuild.sql`

## 📂 What goes in this folder
- One `.sql` file per case, named like the suggestions above (`Q<chapter>.<n>_<short_title>.sql`).
- Start every file from [`../00_solution_template.sql`](../00_solution_template.sql): story, metric definitions, grain, assumptions, query, validation, insight.
- When the chapter is finished, write the chapter note in `reports/chapter_notes/m11.md` (Headline → Evidence → Action).

📖 Case descriptions: [Problem Bank → Chapter 11](../../../docs/SQL_PROBLEM_BANK.md#module-11-building-the-platform)

_Git habit:_ one chapter = one branch (e.g. `feat/sql-m11-advanced-engineering`) = one pull request.
