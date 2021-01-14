#pragma once 

namespace tvm { namespace schema {

__interface IDInvoker {

	[[internal]]
	void invoke(address callee, cell request);
	[[internal]]
	void complete(address caller, cell response);
};

}}