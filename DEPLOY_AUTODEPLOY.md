# Autodeploy (GitHub Actions + SSH key)

> Status: legacy flow. If you use Dockploy, keep this workflow disabled (manual only).

Workflow file: `.github/workflows/deploy-production.yml`

What it does on manual run:
1. Connects to `root@109.172.46.96` with SSH key.
2. Runs `/opt/basis/scripts/deploy-prod.sh`.
3. Pulls latest `main`.
4. If `apps/web` changed: builds web and restarts `basis-web-host` (no Docker build).
5. If `apps/cms` changed: by default only logs a warning and skips heavy rebuild.

## Safe defaults

`deploy-prod.sh` is intentionally conservative:
- `DEPLOY_CMS=0` by default (prevents heavy `docker build` on production).
- To rebuild CMS manually in a maintenance window:

```bash
DEPLOY_CMS=1 bash /opt/basis/scripts/deploy-prod.sh
```

## Required GitHub Secret

Create repo secret:
- Name: `PROD_SSH_PRIVATE_KEY`
- Value: private SSH key that has access to `root@109.172.46.96`

After adding the secret, run workflow manually in GitHub Actions.
