# Chapter 0 — Day One: Trust Nothing

> *Monday, 08:45. Marina slides a coffee across the desk. "Diego loaded the CSVs on Friday. The log says **success**. I've learnt not to believe logs. In this team **no number leaves the building until the data has been audited** — your first week is that audit."*

**🎯 Chapter goal:** know what one row means in every table, and prove which parts of the data can be trusted.

## ✅ Case tracker (change `[ ]` to `[x]` when a case is solved, validated and committed)

- [ ] **Q0.1** 🟢 The Roll Call · ⏱ 10 min → `Q0.1_the_roll_call.sql`
- [ ] **Q0.2** 🟢 The Missing Months · ⏱ 20 min → `Q0.2_the_missing_months.sql`
- [ ] **Q0.3** 🟢 Delivered… But Not Really · ⏱ 25 min → `Q0.3_delivered_but_not_really.sql`
- [ ] **Q0.4** 🟡 The 0% Repeat-Rate Disaster · ⏱ 30 min → `Q0.4_the_0_repeat_rate_disaster.sql`
- [ ] **Q0.5** 🟡 Orphan Hunt · ⏱ 30 min → `Q0.5_orphan_hunt.sql`
- [ ] **Q0.6** 🟡 The Time Travellers · ⏱ 25 min → `Q0.6_the_time_travellers.sql`
- [ ] **Q0.7** 🟡 The Mystery Category · ⏱ 20 min → `Q0.7_the_mystery_category.sql`
- [ ] **Q0.8** 🔴 The Map That Doubled Our Orders · ⏱ 40 min → `Q0.8_the_map_that_doubled_our_orders.sql`
- [ ] **Q0.9** 🔴 "Is the Data Healthy Today?" · ⏱ 60 min → `Q0.9_is_the_data_healthy_today.sql`

## 📂 What goes in this folder
- One `.sql` file per case, named like the suggestions above (`Q<chapter>.<n>_<short_title>.sql`).
- Start every file from [`../00_solution_template.sql`](../00_solution_template.sql): story, metric definitions, grain, assumptions, query, validation, insight.
- When the chapter is finished, write the chapter note in `reports/chapter_notes/m00.md` (Headline → Evidence → Action).

📖 Case descriptions: [Problem Bank → Chapter 0](../../../docs/02_SQL_PROBLEM_BANK.md#module-0-day-one-trust-nothing)

_Git habit:_ one chapter = one branch (e.g. `feat/sql-m00-profiling`) = one pull request.
