#pragma once

namespace tvm { namespace schema {

__interface IStdin {

	[[internal, answer_id]]
	string getStr(string prompt);
	[[internal, answer_id]]
	uint256 getInt(string prompt);
	[[internal, answer_id]]
	int256 getUint(string prompt);
	[[internal, answer_id]]
	address getAddr(string prompt);
	[[internal, answer_id]]
	cell getCell(string prompt);
	[[internal, answer_id]]
	uint128 getTons(string prompt);

}
};