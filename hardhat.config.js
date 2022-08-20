require("@nomiclabs/hardhat-waffle");
require("dotenv").config();

module.exports = {
  solidity: "0.8.0",
  networks: {
    mumbai: {
      url: process.env.STAGING_MUMBAI_KEY,
      accounts: [process.env.PRIVATE_MUMBAI_KEY]
    }
  },
};