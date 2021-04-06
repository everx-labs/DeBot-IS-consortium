pragma ton-solidity >=0.35.0;
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

		SecurityCardManagemenet.getBlockHashes(tvm.functionId(setBlockHashes));
		SecurityCardManagemenet.turnOnWallet(tvm.functionId(setVerify),p1,iv,ecs);
		SecurityCardManagemenet.setRecoveryData(tvm.functionId(setRecoveryRes), recoveryData);
		SecurityCardManagemenet.getRecoveryData(tvm.functionId(setRecovery));
	}

	function setBlockHashes(uint256 h2, uint256 h3) public {
	}

	function setVerify(uint256 pubkey) public {
	}

	function setRecoveryRes(bool result) public {
	}

 	function setRecovery(bytes recoveryData){
	}
    
}
