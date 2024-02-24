import { ethers } from "hardhat";

async function main() {
    const ONCHAIN_NFT_ADDR = "0x0c83D1dfc72E5C2fc2326eb31a131880496caeC4";

    const [owner] = await ethers.getSigners()

    const onchainNft = await ethers.getContractAt("OnChainNFT", ONCHAIN_NFT_ADDR);

    const tx = await onchainNft.connect(owner).mint()
    tx.wait()

    console.log(tx)
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
