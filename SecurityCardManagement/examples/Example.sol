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

		SecurityCardManagemenet.getBlockHashes(tvm.functionId(setBlockHashes));
		SecurityCardManagemenet.turnOnWallet(tvm.functionId(setVerify), p1, iv, cs);
		SecurityCardManagemenet.setRecoveryData(tvm.functionId(setRecoveryRes), recoveryData);
		SecurityCardManagemenet.getRecoveryData(tvm.functionId(setRecovery));
		SecurityCardManagemenet.createKeyForHmac(tvm.functionId(handleKeyCreation), p1, cs, sn);
		SecurityCardManagemenet.getCardList(tvm.functionId(setSnList));
		SecurityCardManagemenet.deleteCard(tvm.functionId(checkDeletion), sn);
		SecurityCardManagemenet.isCardExists(tvm.functionId(checkExisting), sn);
		SecurityCardManagemenet.getPublicKey(tvm.functionId(setKey));
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

	function setSnList(uint192[] list) public {
	}

	function checkDeletion(bool result) public {
	}

	function checkExisting(bool result) public {
	}

	function setKey(uint256 pubkey) public {
	}

}
