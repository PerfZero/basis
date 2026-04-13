# Local Run Notes (2026-04-08)

Текущее рабочее состояние локального запуска:

- `web`: `http://localhost:3100`
- `cms`: `http://localhost:1337/admin`
- `cms` должен быть подключен к `basis-postgres` (НЕ к `basis-db`)

Проверенные факты:

- В правильной базе (`basis-postgres`, `strapi`):  
  `service_pages=12`, `admin_users=1`
- В пустой базе (`basis-db`):  
  `service_pages=0`

Если снова «пустая админка», сначала проверить переменные контейнера `basis-cms`:

```bash
docker exec basis-cms sh -lc 'printenv | grep -E "DATABASE_HOST|DATABASE_NAME|DATABASE_USERNAME" | sort'
```

Должно быть:

- `DATABASE_HOST=basis-postgres`
- `DATABASE_NAME=strapi`
- `DATABASE_USERNAME=strapi`

