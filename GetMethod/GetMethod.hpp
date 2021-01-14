#pragma once

namespace tvm { namespace schema {

__interface IGetMethod {

	[[internal]]
	void run(uint32 answerId, cell message);
};

}} // namespace tvm::schema