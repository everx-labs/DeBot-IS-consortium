pragma ton-solidity >=0.35.0;

interface IPubkeyInput {

	function get(uint32 answerId, string prompt) external returns (uint256 value);

}

library PubkeyInput {

	uint256 constant ITF_ID = 0xd2245d17280e204409729e42a496afd6fc58bbf3a8f86b8550f0ee5cffc31114;
	int8 constant DEBOT_WC = -31;

	function get(uint32 answerId, string prompt) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ITF_ID);
		IPubkeyInput(addr).get(answerId, prompt);
	}

}

contract PubkeyInputABI is IPubkeyInput {

	function get(uint32 answerId, string prompt) external override returns (uint256 value) {}

}
