pragma ton-solidity >=0.35.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "NumberInput.sol";

contract ExampleContract {

    function start() public {
		NumberInput.get(tvm.functionId(setNumber), "Enter number:", -10, 100);
	}

	function setNumber(int256 value) public {
        // TODO: continue here
	}

}