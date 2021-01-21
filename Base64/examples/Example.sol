pragma solidity >= 0.6.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "Base64.sol";


contract ExampleContract {

    function test() public {
        string str = "aaa";
	Base64.encode(tvm.functionId(setEncode), str);
	string base64 = "YWFh";
        Base64.decode(tvm.functionId(setDecode), base64);
    }

    function setEncode(string base64) public pure {
        require(base64=="YWFh",100);
    }

    function setDecode(string str) public pure {
        require(str=="aaa",101);
    }
} 
