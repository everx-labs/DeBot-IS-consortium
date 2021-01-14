#pragma once

namespace tvm { namespace schema {

__interface IStdout {

	[[internal]]
	void print(string message);

}
};