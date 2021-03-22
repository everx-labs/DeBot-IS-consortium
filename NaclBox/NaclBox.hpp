#pragma once

namespace tvm { namespace schema {

struct EncryptResult {
	bytes encrypted
	uint256 publicKey
};

__interface INaclBox {
	[[internal, answer_id]]
	uint256 getPublicKey(uint256 publicKey);
	[[internal, answer_id]]
	EncryptResult encrypt(bytes decrypted, bytes nonce, uint256 their_public, uint256 publicKey);
	[[internal, answer_id]]
	bytes decrypt(bytes encrypted, bytes nonce, uint256 their_public, uint256 publicKey);
}

}
};

