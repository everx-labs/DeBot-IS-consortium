pragma solidity >= 0.6.0;

interface IStdout {

    function print(string message) external;

}

library Stdout {

	uint256 constant ID_STDOUT = 0xc91dcc3fddb30485a3a07eb7c1e5e2aceaf75f4bc2678111de1f25291cdda80b;
	int8 constant DEBOT_WC = -31;

	function print(string message) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ID_STDOUT);
		IStdout(addr).print(message);
	}

} 