pragma ton-solidity >=0.35.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "SecurityCardManagement.sol";

contract ExampleContract {

	function start() public {
		uint192 sn;
		bytes p1;
		bytes iv;
		bytes cs;
		uint256 pubkey;
		bytes recoveryData;

		SecurityCardManagemenet.getBlockHashes(tvm.functionId(setBlockHashes), sn);
		SecurityCardManagemenet.turnOnWallet(tvm.functionId(setVerify), p1, iv, cs);
		SecurityCardManagemenet.setRecoveryData(tvm.functionId(setRecoveryRes), recoveryData);
		SecurityCardManagemenet.getRecoveryData(tvm.functionId(setRecovery));
		SecurityCardManagemenet.createKeyForHmac(tvm.functionId(handleKeyCreation), p1, cs, sn);
	}

	function setBlockHashes(uint256 h2, uint256 h3, uint192 sn) public {
	}

	function setVerify(uint256 pubkey) public {
	}

	function setRecoveryRes(bool result) public {
	}

 	function setRecovery(bytes recoveryData) public {
	}

	function handleKeyCreation() public {
	}

}
