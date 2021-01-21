pragma solidity >= 0.6.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "JsonDeserialize.sol";


contract ExampleContract {
    struct Info{
      string name;
      string city;
      uint8 age;
    }

    function test() public {
        string json = "{\"name\":\"Joe\",\"city\":\"York\",\"age\":\"73\"}"
	JsonDeserialize.deserialize(tvm.functionId(setResult), json, "Info");
    }

    function setResult(Info res) public pure {
        require(res.name=="Joe",100);
        require(status.city == "York",101);
	require(status.age == 73,102);
    }

} 
