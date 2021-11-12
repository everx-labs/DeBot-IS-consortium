pragma ton-solidity >=0.44.0;

interface IHex {

    function encode(uint32 answerId, bytes data) external returns (string hexstr);
    function decode(uint32 answerId, string hexstr) external returns (bytes data);

}

library Hex {

	uint256 constant ID = 0xedfbb00d6ebd16d57a1636774845af9499b400ba417da8552f40b1250256ff8f;
	int8 constant DEBOT_WC = -31;

	function encode(uint32 answerId, bytes data) public {
		address addr = address.makeAddrStd(DEBOT_WC, ID);
		IHex(addr).encode(answerId, data);
	}

	function decode(uint32 answerId, string hexstr) public {
		address addr = address.makeAddrStd(DEBOT_WC, ID);
		IHex(addr).decode(answerId, hexstr);
	}	

} 

contract HexABI is IHex {

    function encode(uint32 answerId, bytes data) external override returns (string hexstr) {}
    function decode(uint32 answerId, string hexstr) external override returns (bytes data) {}

}

