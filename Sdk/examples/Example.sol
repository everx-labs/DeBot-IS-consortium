pragma solidity >= 0.6.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "Sdk.sol";

interface ISdk {

contract ExampleContract {

	function start() public {
		uint256 key;
		bytes data,nonce;
		address addr = 0x0;
		uint32 len = 10;

		Sdk.getBalance(tvm.functionId(setBalance),addr);
		Sdk.getAccountType(tvm.functionId(setAccountType),addr);
		Sdk.getAccountCodeHash(tvm.functionId(setAccountCodeHash),addr);
		Sdk.chacha20(tvm.functionId(setEncrypted),data,nonce,key);
		Sdk.signHash(tvm.functionId(setSign),key);
		Sdk.genRandom(tvm.functionId(setRandom),len);
		Sdk.compress7z(tvm.functionId(setComp),data);
		Sdk.uncompress7z(tvm.functionId(setUncomp),data);


	}

	function setBalance(uint128 nanotokens) public {
	}
	function setAccountType(uint128 acc_type) public {
	}
	function setAccountCodeHash(uint256 code_hash) public {
	}
	function setEncrypted(bytes data) public {
	}
	function setSign(bytes arg1) public {
	}
	function setRandom(uint256 code_hash) public {
	}
	function setComp(bytes comp) public {
	}
	function setUncomp(bytes uncomp) public {
	}

}
