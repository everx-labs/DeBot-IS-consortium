namespace tvm { namespace schema {

__interface IAmountInput {
	[[internal, answer_id]]
	uint256 get(string prompt, uint8 decimals, uint256 min, uint256 max);
}

}};