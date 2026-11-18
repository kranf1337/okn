# Практика по Git и GitHub

Репозиторий для отработки базовых операций: ветки, коммиты, слияние, клонирование, изменение файлов и комментарии.

Каждый шаг можно выполнить **прямо на сайте GitHub** (без установленного Git). Для каждого шага ниже указана и консольная команда.

---

## Структура веток

| Ветка | Назначение |
|-------|------------|
| `main` | основная ветка |
| `feature-1` | первая рабочая ветка |
| `feature-2` | вторая рабочая ветка (в неё помещаем файлы) |

---

## Шаг 1. Создать репозиторий

**GitHub:** `+` → *New repository* → имя `git-practice` → поставить галочку *Add a README file* → *Create repository*.

**Git:**
```bash
git init git-practice
cd git-practice
```

## Шаг 2. Создать три ветки

Ветка `main` уже есть. Нужно создать ещё две.

**GitHub:** вкладка *Code* → выпадающий список веток → в поле ввести `feature-1` → *Create branch: feature-1 from main*. То же для `feature-2`.

**Git:**
```bash
git branch feature-1
git branch feature-2
```

## Шаг 3. Поместить файлы в одну из веток

**GitHub:** переключиться на ветку `feature-2` → *Add file* → *Upload files* (или *Create new file*, например `notes.txt`) → внизу выбрать *Commit directly to the feature-2 branch* → *Commit changes*.

**Git:**
```bash
git checkout feature-2
echo "Первый файл" > notes.txt
git add notes.txt
git commit -m "Добавлен notes.txt в feature-2"
```

## Шаг 4. Сделать коммит

Коммит создаётся при сохранении любого изменения. Хорошее сообщение коммита отвечает на вопрос «что изменено».

**GitHub:** при добавлении/изменении файла заполнить поле *Commit message* и нажать *Commit changes*.

**Git:**
```bash
git add .
git commit -m "Описание изменения"
git push origin feature-2
```

## Шаг 5. Слить ветки

**GitHub (через Pull Request):**
1. Вкладка *Pull requests* → *New pull request*.
2. `base: main` ← `compare: feature-2`.
3. *Create pull request* → *Merge pull request* → *Confirm merge*.
4. Повторить для `feature-1`.

**Git:**
```bash
git checkout main
git merge feature-2
git merge feature-1
git push origin main
```

## Шаг 6. Клонировать репозиторий

**GitHub:** кнопка *Code* → скопировать ссылку HTTPS.

**Git:**
```bash
git clone https://github.com/<ваш-логин>/git-practice.git
```

> Без Git клонировать можно через *Code → Download ZIP* или *Open with GitHub Desktop*.

## Шаг 7. Изменить файл

**GitHub:** открыть `notes.txt` → значок карандаша (*Edit this file*) → изменить текст → *Commit changes*.

**Git:**
```bash
echo "Новая строка" >> notes.txt
git add notes.txt
git commit -m "Изменён notes.txt"
git push
```

## Шаг 8. Прокомментировать

Комментарий можно оставить:
- **к коммиту:** вкладка *Commits* → открыть нужный коммит → внизу поле *Add a comment*;
- **к Pull Request:** открыть PR → поле *Write* внизу → *Comment*;
- **к строке кода:** в коммите или PR нажать `+` рядом с номером строки.

---

## Чек-лист

- [ ] Репозиторий создан
- [ ] Есть три ветки: `main`, `feature-1`, `feature-2`
- [ ] Файлы добавлены в `feature-2`
- [ ] Сделаны коммиты
- [ ] Ветки слиты в `main`
- [ ] Репозиторий клонирован
- [ ] Файл изменён
- [ ] Оставлен комментарий
