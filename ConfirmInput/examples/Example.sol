pragma ton-solidity >=0.35.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "ConfirmInput.sol";

contract ExampleContract {

    function start() public {
		ConfirmInput.select(tvm.functionId(setConfirm), "Say yes or no:");
	}

	function setConfirm(bool value) public {
        // TODO: continue here
	}

}