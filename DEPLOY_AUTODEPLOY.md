# Autodeploy

## Current flow (recommended)

Workflow file: `.github/workflows/build-images.yml`

What it does:
1. On every push to `main` (changes under `apps/web` or `apps/cms`) builds Docker images in GitHub Actions.
2. Pushes images to GHCR:
   - `ghcr.io/perfzero/basis-web:main` (+ `latest`, `sha-*`)
   - `ghcr.io/perfzero/basis-cms:main` (+ `latest`, `sha-*`)
3. Dockploy uses ready images from registry (no heavy `docker build` on server).

Dockploy compose should use:
- `WEB_IMAGE=ghcr.io/perfzero/basis-web:main`
- `CMS_IMAGE=ghcr.io/perfzero/basis-cms:main`

## Legacy flow (manual only)

Workflow file: `.github/workflows/deploy-production.yml`

This SSH script-based deploy is kept only for manual fallback and should stay disabled during normal Dockploy operation.
