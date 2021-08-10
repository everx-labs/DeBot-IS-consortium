pragma ton-solidity >=0.47.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "https://raw.githubusercontent.com/tonlabs/debots/main/Debot.sol";
import "../AmountInput.sol";

contract ExampleContract is Debot {

    function start() public override {
        AmountInput.get(tvm.functionId(setAmount), "Enter amount of tons:", 9, 1e9, 100e9);
    }

    function setAmount(uint128 value) public pure {
        // TODO: continue here
    }

    function getDebotInfo() public functionID(0xDEB) override view returns(
        string name, string version, string publisher, string caption, string author,
        address support, string hello, string language, string dabi, bytes icon
    ) {
        name = "AmountInput example DeBot";
        version = "0.2.0";
        publisher = "TON Labs";
        caption = "How to use the AmountInput interface";
        author = "TON Labs";
        support = address(0);
        hello = "Hello, i am an example DeBot.";
        language = "en";
        dabi = m_debotAbi.get();
        icon = "";
    }

    function getRequiredInterfaces() public view override returns (uint256[] interfaces) {
        return [ AmountInput.ID ];
    }

}

