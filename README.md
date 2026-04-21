# BasisThree: сайт (Next.js) + CMS (Strapi)

Этот проект состоит из 2 частей:

- `apps/web` — публичный сайт на Next.js (`https://basisthree.ru`)
- `apps/cms` — админка Strapi (`https://cms.basisthree.ru/admin`)

И 1 базы данных:

- PostgreSQL (контент, заявки, пользователи, рефералка и т.д.)

---

## 1) Как это работает (простыми словами)

1. Вы меняете данные в Strapi (админке): тексты, картинки, соцсети, документы, метрики.
2. Сайт (`apps/web`) запрашивает эти данные через API Strapi.
3. Пользователь на `basisthree.ru` видит актуальный контент из CMS.

Важно:

- **Контент хранится в базе Strapi**, а не в коде фронта.
- Загруженные файлы Strapi лежат в docker volume `basis_basis_cms_uploads`.

---

## 2) Где что менять в админке

### Контент страниц

- About: `Content Manager -> About page`
- Документы/футер: `Content Manager -> Company document`
- Услуги: `Content Manager -> Service cards`, `Service pages` и т.д.

### Метрики и внешние скрипты

- `Content Manager -> Настройки сайта (Site setting)`
  - `GTM ID` — например `GTM-XXXXXXX`
  - `ID Яндекс.Метрики` — только число
  - `Скрипт в <head>` — любой кастомный JS/пиксель
  - `Скрипт перед </body>` — любой кастомный JS

После изменений нажимайте **Save** и **Publish**.

---

## 3) Локальный запуск (на ноутбуке)

Требования:

- Node.js 20+
- Docker Desktop

Команды из корня проекта:

```bash
npm run setup
npm run dev
```

Откроется:

- сайт: [http://localhost:3000](http://localhost:3000)
- CMS: [http://localhost:1337/admin](http://localhost:1337/admin)

Отдельно:

```bash
# только CMS
npm run dev:cms

# только сайт
npm run dev:web
```

---

## 4) Прод: как деплой работает сейчас

### Схема

1. Вы пушите в `main`.
2. GitHub Actions (`.github/workflows/build-images.yml`) собирает Docker-образы:
   - `ghcr.io/perfzero/basis-web:main`
   - `ghcr.io/perfzero/basis-cms:main`
3. На сервере делается `docker compose pull` + `docker compose up -d`.

### Сервер

- Ubuntu 24.04
- путь проекта: `/opt/basis`
- compose файл: `/opt/basis/docker-compose.prod.yml`

### Команды деплоя на сервере

```bash
cd /opt/basis
docker compose -f docker-compose.prod.yml pull web cms
docker compose -f docker-compose.prod.yml up -d web cms
docker compose -f docker-compose.prod.yml ps
```

Проверка:

```bash
curl -I https://basisthree.ru
curl -I https://cms.basisthree.ru/admin
```

---

## 5) Первый запуск проекта на новом сервере

1. Установить Docker + Docker Compose plugin.
2. Клонировать репозиторий в `/opt/basis`.
3. Создать `/opt/basis/.env` (см. пример ниже).
4. Создать volumes:

```bash
docker volume create basis_basis_postgres_data
docker volume create basis_basis_cms_uploads
```

5. Подготовить `Caddyfile` (прокси на `web:3000` и `cms:1337`).
6. Запустить:

```bash
cd /opt/basis
docker compose -f docker-compose.prod.yml up -d
```

---

## 6) Важные ENV переменные (prod)

В `/opt/basis/.env` обязательно должны быть:

- `POSTGRES_DB`
- `POSTGRES_USER`
- `POSTGRES_PASSWORD`
- `APP_KEYS`
- `API_TOKEN_SALT`
- `ADMIN_JWT_SECRET`
- `TRANSFER_TOKEN_SALT`
- `ENCRYPTION_KEY`
- `JWT_SECRET`
- `NEXT_PUBLIC_SITE_URL` (публичный URL сайта, например `https://basisthree.ru`, нужен для корректных Open Graph ссылок)
- `STRAPI_URL` (обычно `http://cms:1337` внутри docker-сети)
- `STRAPI_API_TOKEN` (для чтения контента сайтом при необходимости)

---

## 7) Резервная копия базы (backup/restore)

### Сделать дамп

```bash
docker exec -e PGPASSWORD='<POSTGRES_PASSWORD>' basis-db-1 \
  pg_dump -U <POSTGRES_USER> -d <POSTGRES_DB> -Fc -f /tmp/strapi.dump
docker cp basis-db-1:/tmp/strapi.dump /root/strapi.dump
```

### Восстановить

```bash
docker cp /root/strapi.dump basis-db-1:/tmp/strapi.dump
docker exec -e PGPASSWORD='<POSTGRES_PASSWORD>' basis-db-1 \
  pg_restore -U <POSTGRES_USER> -d <POSTGRES_DB> --clean --if-exists /tmp/strapi.dump
```

---

## 8) Частые проблемы

### Изменения в админке не видны на сайте

- Проверьте, что запись опубликована (`Publish`).
- Проверьте, что сайт смотрит на правильный Strapi (`STRAPI_URL`).
- Проверьте, что нужный API endpoint отдает новые данные.

### `/admin` возвращает 502 сразу после деплоя

- Обычно CMS просто еще стартует (10–30 секунд).
- Проверить логи:

```bash
docker logs --tail 200 basis-cms-1
```

### Картинки в CMS битые, на сайте есть

- Чаще всего CSP/домен в настройках middleware Strapi.
- Проверьте `apps/cms/config/middlewares.ts` и разрешенные источники.

---

## 9) Что НЕ коммитим в Git

Не нужны в репозитории (только локально):

- `.playwright-mcp/`
- `.tmp/`
- `backups/`
- `_import/`
- `apps/cms/public/uploads/` (runtime uploads)
- скриншоты, временные файлы, `.DS_Store`

Для этого настроен `.gitignore`.

---

## 10) Полезные команды (шпаргалка)

```bash
# Локально
npm run dev
npm --workspace apps/web run build
npm --workspace apps/cms run build

# Прод
cd /opt/basis
docker compose -f docker-compose.prod.yml ps
docker compose -f docker-compose.prod.yml logs -f cms
docker compose -f docker-compose.prod.yml logs -f web
docker compose -f docker-compose.prod.yml pull web cms
docker compose -f docker-compose.prod.yml up -d web cms
```

