pragma solidity >= 0.6.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "SecurityCardManagement.sol";

contract ExampleContract {

	function start() public {
		uint128 p1;
		uint16 iv;
		uint32 ecs;
		uint256 pubkey;
		bytes recoveryData;

		SecurityCardManagemenet.getBlockHashs(tvm.functionId(setBlockHashs));
		SecurityCardManagemenet.verifyPassword(tvm.functionId(setVerify),p1,iv,ecs);
		SecurityCardManagemenet.addSigningBox(tvm.functionId(setAddSBRes), pubkey);
		SecurityCardManagemenet.setRecoveryData(tvm.functionId(setRecoveryRes), recoveryData);
		SecurityCardManagemenet.getRecoveryData(tvm.functionId(setRecovery));
		SecurityCardManagemenet.resetCard(tvm.functionId(setReset), uint256 pubkey);
	}

	function setBlockHashs(uint256 h2, uint256 h3) public {
	}

	function setVerify(uint256 pubkey) public {
	}

	function setAddSBRes(bool result) public {
	}

	function setRecoveryRes(bool result) public {
	}

 	function setRecovery(bytes recoveryData){
	}

	function setResetRes(bool result) public {
	}	
    
}
