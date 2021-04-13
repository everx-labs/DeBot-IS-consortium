pragma ton-solidity >=0.35.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "../../Debot.sol";
import "../Terminal.sol";

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
        support = address.makeAddrStd(0, 0x841288ed3b55d9cdafa806807f02a0ae0c169aa5edfe88a789a6482429756a94);
        hello = "Hello, i am an example DeBot.";
        language = "en";
        dabi = "";
        icon = "";
    }

    function getRequiredInterfaces() public view override returns (uint256[] interfaces) {
        return [ Terminal.ID ];
    }

}
