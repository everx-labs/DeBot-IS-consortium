pragma ton-solidity >=0.35.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "../../Debot.sol";
import "../ConfirmInput.sol";

contract ExampleContract is Debot {

    function start() public override {
        ConfirmInput.get(tvm.functionId(setConfirm), "Say yes or no:");
    }

    function setConfirm(bool value) public pure {
        // TODO: continue here
    }

    function getDebotInfo() public functionID(0xDEB) override view returns(
        string name, string version, string publisher, string key, string author,
        address support, string hello, string language, string dabi, bytes icon
    ) {
        name = "ConfirmInput example DeBot";
        version = "0.2.0";
        publisher = "TON Labs";
        key = "How to use the ConfirmInput interface";
        author = "TON Labs";
        support = address.makeAddrStd(0, 0x841288ed3b55d9cdafa806807f02a0ae0c169aa5edfe88a789a6482429756a94);
        hello = "Hello, i am an example DeBot.";
        language = "en";
        dabi = "";
        icon = "";
    }

    function getRequiredInterfaces() public view override returns (uint256[] interfaces) {
        return [ ConfirmInput.ID ];
    }

}
