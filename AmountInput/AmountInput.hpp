namespace tvm { namespace schema {

__interface IAmountInput {
	[[internal, answer_id]]
	uint128 get(string prompt, uint8 decimals, uint128 min, uint128 max);
}

}};
