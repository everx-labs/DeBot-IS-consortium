pragma solidity >= 0.6.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "Base64.sol";


contract ExampleContract {

    function test() public {
        bytes data = bytes("aaa");
        Base64.encode(tvm.functionId(setEncode), data);
        string base64 = "YWFh";
        Base64.decode(tvm.functionId(setDecode), base64);
    }

    function setEncode(string base64) public pure {
        require(base64=="YWFh",100);
    }

    function setDecode(bytes data) public pure {
        require(string(data)=="aaa",101);
    }
} 
