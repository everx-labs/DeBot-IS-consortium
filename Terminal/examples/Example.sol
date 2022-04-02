pragma ton-solidity >=0.35.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "https://raw.githubusercontent.com/tonlabs/debots/main/Debot.sol";
import "https://raw.githubusercontent.com/tonlabs/DeBot-IS-consortium/main/Terminal/Terminal.sol";

contract ExampleContract is Debot {

    function start() public override {
        Terminal.print(tvm.functionId(formatPrint), "I am Debot");
        Terminal.input(tvm.functionId(setText), "Enter your name:", false);
    }

    function setText(string value) public {
        // continue here
        string result = format("Hello {}", value);
        Terminal.print(0, result);
    }

    function formatPrint() public {
        TvmBuilder b;
        b.store(int8(1), uint32(10));
        Terminal.printf(0, "Enter number beetween {int8} and {uint32}", b.toCell());
    }

    function getDebotInfo() public functionID(0xDEB) override view returns(
        string name, string version, string publisher, string key, string author,
        address support, string hello, string language, string dabi, bytes icon
    ) {
        name = "Terminal example DeBot";
        version = "0.2.0";
        publisher = "TON Labs";
        key = "How to use the Terminal interface";
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
