pragma solidity >= 0.6.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "SigningBoxInput.sol";
import "NaclBox.sol";


contract ExampleContract {

	uint256 m_signingBox;
	uint256 m_curve25519PublicKey;

	function start() public {
		SigningBoxInput.get(tvm.functionId(setSigningBox),"Select signing box",[]);
	}

	function setSigningBox(uint256 publicKey) public {
		m_signingBox = publicKey;
		NaclBox.getPublicKey(tvm.functionId(setCurve256PublicKey),m_signingBox);
	}
	function setCurve256PublicKey(uint256 encryptPublicKey) public {
		m_curve25519PublicKey = publicKey;
	}
    
}
