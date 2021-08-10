pragma ton-solidity >= 0.35.0;

interface IJson {

    function deserialize(uint32 answerId, string json) external returns (bool result);

}

library Json {

    uint256 constant ID = 0x442288826041d564ccedc579674f17c1b0a3452df799656a9167a41ab270ec19;
    int8 constant DEBOT_WC = -31;

    function deserialize(uint32 answerId, string json) public pure {
        address addr = address.makeAddrStd(DEBOT_WC, ID);
        IJson(addr).deserialize(answerId, json);
    }

}

contract JsonABI is IJson {
    function deserialize(uint32 answerId, string json) external override returns (bool result) {}
}