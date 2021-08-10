pragma ton-solidity >=0.45.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "https://raw.githubusercontent.com/tonlabs/debots/main/Debot.sol";
import "https://raw.githubusercontent.com/tonlabs/DeBot-IS-consortium/main/Terminal/Terminal.sol";
import "../Media.sol";

contract ExampleContract is Debot {

    string m_pngBase64;
    function start() public override {
        Media.getSupportedMediaTypes(tvm.functionId(setMediaTypes));
    }

    function setMediaTypes(string[] mediaTypes) public {
        for (string mtype: mediaTypes) {
            Terminal.print(0, mtype);
        }
        Media.output(tvm.functionId(setResult), "PNG image", format("data:image/png;base64,{}", m_pngBase64));
    }

    function setResult(MediaStatus result) public pure {
        require(result == MediaStatus.Success);
        // TODO: continue here.
    }

    function getDebotInfo() public functionID(0xDEB) override view returns(
        string name, string version, string publisher, string caption, string author,
        address support, string hello, string language, string dabi, bytes icon
    ) {
        name = "Media example DeBot";
        version = "0.1.0";
        publisher = "TON Labs";
        caption = "How to use Media interface";
        author = "TON Labs";
        support = address(0);
        hello = "Hello, i am an example DeBot.";
        language = "en";
        dabi = m_debotAbi.get();
        icon = "";
    }

    function getRequiredInterfaces() public view override returns (uint256[] interfaces) {
        return [ Terminal.ID, Media.ID ];
    }

}
