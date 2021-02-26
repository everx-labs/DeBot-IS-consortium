namespace tvm { namespace schema {

__interface IAddressInput {

	[[internal, answer_id]]
	address get(string prompt);

};

}}