#pragma once

namespace tvm { namespace schema {
__interface IMsg {

	[[internal, answer_id]]
	bool sendWithKeypair(cell message, uint256 pub, uint256 sec);

};

}}