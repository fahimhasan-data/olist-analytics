# 📓 Learning log

A dated, honest record of what I learned, what broke and how I fixed it. Newest entry on top.

**Format for each entry** (5–8 lines is plenty):
`### YYYY-MM-DD · topic` → **What I did** · **What went wrong** · **What I learned** · **Next**

---

### 2026-10-11 · Git & GitHub: first push

**What I did:** Turned the project folder into a Git repository and pushed it to GitHub over HTTPS.

**What went wrong:**
- `git status` said *"nothing to commit, working tree clean"*. I thought it was an error. It means everything was already committed in an earlier attempt.
- I tried to wipe the old history with `Remove-Item -Recurse -Force .git` and got *"'Remove-Item' is not recognized"*. My VS Code terminal was Command Prompt, not PowerShell. In cmd the command is `rmdir /s /q .git`.

**What I learned:**
- Git commands are identical in every terminal; only non-Git commands (like deleting a folder) differ. The prompt (`PS C:\…>` vs `C:\…>`) tells me which one I'm in.
- Create the GitHub repo **empty** (no README, no .gitignore, no license), otherwise the first push can fail with *"fetch first"*.
- HTTPS login through the browser is much simpler than SSH keys for a first upload.

**Next:** Run the setup scripts in `sql/00_setup/` and start Chapter 0 on a new branch (`feat/sql-m00-profiling`).
