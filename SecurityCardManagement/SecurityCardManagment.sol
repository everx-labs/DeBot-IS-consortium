pragma solidity >= 0.6.0;
interface ISecurityCardManagement {
    function getBlockHashs(uint32 answerId) external returns (uint256 h2, uint256 h3); 
    function verifyPassword(uint32 answerId, uint128 p1, uint16 iv, uint32 ecs) external returns (uint256 pubkey);
    function addSigningBox(uint32 answerId, uint256 pubkey) external return (bool result);
    function setRecoveryData(uint32 answerId, bytes recoveryData) external return (bool result);
    function getRecoveryData(uint32 answerId) external return (bytes recoveryData);
    function resetCard(uint32 answerId, uint256 pubkey) external return (bool result);
}


library SecurityCardManagemenet {

	uint256 constant ID_SCMANAGMENT = 0x5960c60629709699c0f80756ee9a4074dde26e8f68cddd03bf0507d8eb07915f;
	int8 constant DEBOT_WC = -31;

	function getBlockHashs(uint32 answerId) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ID_SCMANAGMENT);
		ISecurityCardManagement(addr).getBlockHashs(answerId);
	}
	function verifyPassword(uint32 answerId, uint128 p1, uint16 iv, uint32 ecs) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ID_SCMANAGMENT);
		ISecurityCardManagement(addr).verifyPassword(answerId, p1, iv, ecs);
	}
	function addSigningBox(uint32 answerId, uint256 pubkey) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ID_SCMANAGMENT);
		ISecurityCardManagement(addr).addSigningBox(answerId, pubkey);
	}
	function setRecoveryData(uint32 answerId, bytes recoveryData) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ID_SCMANAGMENT);
		ISecurityCardManagement(addr).setRecoveryData(answerId, recoveryData);
	}
	function getRecoveryData(uint32 answerId) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ID_SCMANAGMENT);
		ISecurityCardManagement(addr).getRecoveryData(answerId);
	}
	function resetCard(uint32 answerId, uint256 pubkey) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ID_SCMANAGMENT);
		ISecurityCardManagement(addr).resetCard(answerId, pubkey);
	}

}
