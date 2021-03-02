namespace tvm { namespace schema {

__interface IConfirmInput {
	[[internal, answer_id]]
	bool_t get(string prompt);
}

}};