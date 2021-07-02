pragma ton-solidity >=0.35.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "https://raw.githubusercontent.com/tonlabs/debots/main/Debot.sol";
import "https://raw.githubusercontent.com/tonlabs/DeBot-IS-consortium/main/Terminal/Terminal.sol";
import "../TimeInput.sol";

contract ExampleContract is Debot {

    function start() public override {
        TimeInput.get(tvm.functionId(setTime), 
            "Choose a day time:", 
            Time(15, 30, 0), Time(23, 55, 0), 1, 0);
    }

    function setTime(Time time) public {
        // TODO: continue here
        Terminal.print(0, format("{}:{}, timestamp: {}", time.hrs, time.mins, time.timestamp));
    }

    function getDebotInfo() public functionID(0xDEB) override view returns(
        string name, string version, string publisher, string caption, string author,
        address support, string hello, string language, string dabi, bytes icon
    ) {
        name = "TimeInput example DeBot";
        version = "0.1.0";
        publisher = "TON Labs";
        caption = "How to use the TimeInput interface";
        author = "TON Labs";
        support = address(0);
        hello = "Hello, i am an example DeBot.";
        language = "en";
        dabi = m_debotAbi.get();
        icon = "";
    }

    function getRequiredInterfaces() public view override returns (uint256[] interfaces) {
        return [ Terminal.ID, TimeInput.ID ];
    }

}
