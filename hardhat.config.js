require("dotenv").config();
require("@nomicfoundation/hardhat-toolbox");

const { SKALE_RPC_URL, SKALE_CHAIN_ID, DEPLOYER_PRIVATE_KEY } = process.env;

module.exports = {
  solidity: "0.8.20",
  networks: {
    skale: {
      url: SKALE_RPC_URL || "",
      chainId: Number(SKALE_CHAIN_ID) || 0,
      accounts: DEPLOYER_PRIVATE_KEY ? [DEPLOYER_PRIVATE_KEY] : []
    }
  }
};
