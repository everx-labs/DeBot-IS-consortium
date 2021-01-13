pragma solidity >= 0.6.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "Stdin.sol";

contract ExampleContract {

    function start() public {
		
		Stdin.getStr(tvm.functionId(setText), 	  "enter your name:");
		Stdin.getInt(tvm.functionId(setInteger), "enter number:");
		Stdin.getAddr(tvm.functionId(setAddress),"enter address:");
		Stdin.getCell(tvm.functionId(setCell),   "enter boc:");
		Stdin.getTons(tvm.functionId(setTons),   "enter tons:");

	}

	function setText(string value) public {
	}

	function setInteger(int256 value) public {
	}

	function setAddress(address value) public {
	}

	function setTons(uint128 value) public {
	}

	function setCell(TvmCell value) public {
	}
    
}