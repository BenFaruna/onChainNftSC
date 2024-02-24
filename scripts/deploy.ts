import { ethers } from "hardhat";

async function main() {

  const onchainNft = await ethers.deployContract("OnChainNFT");

  await onchainNft.waitForDeployment();

  console.log(
    `OnChainNFT deployed to ${onchainNft.target}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
