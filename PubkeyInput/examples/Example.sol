pragma ton-solidity >=0.35.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "PubkeyInput.sol";

contract ExampleContract {

    function start() public {
		PubkeyInput.get(tvm.functionId(setPubkey), "Enter your public key:");
	}

	function setPubkey(uint256 value) public {
        // TODO: continue here
	}

}
