pragma ton-solidity >=0.40.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "../Debot.sol";
import "../QRCode.sol";

contract Example is Debot {

    function start() public override {
        QRCode.scan(tvm.functionId(setResult));
    }

    function setResult(string value) public {
        // TODO: continue here, validate value and so on...

    }

    function getRequiredInterfaces() public view override returns (uint256[] interfaces) {
        return [ QRCode.ID ];
    }

    function getDebotInfo() public functionID(0xDEB) view override returns(
        string name, string version, string publisher, string key, string author,
        address support, string hello, string language, string dabi, bytes icon) {
        name = "QRCode Example";
        version = "0.1.0";
        publisher = "TON Labs";
        key = "Example DeBot for QRCode Interface";
        author = "TON Labs";
        support = address(0);
        hello = "Hello, I'm example DeBot.";
        language = "en";
        dabi = m_debotAbi.get();
        icon = "";
    }

}
