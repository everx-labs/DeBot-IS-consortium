#pragma once

namespace tvm { namespace schema {

__interface ITerminal {
	[[internal, answer_id]]
	string input(string prompt, bool multiline);
	[[internal, answer_id]]
	bool_t print(string message);
	[[internal, answer_id]]
	bool_t printf(string fmt, cell fargs);
};

}}