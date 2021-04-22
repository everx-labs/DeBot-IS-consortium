#pragma once

namespace tvm { namespace schema {

__interface IBase64 {

	[[internal, answer_id]]
	string deserialize(bytes data);
        [[internal, answer_id]]
	string deserialize(string base64);
	
};

}}
