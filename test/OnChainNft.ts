import {
  time,
  loadFixture,
} from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
import { expect } from "chai";
import { ethers } from "hardhat";

describe("Lock", function () {
  // We define a fixture to reuse the same setup in every test.
  // We use loadFixture to run this setup once, snapshot that state,
  // and reset Hardhat Network to that snapshot in every test.
  async function deployOnchainNFTFixture() {
  
    const [owner, otherAccount] = await ethers.getSigners();

    const OnChainNFT = await ethers.getContractFactory("OnChainNFT");
    const onChainNft = await OnChainNFT.deploy();

    return { onChainNft, owner, otherAccount };
  }

  describe("Deployment", function () {
    it("Should set the NFT name and symbol", async function () {
      const { onChainNft } = await loadFixture(deployOnchainNFTFixture);

      expect(await onChainNft.name()).to.equal("DevFarunaNFT");
      expect(await onChainNft.symbol()).to.equal("DFN");
    });
  });
});
