# Chapter 4 — Code Review with Marina

> *Thursday, 16:30. Marina pulls up one of your queries on the big screen. Seven nested subqueries. Nobody speaks. "It's correct. I checked. But in six months **you** won't be able to read this, and I certainly can't. Today we learn to write SQL that a colleague can understand in 30 seconds."*

**🎯 Chapter goal:** structure multi-step logic with CTEs, subqueries and EXISTS.

## ✅ Case tracker (change `[ ]` to `[x]` when a case is solved, validated and committed)

- [ ] **Q4.1** 🟢 Bigger Than Average · ⏱ 20 min → `Q4.1_bigger_than_average.sql`
- [ ] **Q4.2** 🟡 Big Spenders in Their Own Backyard · ⏱ 35 min → `Q4.2_big_spenders_in_their_own_backyard.sql`
- [ ] **Q4.3** 🟡 Last Seen · ⏱ 35 min → `Q4.3_last_seen.sql`
- [ ] **Q4.4** 🟡 Overpriced? · ⏱ 35 min → `Q4.4_overpriced.sql`
- [ ] **Q4.5** 🟡 Unhappy But Loyal? · ⏱ 40 min → `Q4.5_unhappy_but_loyal.sql`
- [ ] **Q4.6** 🔴 The Order Funnel · ⏱ 50 min → `Q4.6_the_order_funnel.sql`
- [ ] **Q4.7** 🔴 All Eggs, One Basket · ⏱ 50 min → `Q4.7_all_eggs_one_basket.sql`
- [ ] **Q4.8** 🟡 The Query That Returned Nothing · ⏱ 25 min → `Q4.8_the_query_that_returned_nothing.sql`

## 📂 What goes in this folder
- One `.sql` file per case, named like the suggestions above (`Q<chapter>.<n>_<short_title>.sql`).
- Start every file from [`../00_solution_template.sql`](../00_solution_template.sql): story, metric definitions, grain, assumptions, query, validation, insight.
- When the chapter is finished, write the chapter note in `reports/chapter_notes/m04.md` (Headline → Evidence → Action).

📖 Case descriptions: [Problem Bank → Chapter 4](../../../docs/02_SQL_PROBLEM_BANK.md#module-4-code-review-with-marina)

_Git habit:_ one chapter = one branch (e.g. `feat/sql-m04-subqueries-ctes`) = one pull request.
