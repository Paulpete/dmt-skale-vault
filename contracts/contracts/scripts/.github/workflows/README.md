# 🌌 DMT on SKALE — Ownerless Vault

Gasless user experience via SKALE. Full 5,000,000,000 DMT supply mints directly to the Vault.

## What’s here
- `DMT.sol` — ERC20 (5B fixed), mints to Vault on deploy
- `DmtVault.sol` — Minimal owner-controlled vault (extend with bots later)
- `deploy.js` — Deploys Vault -> DMT -> binds token
- GitHub Action for 1-click deployment to SKALE

## Deploy (GitHub Actions)
1. Add repo **Secrets** (Settings → Secrets and variables → Actions):
   - `SKALE_RPC_URL` — your SKALE chain endpoint
   - `SKALE_CHAIN_ID` — numeric chain id
   - `DEPLOYER_PRIVATE_KEY` — wallet private key (0x-prefixed)

2. Go to **Actions** → **Deploy DMT on SKALE** → Run workflow

Outputs (in logs):
- Vault address
- DMT address

## Local (optional)
```bash
npm install
SKALE_RPC_URL=... SKALE_CHAIN_ID=... DEPLOYER_PRIVATE_KEY=0x... npx hardhat run scripts/deploy.js --network skale
