pragma solidity >= 0.6.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "IOText.sol";

interface ISdk {

contract ExampleContract {
	
	bytes m_text;

	function start() public {
		IOText.input(tvm.functionId(setText),"input text:");
		IOText.output(tvm.functionId(setRes),m_text);
	}

	function setText(bytes text) public {
		m_text = text
	}
	function setRes(bool result) public {
	}
	
}
