pragma ton-solidity >=0.35.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "AddressInput.sol";

contract ExampleContract {

    function start() public {
		AddressInput.get(tvm.functionId(setAddress), "Enter wallet address:");
	}

	function setAddress(address value) public {
	}

}