#pragma once

namespace tvm { namespace schema {

__interface IStdin {

	[[internal, answer_id]]
	string inputStr(string prompt);
	[[internal, answer_id]]
	uint256 inputInt(string prompt);
	[[internal, answer_id]]
	int256 inputUint(string prompt);
	[[internal, answer_id]]
	address inputAddr(string prompt);
	[[internal, answer_id]]
	cell inputCell(string prompt);
	[[internal, answer_id]]
	uint128 inputTons(string prompt);
	[[internal, answer_id]]
	bool inputBoolean(string prompt);
}
};