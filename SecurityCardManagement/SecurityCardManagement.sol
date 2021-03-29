pragma solidity >= 0.6.0;
interface ISecurityCardManagement {
    function getBlockHashes(uint32 answerId, uint192 sn) external returns (uint256 h2, uint256 h3); 
    function turnOnWallet(uint32 answerId, uint192 sn, uint128 p1, uint16 iv, uint32 ecs) external returns (uint256 pubkey);
    function setRecoveryData(uint32 answerId, bytes recoveryData) external return (bool result);
    function getRecoveryData(uint32 answerId) external return (bytes recoveryData);
}


library SecurityCardManagemenet {

	uint256 constant ID_SCMANAGEMENT = 0x5960c60629709699c0f80756ee9a4074dde26e8f68cddd03bf0507d8eb07915f;
	int8 constant DEBOT_WC = -31;

	function getBlockHashes(uint32 answerId, uint192 sn) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ID_SCMANAGEMENT);
		ISecurityCardManagement(addr).getBlockHashes(answerId, sn);
	}
	function turnOnWallet(uint32 answerId, uint192 sn, uint128 p1, uint16 iv, uint32 ecs) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ID_SCMANAGEMENT);
		ISecurityCardManagement(addr).verifyPassword(answerId, sn, p1, iv, ecs);
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
