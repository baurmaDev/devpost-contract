const main = async () => {
  const [deployer] = await hre.ethers.getSigners();
  const accountBalance = await deployer.getBalance();

  console.log("Deploying contracts with account: ", deployer.address);
  console.log("Account balance: ", accountBalance.toString());

  const betContractFactory = await hre.ethers.getContractFactory("Bet");
  const betContract = await betContractFactory.deploy({
    value: hre.ethers.utils.parseEther("0.000005"),
    // value: 1
  });
  await betContract.deployed();
  console.log("Contract address:", betContract.address);

};

const runMain = async () => {
  try {
    await main();
    process.exit(0); // exit Node process without error
  } catch (error) {
    console.log(error);
    process.exit(1); // exit Node process while indicating 'Uncaught Fatal Exception' error
  }
  // Read more about Node exit ('process.exit(num)') status codes here: https://stackoverflow.com/a/47163396/7974948
};

runMain();