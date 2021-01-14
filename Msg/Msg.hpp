#pragma once

namespace tvm { namespace schema {

struct SendStatus {
	bool succeeded; 
	int32 code;
}

__interface IMsg {

	[[internal, answer_id]]
	SendStatus send(cell message, bool def_signer);
    
};

}}