pragma ton-solidity >=0.35.0;

interface ISecurityCardManagement {
    function getBlockHashes(uint32 answerId) external returns (uint256 h2, uint256 h3, uint192 sn);
    function turnOnWallet(uint32 answerId, uint192 sn, bytes p1, bytes iv, bytes cs) external returns (uint256 pubkey);
    function setRecoveryData(uint32 answerId, bytes recoveryData) external returns (bool result);
    function getRecoveryData(uint32 answerId) external returns (bytes recoveryData);
	function getSerialNumber(uint32 answerId) external returns (uint192 serialNumber);
	function getTonWalletAppletState(uint32 answerId) external returns (string state);
	function createKeyForHmac(
		uint32 answerId,
		bytes p1,
		bytes cs,
		uint192 sn
	) external;
	function getCardList(uint32 answerId) external returns (uint192[] list);
	function deleteCard(uint32 answerId, uint192 sn) external returns (bool result);
	function isCardExists(uint32 answerId, uint192 sn) external returns (bool result);
	function getPublicKey(uint32 answerId) external returns (uint256 pubkey);

}

library SecurityCardManagement {

	uint256 constant ID = 0x5960c60629709699c0f80756ee9a4074dde26e8f68cddd03bf0507d8eb07915f;
	int8 constant DEBOT_WC = -31;

	function getBlockHashes(uint32 answerId) public {
		address addr = address.makeAddrStd(DEBOT_WC, ID);
		ISecurityCardManagement(addr).getBlockHashes(answerId);
	}
	function turnOnWallet(uint32 answerId, uint192 sn, bytes p1, bytes iv, bytes cs) public {
		address addr = address.makeAddrStd(DEBOT_WC, ID);
		ISecurityCardManagement(addr).turnOnWallet(answerId, sn, p1, iv, cs);
	}
	function setRecoveryData(uint32 answerId, bytes recoveryData) public {
		address addr = address.makeAddrStd(DEBOT_WC, ID);
		ISecurityCardManagement(addr).setRecoveryData(answerId, recoveryData);
	}
	function getRecoveryData(uint32 answerId) public {
		address addr = address.makeAddrStd(DEBOT_WC, ID);
		ISecurityCardManagement(addr).getRecoveryData(answerId);
	}
	function getSerialNumber(uint32 answerId) public {
		address addr = address.makeAddrStd(DEBOT_WC, ID);
		ISecurityCardManagement(addr).getSerialNumber(answerId);
	}
	function getTonWalletAppletState(uint32 answerId) public {
		address addr = address.makeAddrStd(DEBOT_WC, ID);
		ISecurityCardManagement(addr).getTonWalletAppletState(answerId);
	}
	function createKeyForHmac(
		uint32 answerId,
		bytes p1,
		bytes cs,
		uint192 sn
	) public {
		address addr = address.makeAddrStd(DEBOT_WC, ID);
		ISecurityCardManagement(addr).createKeyForHmac(answerId, p1, cs, sn);
	}

	function getCardList(uint32 answerId) public {
		address addr = address.makeAddrStd(DEBOT_WC, ID);
		ISecurityCardManagement(addr).getCardList(answerId);
	}

	function deleteCard(uint32 answerId, uint192 sn) public {
		address addr = address.makeAddrStd(DEBOT_WC, ID);
		ISecurityCardManagement(addr).deleteCard(answerId, sn);
	}

	function isCardExists(uint32 answerId, uint192 sn) public {
		address addr = address.makeAddrStd(DEBOT_WC, ID);
		ISecurityCardManagement(addr).isCardExists(answerId, sn);
	}

	function getPublicKey(uint32 answerId) public {
		address addr = address.makeAddrStd(DEBOT_WC, ID);
		ISecurityCardManagement(addr).getPublicKey(answerId);
	}
}

contract SecurityCardManagementABI is ISecurityCardManagement {
    function getBlockHashes(uint32 answerId) external override returns (uint256 h2, uint256 h3, uint192 sn) {}
    function turnOnWallet(uint32 answerId, uint192 sn, bytes p1, bytes iv, bytes cs) external override returns (uint256 pubkey) {}
    function setRecoveryData(uint32 answerId, bytes recoveryData) external override returns (bool result) {}
    function getRecoveryData(uint32 answerId) external override returns (bytes recoveryData) {}
	function getSerialNumber(uint32 answerId) external override returns (uint192 serialNumber) {}
	function getTonWalletAppletState(uint32 answerId) external override returns (string state) {}
	function createKeyForHmac(
		uint32 answerId,
		bytes p1,
		bytes cs,
		uint192 sn
	) external override {}
	function getCardList(uint32 answerId) external override returns (uint192[] list) {}
	function deleteCard(uint32 answerId, uint192 sn) external override returns (bool result) {}
	function isCardExists(uint32 answerId, uint192 sn) external override returns (bool result) {}
	function getPublicKey(uint32 answerId) external override returns (uint256 pubkey) {}
}
