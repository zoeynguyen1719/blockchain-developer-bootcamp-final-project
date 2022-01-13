const { expect } = require('chai');
const { ethers } = require("hardhat")

describe("Ambition Smart Contract Tests", function() {

    let ambition;

    this.beforeEach(async function() {
        // This is executed before each test
        // Deploying the smart contract
        const Ambition = await ethers.getContractFactory("ambiToken");
        ambition = await Ambition.deploy();
    })

    it("NFT is minted successfully", async function() {
        [account1] = await ethers.getSigners();

        expect(await ambition.balanceOf(account1.address)).to.equal(0);
        
        const tokenURI = "https://opensea-creatures-api.herokuapp.com/api/creature/1"
        const tx = await ambition.connect(account1).mint(tokenURI);

        expect(await ambition.balanceOf(account1.address)).to.equal(1);
    })

    it("tokenURI is set sucessfully", async function() {
        [account1, account2] = await ethers.getSigners();

        const tokenURI_1 = "https://opensea-creatures-api.herokuapp.com/api/creature/1"
        const tokenURI_2 = "https://opensea-creatures-api.herokuapp.com/api/creature/2"

        const tx1 = await ambition.connect(account1).mint(tokenURI_1);
        const tx2 = await ambition.connect(account2).mint(tokenURI_2);

        expect(await ambition.tokenURI(0)).to.equal(tokenURI_1);
        expect(await ambition.tokenURI(1)).to.equal(tokenURI_2);

    })

})