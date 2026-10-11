# Chapter 2 — The Case of the Inflated Revenue

> *Wednesday. The finance team's Slack channel lights up. Diego's new dashboard shows revenue **far higher** than the ledger. Bia sends one message to the whole analytics team: "**Someone explain this before the board.**"*

**🎯 Chapter goal:** master joins, spot fan-out, build trustworthy order-level data.

## ✅ Case tracker (change `[ ]` to `[x]` when a case is solved, validated and committed)

- [ ] **Q2.1** 🟢 What Do We Sell? · ⏱ 25 min → `Q2.1_what_do_we_sell.sql`
- [ ] **Q2.2** 🟢 Revenue Map · ⏱ 25 min → `Q2.2_revenue_map.sql`
- [ ] **Q2.3** 🟡 Meet the Heavyweights · ⏱ 30 min → `Q2.3_meet_the_heavyweights.sql`
- [ ] **Q2.4** 🔴 The Smoking Gun · ⏱ 60 min → `Q2.4_the_smoking_gun.sql`
- [ ] **Q2.5** 🟡 Dead Stock · ⏱ 25 min → `Q2.5_dead_stock.sql`
- [ ] **Q2.6** 🟡 Crossing State Lines · ⏱ 30 min → `Q2.6_crossing_state_lines.sql`
- [ ] **Q2.7** 🟡 Boleto Lovers · ⏱ 35 min → `Q2.7_boleto_lovers.sql`
- [ ] **Q2.8** 🔴 The Two-Seller Order · ⏱ 45 min → `Q2.8_the_two_seller_order.sql`
- [ ] **Q2.9** 🔴 One Big Order Table · ⏱ 75 min → `Q2.9_one_big_order_table.sql`
- [ ] **Q2.10** 🟡 Specialists vs Generalists · ⏱ 35 min → `Q2.10_specialists_vs_generalists.sql`

## 📂 What goes in this folder
- One `.sql` file per case, named like the suggestions above (`Q<chapter>.<n>_<short_title>.sql`).
- Start every file from [`../00_solution_template.sql`](../00_solution_template.sql): story, metric definitions, grain, assumptions, query, validation, insight.
- When the chapter is finished, write the chapter note in `reports/chapter_notes/m02.md` (Headline → Evidence → Action).

📖 Case descriptions: [Problem Bank → Chapter 2](../../../docs/SQL_PROBLEM_BANK.md#module-2-the-case-of-the-inflated-revenue)

_Git habit:_ one chapter = one branch (e.g. `feat/sql-m02-joins`) = one pull request.
