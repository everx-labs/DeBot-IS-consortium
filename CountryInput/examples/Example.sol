pragma ton-solidity >=0.35.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;

import "../../Debot.sol";
import "../CountryInput.sol";

contract ExampleContract is Debot {

    function start() public override {
        CountryInput.get(tvm.functionId(setCountryCode), "Enter your country code:", [], []);

        // or if Russia, Bulgaria and Cuba permitted for input:
        // CountryInput.get(tvm.functionId(setCountryCode), "Enter your country code:", ['RU', 'BG', 'CU'], []);

        // or if the drop-down list of countries should not include North Korea and Lebanon
        // CountryInput.get(tvm.functionId(setCountryCode), "Enter your country:", [], ['KP', 'LB']);
    }

    function setCountryCode(string value) public pure {
        // TODO: continue here
    }

    function getDebotInfo() public functionID(0xDEB) override view returns(
        string name, string version, string publisher, string key, string author,
        address support, string hello, string language, string dabi, bytes icon
    ) {
        name = "CountryInput example DeBot";
        version = "0.0.1";
        publisher = "TON Labs";
        key = "How to use the CountryInput interface";
        author = "TON Labs";
        support = address.makeAddrStd(0, address(0));
        hello = "Hello, i am an example DeBot.";
        language = "en";
        dabi = "";
        icon = "";
    }

    function getRequiredInterfaces() public view override returns (uint256[] interfaces) {
        return [ CountryInput.ID ];
    }

}
