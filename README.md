# Git Commands Reference | مرجع دستورات گیت

A categorized, corrected, and expanded cheat sheet with English and Persian explanations.
یک مرجع دسته‌بندی‌شده، اصلاح‌شده و تکمیل‌شده به همراه توضیح فارسی و انگلیسی.

> **Note:** A few commands from the original list had incorrect syntax (e.g. `git add remote`, `git push remote`). These are fixed below with the correct Git syntax.
> **نکته:** چند دستور در فهرست اولیه سینتکس اشتباه داشتند (مثل `git add remote`، `git push remote`)؛ در ادامه با سینتکس صحیح گیت اصلاح شده‌اند.

---

## 1. Setup & Initialization | راه‌اندازی اولیه

| Command | English | فارسی |
|---|---|---|
| `git init` | Initialize a new repository in the current directory | یک مخزن جدید در دایرکتوری فعلی می‌سازد |
| `git clone <repository_url>` | Clone a remote repository (e.g. from GitHub) into a new local directory | یک مخزن ریموت (مثلاً از گیت‌هاب) را در یک پوشه محلی جدید کلون می‌کند |
| `git clone --depth 1 <repository_url>` | Shallow clone — only fetches the latest commit, faster for large repos | کلون سبک — فقط آخرین کامیت را می‌گیرد، برای مخازن بزرگ سریع‌تر است |
| `git config --global user.name "Name"` | Set your Git username globally | نام کاربری گیت را به‌صورت سراسری تنظیم می‌کند |
| `git config --global user.email "you@example.com"` | Set your Git email globally | ایمیل گیت را به‌صورت سراسری تنظیم می‌کند |

---

## 2. Staging & Committing | استیج و کامیت

| Command | English | فارسی |
|---|---|---|
| `git status` | Show the current state of the working directory and staging area | وضعیت فعلی دایرکتوری کاری و ناحیه استیج را نشان می‌دهد |
| `git add <file>` | Add a specific file to the staging area | یک فایل مشخص را به ناحیه استیج اضافه می‌کند |
| `git add .` | Add all changed files in the current directory to the staging area | تمام فایل‌های تغییر یافته در دایرکتوری فعلی را به ناحیه استیج اضافه می‌کند |
| `git add --all` | Add all files in the all directories to the staging area | تمام فایل‌ها در تمام دایرکتوری‌ها را به ناحیه استیج اضافه می‌کند |
| `git commit -m "message"` | Commit staged changes with a message | تغییرات استیج‌شده را با یک پیام کامیت می‌کند |
| `git commit -a -m "message"` | Stage and commit all tracked file changes in one step | تغییرات همه فایل‌های ردیابی‌شده در دایرکتوری فعلی را در یک مرحله استیج و کامیت می‌کند |
| `git diff` | Show unstaged changes between working directory and last commit | تفاوت تغییرات استیج‌نشده با آخرین کامیت را نشان می‌دهد |
| `git diff --staged` | Show changes that are staged but not yet committed | تغییرات استیج‌شده‌ای که هنوز کامیت نشده‌اند را نشان می‌دهد |

---

## 3. Branching & Merging | شاخه‌بندی و ادغام

| Command | English | فارسی |
|---|---|---|
| `git branch` | List all local branches | لیست تمام شاخه‌های محلی را نشان می‌دهد |
| `git branch <branch_name>` | Create a new branch | یک شاخه جدید ایجاد می‌کند |
| `git branch -d <branch_name>` | Delete a branch (safe — only if merged) | یک شاخه را حذف می‌کند (ایمن — فقط اگر merge شده باشد) |
| `git branch -D <branch_name>` | Force-delete a branch, even if not merged | حذف اجباری یک شاخه، حتی اگر merge نشده باشد |
| `git checkout <branch_name>` | Switch to an existing branch | به یک شاخه موجود سوییچ می‌کند |
| `git checkout -b <branch_name>` | Create a new branch and switch to it in one step | یک شاخه جدید می‌سازد و همزمان به آن سوییچ می‌کند |
| `git switch <branch_name>` | Modern alternative to `checkout` for switching branches | جایگزین مدرن `checkout` برای سوییچ بین شاخه‌ها |
| `git merge <branch_name>` | Merge the given branch into the current branch | شاخه مشخص‌شده را در شاخه فعلی ادغام می‌کند |
| `git rebase <branch_name>` | Reapply current branch's commits on top of the target branch | کامیت‌های شاخه فعلی را روی شاخه هدف بازپیاده‌سازی می‌کند |

---

## 4. Remote Repositories | مخازن ریموت

| Command | English | فارسی |
|---|---|---|
| `git remote -v` | List all configured remotes with their URLs | لیست تمام ریموت‌های تنظیم‌شده به همراه آدرس آن‌ها |
| `git remote add <remote_name> <remote_url>` | Add a new remote repository | یک مخزن ریموت جدید اضافه می‌کند |
| `git remote remove <remote_name>` | Remove a configured remote | یک ریموت تنظیم‌شده را حذف می‌کند |
| `git fetch <remote_name>` | Download changes from a remote without merging them | تغییرات ریموت را دانلود می‌کند بدون اینکه merge کند |
| `git pull` | Fetch and merge changes from the tracked remote branch | تغییرات را از شاخه ریموت مرتبط می‌گیرد و merge می‌کند |
| `git pull <remote_name> <branch_name>` | Fetch and merge from a specific remote branch | تغییرات را از یک شاخه ریموت مشخص می‌گیرد و merge می‌کند |
| `git push` | Push commits to the tracked remote branch | کامیت‌ها را به شاخه ریموت مرتبط ارسال می‌کند |
| `git push <remote_name> <branch_name>` | Push commits to a specific remote branch | کامیت‌ها را به یک شاخه ریموت مشخص ارسال می‌کند |
| `git push -u origin <branch_name>` | Push and set upstream tracking for future `push`/`pull` | ارسال می‌کند و شاخه ریموت را برای `push`/`pull`های بعدی پیش‌فرض می‌کند |
| `git merge <remote_name>/<branch_name>` | Merge a specific remote-tracking branch into the current one | یک شاخه ریموت مشخص را در شاخه فعلی ادغام می‌کند |
| `git rebase <remote_name>/<branch_name>` | Rebase the current branch onto a remote-tracking branch | شاخه فعلی را روی یک شاخه ریموت بازپیاده‌سازی می‌کند |

---

## 5. Stashing | ذخیره موقت تغییرات

| Command | English | فارسی |
|---|---|---|
| `git stash` | Temporarily save uncommitted changes | تغییرات کامیت‌نشده را به‌طور موقت ذخیره می‌کند |
| `git stash list` | List all stashed changes | لیست تمام تغییرات ذخیره‌شده موقت را نشان می‌دهد |
| `git stash pop` | Reapply the most recent stash and remove it from the list | آخرین stash را دوباره اعمال کرده و از لیست حذف می‌کند |
| `git stash drop` | Delete the most recent stash without applying it | آخرین stash را بدون اعمال کردن، حذف می‌کند |

---

## 6. History & Inspection | تاریخچه و بررسی

| Command | English | فارسی |
|---|---|---|
| `git log` | Show commit history | تاریخچه کامیت‌ها را نشان می‌دهد |
| `git log --oneline --graph` | Show a compact, graphical commit history | تاریخچه کامیت‌ها را به‌صورت خلاصه و گرافیکی نشان می‌دهد |
| `git show <commit_hash>` | Show details and changes of a specific commit | جزئیات و تغییرات یک کامیت مشخص را نشان می‌دهد |
| `git blame <file>` | Show who last modified each line of a file | نشان می‌دهد آخرین‌بار هر خط از یک فایل را چه کسی تغییر داده |

---

## 7. Undoing Changes | بازگرداندن تغییرات

| Command | English | فارسی |
|---|---|---|
| `git reset <file>` | Unstage a file, keeping its changes in the working directory | یک فایل را از استیج خارج می‌کند، تغییراتش در دایرکتوری کاری باقی می‌ماند |
| `git reset --hard <commit_hash>` | Reset working directory and history to a specific commit (destructive) | دایرکتوری کاری و تاریخچه را به یک کامیت مشخص برمی‌گرداند (مخرب است) |
| `git revert <commit_hash>` | Create a new commit that undoes a previous commit (safe for shared history) | یک کامیت جدید می‌سازد که کامیت قبلی را خنثی می‌کند (برای تاریخچه مشترک ایمن است) |
| `git cherry-pick <commit_hash>` | Apply a specific commit from another branch onto the current one | یک کامیت مشخص از شاخه دیگر را روی شاخه فعلی اعمال می‌کند |

---

## 8. Tagging | تگ‌گذاری

| Command | English | فارسی |
|---|---|---|
| `git tag <tag_name>` | Create a lightweight tag on the current commit | یک تگ ساده روی کامیت فعلی ایجاد می‌کند |
| `git tag -a <tag_name> -m "message"` | Create an annotated tag with a message | یک تگ همراه با پیام (annotated) ایجاد می‌کند |
| `git push origin <tag_name>` | Push a tag to the remote repository | یک تگ را به مخزن ریموت ارسال می‌کند |

---

## 9. Ignoring Files | نادیده گرفتن فایل‌ها

| File | English | فارسی |
|---|---|---|
| `.gitignore` | A file listing patterns Git should not track (e.g. `node_modules/`, `.env`) | فایلی که الگوهایی را که گیت نباید ردیابی کند مشخص می‌کند (مثلاً `node_modules/`، `.env`) |