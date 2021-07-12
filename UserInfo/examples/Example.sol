pragma ton-solidity >=0.40.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "https://raw.githubusercontent.com/tonlabs/debots/main/Debot.sol";
import "https://raw.githubusercontent.com/tonlabs/DeBot-IS-consortium/main/Terminal/Terminal.sol";
import "../UserInfo.sol";

contract ExampleContract is Debot {

    address m_wallet;
    uint256 m_pubkey;
    uint32 m_sbHandle;

    function start() public override {
        UserInfo.getAccount(tvm.functionId(setDefaultAccount));
        UserInfo.getPublicKey(tvm.functionId(setDefaultPubkey));
        UserInfo.getSigningBox(tvm.functionId(setSigningBox));
    }

    function setDefaultAccount(address value) public {
        Terminal.print(0, format("User account {}", value));
        m_wallet = value;
    }

    function setDefaultPubkey(uint256 value) public {
        Terminal.print(0, format("User public key {}", value));
        m_pubkey = value;
    }

    function setSigningBox(uint32 handle) public {
        Terminal.print(0, format("Signing box handle {}", handle));
        m_sbHandle = handle;
    }

    function getDebotInfo() public functionID(0xDEB) override view returns(
        string name, string version, string publisher, string caption, string author,
        address support, string hello, string language, string dabi, bytes icon
    ) {
        name = "UserInfo example DeBot";
        version = "0.2.0";
        publisher = "TON Labs";
        caption = "How to use UserInfo interface";
        author = "TON Labs";
        support = address(0);
        hello = "Hello, i am an example DeBot.";
        language = "en";
        dabi = m_debotAbi.get();
        icon = "";
    }

    function getRequiredInterfaces() public view override returns (uint256[] interfaces) {
        return [ Terminal.ID, UserInfo.ID ];
    }

}
