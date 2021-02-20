namespace tvm { namespace schema {

__interface INumberInput {
	[[internal, answer_id]]
	int256 get(string prompt, int256 min, int256 max);
}

}};