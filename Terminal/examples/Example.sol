pragma solidity >= 0.6.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "Terminal.sol";

contract ExampleContract {

    function start() public {
		
		Terminal.inputStr(tvm.functionId(setText),    "enter your name:");
		Terminal.inputInt(tvm.functionId(setInteger), "enter number:");
		Terminal.inputTons(tvm.functionId(setTons),   "enter tons:");
		Terminal.inputBoolean(tvm.functionId(setYesOrNo), "say yes or no:");
		Terminal.print("I am Debot");
		TvmBuilder b;
		b.store(int8(1), uint32(10));
		Terminal.printf("Enter number beetween {int8} and {uint32}", b.toCell());
	}

	function setText(string value) public {
	}

	function setInteger(int256 value) public {
	}

	function setTons(uint128 value) public {
	}

	function setYesOrNo(bool value) public {
	}
    
}