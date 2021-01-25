pragma solidity >= 0.6.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "AddressInput.sol";

contract ExampleContract {

    function start() public {
		AddressInput.select(tvm.functionId(setAddress));
	}

	function setAddress(address value) public {
	}

}