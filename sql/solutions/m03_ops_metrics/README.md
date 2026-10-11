# Chapter 3 — The Monday Ops Review

> *Monday, 09:00. Carlos opens the ops review with one slide: a screenshot of angry customer tweets. "We keep saying 'delivery is fine'. I don't believe it. Give me real numbers: how late, where, when, and what it costs us in customer happiness."*

**🎯 Chapter goal:** operational KPIs with conditional aggregation, percentiles and careful definitions.

## ✅ Case tracker (change `[ ]` to `[x]` when a case is solved, validated and committed)

- [ ] **Q3.1** 🟢 Are Cancellations Getting Worse? · ⏱ 20 min → `Q3.1_are_cancellations_getting_worse.sql`
- [ ] **Q3.2** 🟡 What Does "Late" Mean? · ⏱ 35 min → `Q3.2_what_does_late_mean.sql`
- [ ] **Q3.3** 🟡 Average Is a Liar · ⏱ 35 min → `Q3.3_average_is_a_liar.sql`
- [ ] **Q3.4** 🟡 Where Does the Time Go? · ⏱ 35 min → `Q3.4_where_does_the_time_go.sql`
- [ ] **Q3.5** 🟡 The Status Board · ⏱ 25 min → `Q3.5_the_status_board.sql`
- [ ] **Q3.6** 🟡 What Does a Late Parcel Cost Us? · ⏱ 40 min → `Q3.6_what_does_a_late_parcel_cost_us.sql`
- [ ] **Q3.7** 🟡 The Disappointing Categories · ⏱ 30 min → `Q3.7_the_disappointing_categories.sql`
- [ ] **Q3.8** 🟡 Split Payments · ⏱ 30 min → `Q3.8_split_payments.sql`
- [ ] **Q3.9** 🟡 Voucher Effect · ⏱ 30 min → `Q3.9_voucher_effect.sql`
- [ ] **Q3.10** 🔴 Are We Sandbagging the Promise? · ⏱ 45 min → `Q3.10_are_we_sandbagging_the_promise.sql`
- [ ] **Q3.11** 🟡 Does the Weekend Slow Us Down? · ⏱ 30 min → `Q3.11_does_the_weekend_slow_us_down.sql`

## 📂 What goes in this folder
- One `.sql` file per case, named like the suggestions above (`Q<chapter>.<n>_<short_title>.sql`).
- Start every file from [`../00_solution_template.sql`](../00_solution_template.sql): story, metric definitions, grain, assumptions, query, validation, insight.
- When the chapter is finished, write the chapter note in `reports/chapter_notes/m03.md` (Headline → Evidence → Action).

📖 Case descriptions: [Problem Bank → Chapter 3](../../../docs/SQL_PROBLEM_BANK.md#module-3-the-monday-ops-review)

_Git habit:_ one chapter = one branch (e.g. `feat/sql-m03-ops-metrics`) = one pull request.
