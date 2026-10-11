# sql/solutions

One folder per chapter (`m00_…` to `m12_…`). Each has a **README case tracker**; tick a case only when it is solved, validated and committed.

## Conventions

- **File name:** `Q<chapter>.<n>_<short_title>.sql` (capstones: `C<n>_<short_title>.sql`).
- **Start from** [`00_solution_template.sql`](00_solution_template.sql): story, metric definitions, grain, assumptions, query, validation, story.
- **First line of every query:** `SET search_path TO olist, public;`
- **Validation:** at least two independent checks (row count vs expected grain, totals vs a simpler query, fan-out check).
- **One chapter = one branch = one pull request.**

## The worked example

[`m01_kpis/Q1.4_monthly_trend_EXAMPLE.sql`](m01_kpis/Q1.4_monthly_trend_EXAMPLE.sql) is a **reference example** that shows the documentation standard (its numbers are placeholders). It is not counted as a solved case; I write my own Q1.4 separately.

## Portfolio projects

Cases that belong to a portfolio project are listed in [`docs/PROJECTS.md`](../../docs/PROJECTS.md). Those get extra polish (one-pager, chart); the rest only need to be correct, documented and validated.
