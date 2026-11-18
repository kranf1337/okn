#!/usr/bin/env bash
# Практика по Git: репозиторий, 3 ветки, файлы, коммиты, слияние,
# клонирование, изменение файла, комментарий.
# Запуск: bash git_practice.sh
set -euo pipefail

WORKDIR="git-practice-demo"
REPO="$WORKDIR/origin"      # основной репозиторий
CLONE="$WORKDIR/clone"      # клон репозитория

step() { echo; echo "=== $1 ==="; }

rm -rf "$WORKDIR"
mkdir -p "$WORKDIR"

# --- 1. Репозиторий ---
step "1. Создаём репозиторий"
git init -b main "$REPO"
cd "$REPO"
git config user.name  "Student"
git config user.email "student@example.com"
echo "# Git practice" > README.md
git add README.md
git commit -m "Первый коммит: README"

# --- 2. Три ветки ---
step "2. Создаём ветки: main, feature-1, feature-2"
git branch feature-1
git branch feature-2
git branch

# --- 3. Файлы в одну из веток ---
step "3. Помещаем файлы в ветку feature-2"
git checkout feature-2
echo "Первый файл"  > notes.txt
echo "Второй файл"  > todo.txt
git add notes.txt todo.txt

# --- 4. Коммит ---
step "4. Делаем коммит"
git commit -m "Добавлены notes.txt и todo.txt в feature-2"

# Небольшое изменение в feature-1 (чтобы слияние было содержательным)
git checkout feature-1
echo "Файл из feature-1" > extra.txt
git add extra.txt
git commit -m "Добавлен extra.txt в feature-1"

# --- 5. Слияние веток ---
step "5. Сливаем ветки в main"
git checkout main
git merge feature-2 -m "Merge feature-2 в main"
git merge feature-1 -m "Merge feature-1 в main"
git log --oneline --graph --all

# --- 6. Клонирование ---
step "6. Клонируем репозиторий"
cd - >/dev/null
git clone "$REPO" "$CLONE"
cd "$CLONE"
git config user.name  "Student"
git config user.email "student@example.com"
ls

# --- 7. Изменение файла ---
step "7. Изменяем файл в клоне"
echo "Новая строка, добавленная в клоне" >> notes.txt
git add notes.txt
git commit -m "Изменён notes.txt"
cat notes.txt

# --- 8. Комментарий ---
step "8. Комментируем коммит (git notes)"
git notes add -m "Комментарий: в notes.txt добавлена новая строка" HEAD
git log -1 --format="%h %s%n%N"

step "Готово"
echo "Репозиторий: $(pwd)"

# Чтобы отправить на GitHub (создайте пустой репозиторий на сайте):
#   git remote set-url origin https://github.com/<логин>/<репо>.git
#   git push -u origin --all
#   git push origin 'refs/notes/*'
#
# Комментарий на самом GitHub (нужен gh CLI):
#   gh pr comment <номер> --body "Текст"
