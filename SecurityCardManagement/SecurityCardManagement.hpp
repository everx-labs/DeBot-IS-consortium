#pragma once

namespace tvm { namespace schema {

struct blockHashsRes {
	uint256 h2;
	uint256 h3;
	uint192 sn;
};

__interface ISecurityCardManagement {

	[[internal, answer_id]]
	blockHashRes getBlockHashes();
	[[internal, answer_id]]
	uint256 turnOnWallet(uint192 sn, bytes p1, bytes iv, bytes esc);
	[[internal, answer_id]]
	bool_t setRecoveryData(bytes recoveryData);
	[[internal, answer_id]]
	bytes getRecoveryData();
	[[internal, answer_id]]
	uint192 getSerialNumber();
	[[internal, answer_id]]
	bytes getTonWalletAppletState();
	[[internal, answer_id]]
	void createKeyForHmac(bytes p1, bytes cs, uint192 sn);
	[[internal, answer_id]]
	uint192[] getCardList();
	[[internal, answer_id]]
	bool_t deleteCard(uint192 sn);
	[[internal, answer_id]]
	bool_t isCardExists(uint192 sn);
	[[internal, answer_id]]
	uint256 getPublicKey();
}
};
