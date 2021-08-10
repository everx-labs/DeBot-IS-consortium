pragma ton-solidity >=0.47.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "https://raw.githubusercontent.com/tonlabs/debots/main/Debot.sol";
import "../Terminal.sol";

contract ExampleContract is Debot {

    function start() public override {
        Terminal.print(0, "I am Debot");
        Terminal.input(tvm.functionId(setText), "Enter your name:", false);
    }

    function setText(string value) public {
        // continue here
        string result = format("Hello, {}!", value);
        Terminal.print(0, result);
    }

    function getDebotInfo() public functionID(0xDEB) override view returns(
        string name, string version, string publisher, string caption, string author,
        address support, string hello, string language, string dabi, bytes icon
    ) {
        name = "Terminal example DeBot";
        version = "0.2.0";
        publisher = "TON Labs";
        caption = "How to use the Terminal interface";
        author = "TON Labs";
        support = address(0);
        hello = "Hello, i am an example DeBot.";
        language = "en";
        dabi = m_debotAbi.get();
        icon = "";
    }

    function getRequiredInterfaces() public view override returns (uint256[] interfaces) {
        return [ Terminal.ID ];
    }

}
