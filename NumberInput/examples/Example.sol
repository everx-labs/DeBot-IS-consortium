pragma ton-solidity >=0.35.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;

import "https://raw.githubusercontent.com/tonlabs/debots/main/Debot.sol";
import "../NumberInput.sol";

contract ExampleContract is Debot {

    function start() public override {
        NumberInput.get(tvm.functionId(setNumber), "Enter number:", -10, 100);
    }

    function setNumber(int256 value) public pure {
        // TODO: continue here
    }

    function getDebotInfo() public functionID(0xDEB) override view returns(
        string name, string version, string publisher, string key, string author,
        address support, string hello, string language, string dabi, bytes icon
    ) {
        name = "NumberInput example DeBot";
        version = "0.2.0";
        publisher = "TON Labs";
        key = "How to use the NumberInput interface";
        author = "TON Labs";
        support = address(0);
        hello = "Hello, i am an example DeBot.";
        language = "en";
        dabi = m_debotAbi.get();
        icon = "";
    }

    function getRequiredInterfaces() public view override returns (uint256[] interfaces) {
        return [ NumberInput.ID ];
    }

}
