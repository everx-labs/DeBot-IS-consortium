pragma ton-solidity >= 0.45.0;

interface IEncryptionBoxInput {

	function get(uint32 answerId, string prompt, string algorithm, TvmCell params) external returns (uint32 handle);
    function remove(uint32 answerId, uint32 handle) external returns (bool removed);
    function getSupportedAlgorithms(uint32 answerId) external returns (string[] names);
}

library EncryptionBoxInput {

	uint256 constant ID = 0x5b5f76b54d976d72f1ada3063d1af2e5352edaf1ba86b3b311170d4d81056d61;
	int8 constant DEBOT_WC = -31;

	function get(uint32 answerId, string prompt, string algorithm, TvmCell params) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ID);
		IEncryptionBoxInput(addr).get(answerId, prompt, algorithm, params);
	}

    function getSupportedAlgorithms(uint32 answerId) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ID);
		IEncryptionBoxInput(addr).getSupportedAlgorithms(answerId);
	}

    function remove(uint32 answerId, uint32 handle) public pure {
        address addr = address.makeAddrStd(DEBOT_WC, ID);
		IEncryptionBoxInput(addr).remove(answerId, handle);
    }
}

contract EncryptionBoxInputABI is IEncryptionBoxInput {

	function get(uint32 answerId, string prompt, string algorithm, TvmCell params) external override returns (uint32 handle) {}
    function remove(uint32 answerId, uint32 handle) external override returns (bool removed) {}
    function getSupportedAlgorithms(uint32 answerId) external override returns (string[] names) {}

}
