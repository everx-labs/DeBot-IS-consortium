pragma ton-solidity ^ 0.47.0;

interface IComboBoxInput {

    function get(uint32 answerId, string prompt, string[] items) external returns (uint index);

}

library ComboBoxInput {

    int8 constant DEBOT_WC = -31;
    uint256 constant ID = 0x5bb3dcbe1a54be9664cb33caf585ff06ed9fe950b8674c279faf746c5cff4132;

    function get(uint32 answerId, string prompt, string[] items) public pure {
        address addr = address.makeAddrStd(DEBOT_WC, ID);
        IComboBoxInput(addr).get(answerId, prompt, items);
    }

}

contract ComboBoxInputABI is IComboBoxInput {

    function get(uint32 answerId, string prompt, string[] items) external override returns (uint index) {}

}
