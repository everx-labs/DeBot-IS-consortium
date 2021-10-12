pragma ton-solidity >=0.35.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;

import "../../Debot.sol";
import "../CountryInput.sol";

contract ExampleContract is Debot {

    function start() public override {
        ComboBoxInput.get(tvm.functionId(setSelection), "Select:", ["item1","item3","item2"]);
    }

    function setSelection(uint256 index) public pure {
        Terminal.print(0,format("index = {}",index));
        // TODO: continue here
    }

    function getDebotInfo() public functionID(0xDEB) override view returns(
        string name, string version, string publisher, string key, string author,
        address support, string hello, string language, string dabi, bytes icon
    ) {
        name = "ComboBoxInput example DeBot";
        version = "0.0.1";
        publisher = "TON Labs";
        key = "How to use the ComboBoxInput interface";
        author = "TON Labs";
        support = address.makeAddrStd(0, address(0));
        hello = "Hello, i am an example DeBot.";
        language = "en";
        dabi = "";
        icon = "";
    }

    function getRequiredInterfaces() public view override returns (uint256[] interfaces) {
        return [ ComboBoxInput.ID ];
    }

}
