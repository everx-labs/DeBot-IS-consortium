pragma solidity >= 0.6.0;

interface IJsonDeserialize {

    function deserialize(uint32 answerId, string json, string structName) external returns (bool result);

}

library JsonDeserialize {

	uint256 constant DEBOT_ADDR = 0x442288826041d564ccedc579674f17c1b0a3452df799656a9167a41ab270ec19;
	int8 constant DEBOT_WC = -31;

	function deserialize(uint32 answerId, string json, string structName) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, DEBOT_ADDR);
		IJsonDeserialize(addr).deserialize(answerId, json, structName);
	}

} 
