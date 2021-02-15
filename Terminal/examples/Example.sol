pragma solidity >= 0.6.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "Terminal.sol";

contract ExampleContract {

    function start() public {

		Terminal.input(tvm.functionId(setText), "enter your name:");
		Terminal.print("I am Debot");
		TvmBuilder b;
		b.store(int8(1), uint32(10));
		Terminal.printf("Enter number beetween {int8} and {uint32}", b.toCell());
	}

	function setText(string value) public {
        // continue here
	}


}
