pragma solidity >= 0.6.0;
interface IStdin {

	function inputStr(uint32 answerId, string prompt) external returns (string value);
	function inputInt (uint32 answerId, string prompt) external returns (int256 value);
	function inputUint(uint32 answerId, string prompt) external returns (uint256 value);
	function inputAddr(uint32 answerId, string prompt) external returns (address value);
	function inputCell(uint32 answerId, string prompt) external returns (TvmCell value);
	function inputTons(uint32 answerId, string prompt) external returns (uint128 value);
	function inputBoolean(uint32 answerId, string prompt) external returns (bool value);

}

library Stdin {

	uint256 constant ID_STDIN = 0x8796536366ee21852db56dccb60bc564598b618c865fc50c8b1ab740bba128e3;
	int8 constant DEBOT_WC = -31;

	function inputStr(uint32 answerId, string prompt) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ID_STDIN);
		IStdin(addr).inputStr(answerId, prompt);
	}
	function inputInt(uint32 answerId, string prompt) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ID_STDIN);
		IStdin(addr).inputInt(answerId, prompt);
	}
	function inputUint(uint32 answerId, string prompt) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ID_STDIN);
		IStdin(addr).inputUint(answerId, prompt);
	}
	function inputAddr(uint32 answerId, string prompt) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ID_STDIN);
		IStdin(addr).inputAddr(answerId, prompt);
	}
	function inputCell(uint32 answerId, string prompt) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ID_STDIN);
		IStdin(addr).inputCell(answerId, prompt);
	}
	function inputTons(uint32 answerId, string prompt) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ID_STDIN);
		IStdin(addr).inputTons(answerId, prompt);
	}
	function inputBoolean(uint32 answerId, string prompt) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ID_STDIN);
		IStdin(addr).inputBoolean(answerId, prompt);
	}

}