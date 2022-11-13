const {ethers} = require("hardhat");
async function main(){
  const EtherbankContract = await ethers.getContractFactory("EtherBank");
  const deploedbankContract = await EtherbankContract.deploy();
  await deploedbankContract.deployed();
  console.log("EtherBankContract deployed at: ",deploedbankContract.address);

}
main()
.then(()=>process.exit(0))
.catch((error)=> {console.error(error);process.exit(1);});