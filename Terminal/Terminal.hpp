#pragma once

namespace tvm { namespace schema {

__interface IStdin {
	[[internal, answer_id]]
	string input(string prompt, bool multiline);
	[[internal]]
	bool print(string message);
	[[internal]]
	bool printf(string fmt, cell fargs);
};

}}