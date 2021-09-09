pragma ton-solidity ==0.47.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "https://raw.githubusercontent.com/tonlabs/debots/main/Debot.sol";
import "../Base64.sol";

contract ExampleContract is Debot {

    function start() public override {
        Base64.encode(tvm.functionId(setEncoded), "abc");
    }

    function setEncoded(string base64) public {
        require(base64=="YWJj",101);
        Base64.decode(tvm.functionId(setDecoded), base64);
    }

    function setDecoded(bytes data) public {
        require(data=="abc",102);
        // TODO: continue here
    }

    function getDebotInfo() public functionID(0xDEB) override view returns(
        string name, string version, string publisher, string caption, string author,
        address support, string hello, string language, string dabi, bytes icon
    ) {
        name = "Base64 example DeBot";
        version = "0.2.0";
        publisher = "TON Labs";
        caption = "How to use the Base64 interface";
        author = "TON Labs";
        support = address(0);
        hello = "Hello, i am an example DeBot.";
        language = "en";
        dabi = m_debotAbi.get();
        icon = "";
    }

    function getRequiredInterfaces() public view override returns (uint256[] interfaces) {
        return [ Base64.ID ];
    }

}