pragma solidity >= 0.6.0;
interface IIOText {
	function input(uint32 answerId, string prompt) external returns (bytes text);
	function output(uint32 answerId, bytes text) external returns (bool result);
}

library IOText {

	uint256 constant ID = 0xfecaec789cea79b3c3aff019cfa32f3e707edce10221c3f7e24dec264467c5bf;
	int8 constant DEBOT_WC = -31;

	function input(uint32 answerId, string prompt) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ID);
		IIOText(addr).input(answerId, prompt);
	}
	function output(uint32 answerId, bytes text) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ID);
		IIOText(addr).output(answerId, text);
	}
}

contract IOTextABI is IIOText {
	function input(uint32 answerId, string prompt) external override returns (bytes text) {}
	function output(uint32 answerId, bytes text) external override returns (bool result) {}
}
