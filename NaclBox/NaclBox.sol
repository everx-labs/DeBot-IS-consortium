pragma solidity >= 0.6.0;
interface INaclBox {
function getEncryptPublicKey(uint32 answerId, uint256 signPublicKey) external returns (uint256 encryptPublicKey);
function encrypt(uint32 answerId, bytes decrypted, bytes nonce, uint256 theirEncryptPublicKey, uint256 signPublicKey) external returns (bytes encrypted, uint256 encryptPublicKey);
function decrypt(uint32 answerId, bytes encrypted, bytes nonce, uint256 theirEncryptPublicKey, uint256 signPublicKey) external returns (bytes decrypted);
}

library NaclBox {

	uint256 constant DEBOT_ADDR = da6e573c0282785d9f8e88a81e0f2665811148cb3bd9b5dcce6a079ab7009958;
	int8 constant DEBOT_WC = -31;

	function getPublicKey(uint32 answerId, uint256 publicKey) public pure {
		address a = address.makeAddrStd(DEBOT_WC, DEBOT_ADDR);
		INaclBox(a).getPublicKey(answerId, publicKey);
	}
	function encrypt(uint32 answerId, bytes decrypted, bytes nonce, uint256 theirEncryptPublicKey, uint256 signPublicKey) public pure {
		address a = address.makeAddrStd(DEBOT_WC, DEBOT_ADDR);
		INaclBox(a).encrypt(answerId, decrypted, nonce, their_public, signPublicKey);
	}
	function decrypt(uint32 answerId, bytes encrypted, bytes nonce, uint256 theirEncryptPublicKey, uint256 signPublicKey) public pure {
		address a = address.makeAddrStd(DEBOT_WC, DEBOT_ADDR);
		INaclBox(a).decrypt(answerId, encrypted, nonce, theirEncryptPublicKey, signPublicKey);
	}
}


contract NaclBoxABI is INaclBox {

	function getPublicKey(uint32 answerId, uint256 publicKey) override returns (uint256 publicKey) {}
	function encrypt(uint32 answerId, bytes decrypted, bytes nonce, uint256 theirEncryptPublicKey, uint256 signPublicKey) override returns (bytes encrypted, uint256 encryptPublicKey) {}
	function decrypt(uint32 answerId, bytes encrypted, bytes nonce, uint256 theirEncryptPublicKey, uint256 signPublicKey) override returns (bytes decrypted) {}

}
