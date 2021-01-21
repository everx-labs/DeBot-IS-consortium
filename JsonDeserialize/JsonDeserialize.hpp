#pragma once

namespace tvm { namespace schema {

__interface IJsonDeserialize {

	[[internal, answer_id]]
	bool_t deserialize(string json, string structName);
	
};

}}
