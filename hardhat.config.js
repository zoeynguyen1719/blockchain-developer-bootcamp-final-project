require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-etherscan");
require("dotenv").config();

task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

task("deploy", "Deploy the smart contracts", async(taskArgs, hre) => {

  const Ambition = await hre.ethers.getContractFactory("ambiToken");
  const ambition = await Ambition.deploy();

  await ambition.deployed();

  await hre.run("verify:verify", {
    address: ambition.address,
    constructorArguments: [
      "Ambition",
      "AMBI"
    ]
  })
  await hre.run("verify:verify", {
    address: contractAddress,
    constructorArguments: [
      50,
      "a string argument",
      {
        x: 10,
        y: 5,
      },
      "0xabcdef",
    ],
  });

})

module.exports = {
  defaultNetwork: "matic",
  networks: {
    hardhat: {
    },
    matic: {
      url: "https://rpc-mumbai.maticvigil.com",
      accounts: [process.env.PRIVATE_KEY]
    }
  },
  solidity: {
    version: "0.8.4",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  },
  etherscan: {
    apiKey: { 
      polygonMumbai:process.env.POLYGONSCAN_KEY,
    }
  }
}


