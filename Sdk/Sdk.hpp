#pragma once

namespace tvm { namespace schema {

struct KeyPair {
	uint256 publicKey;
	uint256 secretKey;
};

__interface ISdk {
	//account info
	[[internal, answer_id]]
	uint128 getBalance(address addr);
	[[internal, answer_id]]
	uint128 getAccountType(address addr);
	[[internal, answer_id]]
	uint128 getAccountCodeHash(address addr);
	//crypto 
	[[internal, answer_id]]
	bytes chacha20(bytes data, bytes nonce, uint256 key);
	//crypto utils
	[[internal, answer_id]]
	bytes signHash(uint256 hash);
	[[internal, answer_id]]
	bytes genRandom(uint32 length);
	//7z
	[[internal, answer_id]]
	KeyPair compress7z(bytes uncompressed);
	[[internal, answer_id]]
	bytes uncompress7z(bytes compressed);
}

}
};

