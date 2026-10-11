# 🚀 START HERE

This folder is a ready-to-use **GitHub project skeleton** for your Olist data-analysis project (**35 files**).
It is **SQL-only** and everything is plain text — open it in VS Code.

## 1) What is inside (and where to find it)

| Look here | What you get |
|---|---|
| `README.md` | The portfolio README for your GitHub repo (fill in your insights as you go) |
| `docs/00_DBEAVER_DATABASE_AND_UPLOAD_GUIDE.md` | Create a PostgreSQL database in DBeaver and upload **any** CSV dataset |
| `docs/01_GIT_GITHUB_GUIDE.md` | Git & GitHub from zero to the professional workflow (branches, PRs, commits) |
| `docs/02_SQL_PROBLEM_BANK.md` | **122 story-driven business cases**, 13 chapters, with hints |
| `docs/03_DATA_DICTIONARY.md` | Olist tables, grain, join map and data traps |
| `sql/00_setup/` | `00_inspect` → `01_build_clean_schema` → `02_keys_indexes` (+ `tools/profile_table.sql`) |
| `sql/solutions/00_solution_template.sql` | The documentation template for **every** solution you write (your "readme.sql") |
| `sql/solutions/m00_… m12_…/` | One folder per chapter, each with a **README.md case tracker**; `m01_kpis/` also has one fully worked example |
| `reports/` | `chapter_notes/` and `insights/` for your written stories, `figures/` for charts |

## 2) Hidden files (important on Windows!)
Two items start with a dot and are **hidden by default** in Windows Explorer, but they are in the zip:
`.gitignore` · `.github/` (pull-request + issue templates)

To see them: File Explorer → **View → Show → Hidden items**. In VS Code they always show.

## 3) Unzip correctly
Extract the zip, open the folder `olist-analytics`, and **copy its contents** into your project folder
(avoid ending up with `olist-analytics/olist-analytics/...`).
If you already cloned your GitHub repo, copy everything in, then commit it:
```bash
git add .
git commit -m "chore: add project structure, docs and SQL setup scripts"
git push
```

## 4) Reading order
1. `docs/00_DBEAVER_DATABASE_AND_UPLOAD_GUIDE.md` — get the data into PostgreSQL
2. `docs/01_GIT_GITHUB_GUIDE.md` — Parts 1–5 (you need Git before your first commit)
3. `docs/02_SQL_PROBLEM_BANK.md` — read the story intro, start **Chapter 0**
4. Save each solution in `sql/solutions/m00_profiling/` using `00_solution_template.sql`

## 5) Inventory
```text
.github/ISSUE_TEMPLATE/problem.md
.github/PULL_REQUEST_TEMPLATE.md
.gitignore
README.md
data/README.md
data/raw/README.md
docs/00_DBEAVER_DATABASE_AND_UPLOAD_GUIDE.md
docs/01_GIT_GITHUB_GUIDE.md
docs/02_SQL_PROBLEM_BANK.md
docs/03_DATA_DICTIONARY.md
reports/chapter_notes/README.md
reports/figures/README.md
reports/insights/README.md
sql/00_setup/00_inspect_loaded_tables.sql
sql/00_setup/01_build_clean_schema.sql
sql/00_setup/02_keys_indexes.sql
sql/00_setup/alt_fresh_install/A1_create_empty_tables.sql
sql/00_setup/alt_fresh_install/A2_load_csv_with_psql.sql
sql/00_setup/tools/profile_table.sql
sql/solutions/00_solution_template.sql
sql/solutions/m00_profiling/README.md
sql/solutions/m01_kpis/Q1.4_monthly_trend_EXAMPLE.sql
sql/solutions/m01_kpis/README.md
sql/solutions/m02_joins/README.md
sql/solutions/m03_ops_metrics/README.md
sql/solutions/m04_subqueries_ctes/README.md
sql/solutions/m05_window_functions/README.md
sql/solutions/m06_dates_text_nulls/README.md
sql/solutions/m07_customer_analytics/README.md
sql/solutions/m08_sellers_logistics/README.md
sql/solutions/m09_product_pricing/README.md
sql/solutions/m10_customer_experience/README.md
sql/solutions/m11_advanced_engineering/README.md
sql/solutions/m12_capstones/README.md
START_HERE.md
```
