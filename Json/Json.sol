pragma ton-solidity >= 0.47.0;
import "https://raw.githubusercontent.com/tonlabs/DeBot-IS-consortium/main/libraries/JsonLib.sol";

interface IJson {

    function deserialize(uint32 answerId, string json) external returns (bool result);
    function parse(uint32 answerId, string json) external returns (bool result, JsonLib.Value obj);

}

library Json {

    uint256 constant ID = 0x442288826041d564ccedc579674f17c1b0a3452df799656a9167a41ab270ec19;
    int8 constant DEBOT_WC = -31;

    function deserialize(uint32 answerId, string json) public {
        address addr = address.makeAddrStd(DEBOT_WC, ID);
        IJson(addr).deserialize(answerId, json);
    }

    function parse(uint32 answerId, string json) public {
        address addr = address.makeAddrStd(DEBOT_WC, ID);
        IJson(addr).parse(answerId, json);
    }

}

contract JsonABI is IJson {
    function deserialize(uint32 answerId, string json) external override returns (bool result) {}
    function parse(uint32 answerId, string json) external override returns (bool result, JsonLib.Value obj) {}
}