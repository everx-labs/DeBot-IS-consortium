pragma solidity >= 0.6.0;
interface IStdin {

	function getStr(uint32 answerId, string prompt) external returns (string value);
	function getInt (uint32 answerId, string prompt) external returns (int256 value);
	function getUint(uint32 answerId, string prompt) external returns (uint256 value);
	function getAddr(uint32 answerId, string prompt) external returns (address value);
	function getCell(uint32 answerId, string prompt) external returns (TvmCell value);
	function getTons(uint32 answerId, string prompt) external returns (uint128 value);

}

library Stdin {

	uint256 constant ID_STDIN = 0x8796536366ee21852db56dccb60bc564598b618c865fc50c8b1ab740bba128e3;
	int8 constant DEBOT_WC = -31;

	function getStr(uint32 answerId, string prompt) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ID_STDIN);
		IStdin(addr).getStr(answerId, prompt);
	}
	function getInt(uint32 answerId, string prompt) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ID_STDIN);
		IStdin(addr).getInt(answerId, prompt);
	}
	function getUint(uint32 answerId, string prompt) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ID_STDIN);
		IStdin(addr).getUint(answerId, prompt);
	}
	function getAddr(uint32 answerId, string prompt) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ID_STDIN);
		IStdin(addr).getAddr(answerId, prompt);
	}
	function getCell(uint32 answerId, string prompt) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ID_STDIN);
		IStdin(addr).getCell(answerId, prompt);
	}
	function getTons(uint32 answerId, string prompt) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ID_STDIN);
		IStdin(addr).getTons(answerId, prompt);
	}

}