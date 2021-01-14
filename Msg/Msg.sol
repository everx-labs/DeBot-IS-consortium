pragma solidity >= 0.6.0;

struct SendStatus {
	bool succeeded; 
	int32 code;
}

interface IMsg {

    function send(uint32 answerId, TvmCell message, bool defSigner) external returns (SendStatus status);

}

library Msg {

	uint256 constant ID_MSG = 0x96517b3e086fdd7dbd0fb916ab59aad1c86bcc6e18376bfa847ac91fefb083a6;
	int8 constant DEBOT_WC = -31;

	function send(uint32 answerId, TvmCell message, bool defSigner) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ID_MSG);
		IMsg(addr).send(answerId, message, defSigner);
	}

} 