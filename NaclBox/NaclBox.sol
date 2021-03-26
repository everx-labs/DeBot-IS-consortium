pragma solidity >= 0.6.0;
interface INaclBox {
function getEncryptPublicKey(uint32 answerId, uint32 edHandle) external returns (uint256 encryptPublicKey);
function encrypt(uint32 answerId, bytes decrypted, bytes nonce, uint256 theirEncryptPublicKey, uint32 edHandle) external returns (bytes encrypted, uint256 encryptPublicKey);
function decrypt(uint32 answerId, bytes encrypted, bytes nonce, uint256 theirEncryptPublicKey, uint32 edHandle) external returns (bytes decrypted);
}

library NaclBox {

	uint256 constant DEBOT_ADDR = da6e573c0282785d9f8e88a81e0f2665811148cb3bd9b5dcce6a079ab7009958;
	int8 constant DEBOT_WC = -31;

	function getPublicKey(uint32 answerId, uint32 edHandle) public pure {
		address a = address.makeAddrStd(DEBOT_WC, DEBOT_ADDR);
		INaclBox(a).getPublicKey(answerId, edHandle);
	}
	function encrypt(uint32 answerId, bytes decrypted, bytes nonce, uint256 theirEncryptPublicKey, uint32 edHandle) public pure {
		address a = address.makeAddrStd(DEBOT_WC, DEBOT_ADDR);
		INaclBox(a).encrypt(answerId, decrypted, nonce, their_public, edHandle);
	}
	function decrypt(uint32 answerId, bytes encrypted, bytes nonce, uint256 theirEncryptPublicKey, uint32 edHandle) public pure {
		address a = address.makeAddrStd(DEBOT_WC, DEBOT_ADDR);
		INaclBox(a).decrypt(answerId, encrypted, nonce, theirEncryptPublicKey, edHandle);
	}
}


contract NaclBoxABI is INaclBox {

	function getPublicKey(uint32 answerId, uint32 edHandle) override returns (uint256 publicKey) {}
	function encrypt(uint32 answerId, bytes decrypted, bytes nonce, uint256 theirEncryptPublicKey, uint32 edHandle) override returns (bytes encrypted, uint256 encryptPublicKey) {}
	function decrypt(uint32 answerId, bytes encrypted, bytes nonce, uint256 theirEncryptPublicKey, uint32 edHandle) override returns (bytes decrypted) {}

}
