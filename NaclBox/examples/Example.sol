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

pragma ton-solidity >=0.40.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "../Debot.sol";
import "../SigningBoxInput.sol";
import "../NaclBox.sol";

contract Example is Debot {

	uint32 m_signingBoxHandle;
	uint256 m_curve25519PublicKey;

    function start() public override {
        SigningBoxInput.get(tvm.functionId(setSigningBox),"Select signing box",[]);
    }

    function setSigningBox(uint32 handle) public {
		m_signingBoxHandle = handle;
		NaclBox.getPublicKey(tvm.functionId(setCurve256PublicKey),m_signingBoxHandle);
	}

	function setCurve256PublicKey(uint256 encryptPublicKey) public {
		m_curve25519PublicKey = publicKey;
		Terminal.print(0,format("encryption public key: {:064x}",m_curve25519PublicKey));
		 // TODO: continue here
	}

    function getRequiredInterfaces() public view override returns (uint256[] interfaces) {
        return [ NaclBox.ID, SigningBoxInput.ID ];
    }

    function getDebotInfo() public functionID(0xDEB) view override returns(
        string name, string version, string publisher, string key, string author,
        address support, string hello, string language, string dabi, bytes icon) {
        name = "NaclBox Example";
        version = "0.1.0";
        publisher = "TON Labs";
        key = "Example DeBot for NaclBox Interface";
        author = "TON Labs";
        support = address(0);
        hello = "Hello, I'm NaclBox example DeBot.";
        language = "en";
        dabi = m_debotAbi.get();
        icon = "";
    }

}
