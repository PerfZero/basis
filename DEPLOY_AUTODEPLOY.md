# Autodeploy (GitHub Actions + SSH key)

Workflow file: `.github/workflows/deploy-production.yml`

What it does on every push to `main`:
1. Connects to `root@109.172.46.96` with SSH key.
2. Runs `/opt/basis/scripts/deploy-prod.sh`.
3. Pulls latest `main` and runs `docker compose -f docker-compose.prod.yml up -d --build --remove-orphans`.

## Required GitHub Secret

Create repo secret:
- Name: `PROD_SSH_PRIVATE_KEY`
- Value: private SSH key that has access to `root@109.172.46.96`

After adding the secret, push to `main` to trigger deploy.
