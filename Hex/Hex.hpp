#pragma once

namespace tvm { namespace schema {

__interface IHex {

	[[internal, answer_id]]
	string deserialize(bytes data);
        [[internal, answer_id]]
	string deserialize(string hexstr);
	
};

}}
