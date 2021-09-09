pragma ton-solidity >=0.40.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "../Sdk.sol";
import "https://raw.githubusercontent.com/tonlabs/debots/main/Debot.sol";
import "https://raw.githubusercontent.com/tonlabs/DeBot-IS-consortium/main/Terminal/Terminal.sol";
import "https://raw.githubusercontent.com/tonlabs/DeBot-IS-consortium/main/UserInfo/UserInfo.sol";
import "https://raw.githubusercontent.com/tonlabs/DeBot-IS-consortium/main/EncryptionBoxInput/EncryptionBoxInput.sol";

contract ExampleContract is Debot {
    address addr = address.makeAddrStd(-1, 0x3333333333333333333333333333333333333333333333333333333333333333);
    uint32 m_sbHandle;
    uint32 m_ebHandle;

	function start() override public {
		uint32 len = 10;

        UserInfo.getSigningBox(tvm.functionId(setSigningBox));
        EncryptionBoxInput.getChaCha20Box(tvm.functionId(setEncryptionHandle), "Choose encryption keys", bytes("bytes of nonce"));

		Sdk.getBalance(tvm.functionId(setBalance), addr);
		Sdk.getAccountType(tvm.functionId(setAccountType), addr);
		Sdk.getAccountCodeHash(tvm.functionId(setAccountCodeHash), addr);
		Sdk.genRandom(tvm.functionId(setRandom), len);
	}

    function setSigningBox(uint32 handle) public {
        string signingData = "Data to sign";
        m_sbHandle = handle;
        Sdk.getSigningBoxInfo(tvm.functionId(checkSingingBoxInfo), handle);
        Sdk.signHash(tvm.functionId(setSign), handle, tvm.hash(bytes(signingData)));
    }

    function checkSingingBoxInfo(uint32 result, uint256 key) public {
        // TODO: use box public key
        require(result == 0);
        Terminal.print(0, format("Signing public key: {}", key));
    }

	function setBalance(uint128 nanotokens) public {
        Terminal.print(0, format("Balance: {:t}", nanotokens));
	}
	function setAccountType(int8 acc_type) public {
        Terminal.print(0, format("Account type: {}", acc_type));
    }
	function setAccountCodeHash(uint256 code_hash) public {
        Terminal.print(0, format("Account code hash: {}", code_hash));
    }
    function setEncryptionHandle(uint32 handle) public {
        string data = "Data to encrypt";
        Sdk.encrypt(tvm.functionId(setEncrypted), handle, bytes(data));
        m_ebHandle = handle;
    }
	function setEncrypted(bytes encrypted) public {
        Terminal.print(0, format("Encrypted: {}", encrypted));
        Sdk.decrypt(tvm.functionId(setDecrypted), m_ebHandle, encrypted);
    }
    function setDecrypted(bytes decrypted) public {
        Terminal.print(0, format("Decrypted: {}", decrypted));
    }
	function setSign(bytes signature) public {
        Terminal.print(0, format("Signature: {}", signature));
	}
	function setRandom(bytes buffer) public {
        Terminal.print(0, format("Random bytes: {}", buffer));
	}

    function getDebotInfo() public functionID(0xDEB) override view returns(
        string name, string version, string publisher, string caption, string author,
        address support, string hello, string language, string dabi, bytes icon
    ) {
        name = "Sdk interface example";
        version = "0.1.0";
        publisher = "TON Labs";
        caption = "How to use Sdk interface";
        author = "TON Labs";
        support = address(0);
        hello = "Hello, i am an example DeBot.";
        language = "en";
        dabi = m_debotAbi.get();
        icon = "";
    }

    function getRequiredInterfaces() public view override returns (uint256[] interfaces) {
        return [ Terminal.ID, EncryptionBoxInput.ID, UserInfo.ID ];
    }
}
