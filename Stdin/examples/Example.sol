pragma solidity >= 0.6.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "Stdin.sol";

contract ExampleContract {

    function start() public {
		
		Stdin.inputStr(tvm.functionId(setText),    "enter your name:");
		Stdin.inputInt(tvm.functionId(setInteger), "enter number:");
		Stdin.inputAddr(tvm.functionId(setAddress),"enter address:");
		Stdin.inputCell(tvm.functionId(setCell),   "enter boc:");
		Stdin.inputTons(tvm.functionId(setTons),   "enter tons:");
		Stdin.inputBoolean(tvm.functionId(setYesOrNo), "say yes or no:");
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
	
	function setYesOrNo(bool value) public {
	}
    
}