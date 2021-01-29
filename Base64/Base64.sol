pragma solidity >= 0.6.0;

interface IBase64 {

    function encode(uint32 answerId, string str) external returns (string base64);
    function decode(uint32 answerId, string base64) external returns (string str);

}

library Base64 {

	uint256 constant ITF_ADDR = 0x8913b27b45267aad3ee08437e64029ac38fb59274f19adca0b23c4f957c8cfa1;
	int8 constant DEBOT_WC = -31;

	function encode(uint32 answerId, string str) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ITF_ADDR);
		IBase64(addr).encode(answerId, str);
	}

	function decode(uint32 answerId, string base64) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ITF_ADDR);
		IBase64(addr).decode(answerId, base64);
	}	

} 

contract Base64ABI is IBase64 {

    function encode(uint32 answerId, string str) external override returns (string base64) {}
    function decode(uint32 answerId, string base64) external override returns (string str) {}

}

