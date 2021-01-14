pragma solidity >= 0.6.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "Stdout.sol";

contract ExampleContract {

    function start() public {

		Stdout.print("Hello, world!");

	}

} 