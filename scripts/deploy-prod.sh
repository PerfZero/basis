#!/usr/bin/env bash
set -euo pipefail

DEPLOY_PATH="${DEPLOY_PATH:-/opt/basis}"
COMPOSE_FILE="${COMPOSE_FILE:-docker-compose.prod.yml}"
BRANCH="${BRANCH:-main}"
DEPLOY_CMS="${DEPLOY_CMS:-0}"

cd "$DEPLOY_PATH"

PREV_REV="$(git rev-parse HEAD)"
git fetch origin "$BRANCH"
git checkout "$BRANCH"
git pull --ff-only origin "$BRANCH"
NEW_REV="$(git rev-parse HEAD)"

echo "[deploy] revision: ${PREV_REV} -> ${NEW_REV}"

CHANGED_FILES="$(git diff --name-only "${PREV_REV}" "${NEW_REV}" || true)"
echo "[deploy] changed files:"
echo "${CHANGED_FILES:-<none>}"

if echo "$CHANGED_FILES" | grep -Eq '(^|/)package-lock\.json$|(^|/)apps/web/package-lock\.json$|(^|/)apps/web/package\.json$'; then
  echo "[deploy] installing dependencies"
  source /root/.nvm/nvm.sh
  nvm use 20 >/dev/null
  npm ci
fi

if echo "$CHANGED_FILES" | grep -Eq '^apps/web/|^package-lock\.json$|^package\.json$'; then
  echo "[deploy] building and restarting web"
  source /root/.nvm/nvm.sh
  nvm use 20 >/dev/null
  npm --workspace apps/web run build
  systemctl restart basis-web-host
else
  echo "[deploy] web unchanged, skipping"
fi

if echo "$CHANGED_FILES" | grep -Eq '^apps/cms/|^docker-compose.prod.yml$|^package-lock\.json$|^package\.json$'; then
  if [[ "$DEPLOY_CMS" == "1" ]]; then
    echo "[deploy] cms changed, rebuilding container (DEPLOY_CMS=1)"
    docker compose -f "$COMPOSE_FILE" build cms
    docker compose -f "$COMPOSE_FILE" up -d --no-deps cms
  else
    echo "[deploy] cms changed, but rebuild is disabled by default"
    echo "[deploy] run with DEPLOY_CMS=1 during maintenance window if needed"
  fi
else
  echo "[deploy] cms unchanged, skipping"
fi

docker compose -f "$COMPOSE_FILE" ps
