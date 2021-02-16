pragma ton-solidity >=0.35.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "AmountInput.sol";

contract ExampleContract {

    function start() public {
		AmountInput.get(tvm.functionId(setAmount), "Enter amount of tons:",  9, 1e9, 100e9);
	}

	function setAmount(uint128 value) public {
        // TODO: continue here
	}

}
