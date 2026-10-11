# Chapter 6 — Black Friday & Messy Data

> *A quiet week. Then Tiago bursts in: "Last November's Black Friday — what actually happened? And why does our city dropdown have 'sao paulo', 'São Paulo' and 'sao paulo ' as three different cities?!"*

**🎯 Chapter goal:** careful time logic, text cleaning and NULL handling.

## ✅ Case tracker (change `[ ]` to `[x]` when a case is solved, validated and committed)

- [ ] **Q6.1** 🟢 Which Months Are Naturally Strong? · ⏱ 25 min → `Q6.1_which_months_are_naturally_strong.sql`
- [ ] **Q6.2** 🟡 Black Friday 2017 · ⏱ 50 min → `Q6.2_black_friday_2017.sql`
- [ ] **Q6.3** 🟡 Will It Arrive for Christmas? · ⏱ 35 min → `Q6.3_will_it_arrive_for_christmas.sql`
- [ ] **Q6.4** 🟡 Three Spellings of São Paulo · ⏱ 35 min → `Q6.4_three_spellings_of_s_o_paulo.sql`
- [ ] **Q6.5** 🟡 What Are Unhappy Customers Saying? · ⏱ 45 min → `Q6.5_what_are_unhappy_customers_saying.sql`
- [ ] **Q6.6** 🟡 Products Without a Size · ⏱ 40 min → `Q6.6_products_without_a_size.sql`
- [ ] **Q6.7** 🟡 The Missing 30th of November · ⏱ 25 min → `Q6.7_the_missing_30th_of_november.sql`
- [ ] **Q6.8** 🟡 Is Boleto Slowing Approval? · ⏱ 35 min → `Q6.8_is_boleto_slowing_approval.sql`

## 📂 What goes in this folder
- One `.sql` file per case, named like the suggestions above (`Q<chapter>.<n>_<short_title>.sql`).
- Start every file from [`../00_solution_template.sql`](../00_solution_template.sql): story, metric definitions, grain, assumptions, query, validation, insight.
- When the chapter is finished, write the chapter note in `reports/chapter_notes/m06.md` (Headline → Evidence → Action).

📖 Case descriptions: [Problem Bank → Chapter 6](../../../docs/SQL_PROBLEM_BANK.md#module-6-black-friday--messy-data)

_Git habit:_ one chapter = one branch (e.g. `feat/sql-m06-dates-text-nulls`) = one pull request.
