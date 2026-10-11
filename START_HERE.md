# 🚀 START HERE

This repo is both a **SQL learning workbook** and a **project portfolio** built on the Olist e-commerce dataset. Pick your path.

## 👀 I'm a reviewer (2–3 minutes)

1. [`README.md`](README.md): what the repo is, honest progress, key insights.
2. [`docs/PROJECTS.md`](docs/PROJECTS.md): the 5 portfolio projects, their case lists and status.
3. [`reports/insights/`](reports/insights/): finished one-pagers (empty until a project is done).
4. [`sql/solutions/00_solution_template.sql`](sql/solutions/00_solution_template.sql): how every query is documented and validated.
5. [`reports/learning_log.md`](reports/learning_log.md): dated notes on what I learned and what broke.

## 📚 I'm following along (learning path)

| Step | Do this | Where |
|---|---|---|
| 1 | Install Git, create your GitHub repo, make your first push | [`docs/guides/GIT_GITHUB_GUIDE.md`](docs/guides/GIT_GITHUB_GUIDE.md), sections 1–4 |
| 2 | Create PostgreSQL database `olist_db` and import the 9 CSVs | [`docs/guides/DBEAVER_DATABASE_AND_UPLOAD_GUIDE.md`](docs/guides/DBEAVER_DATABASE_AND_UPLOAD_GUIDE.md) |
| 3 | Run the three setup scripts | `sql/00_setup/` (inspect → build clean schema → keys and indexes) |
| 4 | Read the story intro, start **Chapter 0** | [`docs/SQL_PROBLEM_BANK.md`](docs/SQL_PROBLEM_BANK.md) |
| 5 | Save each solution in `sql/solutions/mXX_…/` using the template | [`sql/solutions/README.md`](sql/solutions/README.md) |
| 6 | After each chapter: chapter note + learning-log entry + pull request | `reports/` |
| 7 | Polish the cases that belong to a portfolio project | [`docs/PROJECTS.md`](docs/PROJECTS.md) |

## 🔁 The loop for every chapter

```bash
git switch main && git pull                  # start from an up-to-date main
git switch -c feat/sql-m01-kpis              # one branch per chapter
# ... solve cases, one commit per case ...
git add .
git commit -m "feat(sql): add Q1.1 five numbers on one slide"
git push -u origin feat/sql-m01-kpis         # then open a pull request on GitHub
```

Full explanation: [`docs/guides/GIT_GITHUB_GUIDE.md`](docs/guides/GIT_GITHUB_GUIDE.md), section 5.

## 🪟 Windows notes

- **Hidden files.** `.gitignore` and `.github/` start with a dot. In File Explorer: **View → Show → Hidden items**. VS Code always shows them.
- **Which terminal?** A prompt starting with `PS` is PowerShell; one that is just `C:\...>` is Command Prompt. Git commands are the same in both; commands like deleting a folder differ (see the Git guide, section 2.4).
- **Right folder level.** In the VS Code sidebar, `README.md` and `START_HERE.md` must be at the top level. If you see another `olist-analytics` folder inside, you opened the wrong level.
