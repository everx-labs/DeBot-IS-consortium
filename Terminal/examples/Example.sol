pragma ton-solidity >=0.35.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "Terminal.sol";

contract ExampleContract {

    function start() public {

		Terminal.input(tvm.functionId(setText), "enter your name:");
		Terminal.print(formatPrint, "I am Debot");
	}

	function setText(string value) public {
        // continue here
	}

    function formatPrint() public {
        TvmBuilder b;
		b.store(int8(1), uint32(10));
		Terminal.printf(0, "Enter number beetween {int8} and {uint32}", b.toCell());
    }


}
