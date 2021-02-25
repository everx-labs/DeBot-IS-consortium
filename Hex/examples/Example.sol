pragma solidity >= 0.6.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "Hex.sol";


contract ExampleContract {

    function test() public {
        bytes data = bytes("aaa");
        Hex.encode(tvm.functionId(setEncode), data);
        string hexstr = "616161";
        Hex.decode(tvm.functionId(setDecode), hexstr);
    }

    function setEncode(string hexstr) public pure {
        require(base64=="616161",100);
    }

    function setDecode(bytes data) public pure {
        require(string(data)=="aaa",101);
    }
} 
