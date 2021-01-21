pragma solidity >= 0.6.0;
interface ISecurityCardManagement {
    function getBlockHashs(uint32 answerId) external returns (uint256 h2, uint256 h3); 
    function turnOnWallet(uint32 answerId, uint128 p1, uint16 iv, uint32 ecs) external returns (uint256 pubkey);
    function addSigningBox(uint32 answerId, uint256 pubkey) external return (bool result);
    function setRecoveryData(uint32 answerId, bytes recoveryData) external return (bool result);
    function getRecoveryData(uint32 answerId) external return (bytes recoveryData);
}


library SecurityCardManagemenet {

	uint256 constant ID_SCMANAGEMENT = 0x5960c60629709699c0f80756ee9a4074dde26e8f68cddd03bf0507d8eb07915f;
	int8 constant DEBOT_WC = -31;

	function getBlockHashs(uint32 answerId) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ID_SCMANAGEMENT);
		ISecurityCardManagement(addr).getBlockHashs(answerId);
	}
	function turnOnWallet(uint32 answerId, uint128 p1, uint16 iv, uint32 ecs) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ID_SCMANAGEMENT);
		ISecurityCardManagement(addr).verifyPassword(answerId, p1, iv, ecs);
	}
	function addSigningBox(uint32 answerId, uint256 pubkey) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ID_SCMANAGEMENT);
		ISecurityCardManagement(addr).addSigningBox(answerId, pubkey);
	}
	function setRecoveryData(uint32 answerId, bytes recoveryData) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ID_SCMANAGEMENT);
		ISecurityCardManagement(addr).setRecoveryData(answerId, recoveryData);
	}
	function getRecoveryData(uint32 answerId) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ID_SCMANAGEMENT);
		ISecurityCardManagement(addr).getRecoveryData(answerId);
	}

}
