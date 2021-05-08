pragma ton-solidity >=0.40.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "../Debot.sol";
import "../Terminal.sol";
import "../UserInfo.sol";

contract ExampleContract is Debot {

    address m_wallet;
    uint256 m_pubkey;

    function start() public override {
        UserInfo.getAccount(tvm.functionId(setDefaultAccount));
        UserInfo.getPublicKey(tvm.functionId(setDefaultPubkey));
    }

    function setDefaultAccount(address value) public {
        Terminal.print(0, format("User account is {}", value));
        m_wallet = value;
    }

    function setDefaultPubkey(uint256 value) public {
        Terminal.print(0, format("User public key is {}", value));
        m_pubkey = value;
    }

    function getDebotInfo() public functionID(0xDEB) override view returns(
        string name, string version, string publisher, string key, string author,
        address support, string hello, string language, string dabi, bytes icon
    ) {
        name = "UserInfo example DeBot";
        version = "0.1.0";
        publisher = "TON Labs";
        key = "How to use UserInfo interface";
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
