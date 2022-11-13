// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.17;
  import "@openzeppelin/contracts/utils/Address.sol";
  import "hardhat/console.sol";

  contract EtherBank {
     using Address for address payable;

    mapping(address => uint) public balances;
    function deposit() external payable {
       balances[msg.sender] += msg.value;
    }

    function withdraw() external {
        uint256 balance = balances[msg.sender];
        require(balance > 0, "Withdrawl amount exceeds available balance.");
        
        console.log("");
        console.log("EtherBank balance: ", address(this).balance);
        console.log("Attacker balance: ", balance);
        console.log("");

        payable(msg.sender).sendValue(balance);
        balances[msg.sender] = 0;
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;    }
}