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

    uint256 m_public = 0x5f88dfedff20eef951ff26f4e5a88526929b195af091791a45cc8c6cb14961e4;
    uint256 m_private= 0xdcfe6f38f47ffbea6a2a51981c33ed655f7b849706544838101ea789ac7845ea;

    function start() public override {
        EncryptionBoxInput.getSupportedAlgorithms(tvm.functionId(setAlgorithms));
        string nonce = "abcdefghijklmnopqrstuvwx";
        uint256 theirPubkey = m_public;
        Terminal.print(
            0, format("Opening encryption box for NaclBox algorithm with parameters:\nnonce: {}\ntheir pubkey: {}", nonce, theirPubkey)
        );
        EncryptionBoxInput.getNaclBox(
            tvm.functionId(setEncryptionBox), 
            "Choose encryption keys", 
            bytes(nonce),
            theirPubkey
        );
    }

    function setAlgorithms(string[] names) public {
        Terminal.print(0, "Supported algorithms:");
        for (string name: names) {
            Terminal.print(0, format("{}", name));
        }
    }

    function setEncryptionBox(uint32 handle) public {
        Terminal.print(0, format("Handle opened: {}", handle));
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
