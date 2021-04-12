#pragma once
namespace tvm { namespace schema {

__interface IJson {

	[[internal, answer_id]]
	bool_t deserialize(string json);

};

}}
