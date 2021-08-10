pragma ton-solidity >=0.47.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "https://raw.githubusercontent.com/tonlabs/debots/main/Debot.sol";
import "../ConfirmInput.sol";

contract ExampleContract is Debot {

    function start() public override {
        ConfirmInput.get(tvm.functionId(setConfirm), "Say yes or no:");
    }

    function setConfirm(bool value) public pure {
        // TODO: continue here
    }

    function getDebotInfo() public functionID(0xDEB) override view returns(
        string name, string version, string publisher, string caption, string author,
        address support, string hello, string language, string dabi, bytes icon
    ) {
        name = "ConfirmInput example DeBot";
        version = "0.2.0";
        publisher = "TON Labs";
        caption = "How to use the ConfirmInput interface";
        author = "TON Labs";
        support = address(0);
        hello = "Hello, i am an example DeBot.";
        language = "en";
        dabi = "";
        icon = "";
    }

    function getRequiredInterfaces() public view override returns (uint256[] interfaces) {
        return [ ConfirmInput.ID ];
    }

}
