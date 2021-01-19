#pragma once

namespace tvm { namespace schema {

struct blockHashRes {
	uint256 h2;
	uint256 h3;
};

__interface ISecurityCardManagement {

	[[internal, answer_id]]
	blockHashRes getBlockHashs(string strJson, string name, string value);
	[[internal, answer_id]]
	uint256 verifyPassword(uint128 p1, uint16 iv, uint32 esc);
	[[internal, answer_id]]
	bool_t addSigningBox(uint256 pubkey);
	[[internal, answer_id]]
	bool_t setRecoveryData(bytes recoveryData);
	[[internal, answer_id]]
	bytes getRecoveryData(string strJson, string name);
	[[internal, answer_id]]
	bool_t resetCard(uint256 pubkey);

}
};

