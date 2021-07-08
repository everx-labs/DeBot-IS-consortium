pragma ton-solidity >=0.45.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "https://raw.githubusercontent.com/tonlabs/debots/main/Debot.sol";
import "https://raw.githubusercontent.com/tonlabs/DeBot-IS-consortium/main/Terminal/Terminal.sol";
import "../EncryptionBoxInput.sol";

contract ExampleContract is Debot {

    uint32 m_boxHandle;

    string m_openedData;

    function start() public override {
        EncryptionBoxInput.getSupportedAlgorithms(tvm.functionId(setAlgorithms));
        TvmBuilder algorithmParams;
        string nonce = "akunamatataa";
        uint256 theirPubkey = 0x357ba881d0b02857a188d2f09a5334d04dd3800fcf9d7af527fccc94979c5540;
        algorithmParams.store(nonce, theirPubkey);
        EncryptionBoxInput.get(
            tvm.functionId(setEncryptionBox), 
            "Choose encryption keys", 
            "NaclBox", 
            algorithmParams.toCell()
        );
    }

    function setAlgorithms(string[] names) public {
        Terminal.print(0, "Supported algorithms:");
        for (string name: names) {
            Terminal.print(0, format("{}", name));
        }
    }

    function setEncryptionBox(uint32 handle) public {
        Terminal.print(0, format("Encryption Box Handle {}", handle));
        m_boxHandle = handle;
        
        m_openedData = "Data to encrypt";
        // TODO: Use Sdk interface to encrypt.
        // Sdk.encrypt(tvm.function(setEncryptionResult), m_boxHandle, m_openedData);
    }

    function setEncryptionResult(bytes encrypted) public {
        // TOOD: Use Sdk interface to decrypt data.
        // Sdk.decrypt(tvm.function(setDecryptionResult), m_boxHandle, encrypted);
    }

    function setDecryptionResult(bytes decrypted) public {
        require(tvm.hash(decrypted) == tvm.hash(bytes(m_openedData)), 400);
        EncryptionBoxInput.remove(tvm.functionId(setRemoveResult), m_boxHandle);
    }

    function setRemoveResult(bool removed) public pure {
        require(removed, 401);
    }

    function getDebotInfo() public functionID(0xDEB) override view returns(
        string name, string version, string publisher, string key, string author,
        address support, string hello, string language, string dabi, bytes icon
    ) {
        name = "EncryptionBoxInput example DeBot";
        version = "0.1.0";
        publisher = "TON Labs";
        key = "How to use EncryptionBoxInput interface";
        author = "TON Labs";
        support = address(0);
        hello = "Hello, i am an example DeBot.";
        language = "en";
        dabi = m_debotAbi.get();
        icon = "";
    }

    function getRequiredInterfaces() public view override returns (uint256[] interfaces) {
        return [ Terminal.ID, EncryptionBoxInput.ID ];
    }

}
