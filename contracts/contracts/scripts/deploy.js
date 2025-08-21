const { ethers } = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deployer:", deployer.address);

  // 1) Deploy Vault (owner = deployer for now; can renounce/transfer later)
  const Vault = await ethers.getContractFactory("DmtVault");
  const vault = await Vault.deploy(deployer.address);
  await vault.deployed();
  console.log("Vault deployed:", vault.address);

  // 2) Deploy DMT, minting full 5B supply to the Vault
  const DMT = await ethers.getContractFactory("DMT");
  const dmt = await DMT.deploy(vault.address);
  await dmt.deployed();
  console.log("DMT deployed:", dmt.address);

  // 3) Bind token in vault (one-time)
  const tx = await vault.bindToken(dmt.address);
  await tx.wait();
  console.log("Vault bound to DMT");

  console.log("✅ DONE on SKALE");
  console.log("   Vault:", vault.address);
  console.log("   DMT  :", dmt.address);
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});
