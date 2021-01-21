#pragma once

namespace tvm { namespace schema {

__interface IBase64 {

	[[internal, answer_id]]
	string deserialize(string str);
        [[internal, answer_id]]
	string deserialize(string base64);
	
};

}}
