pragma ton-solidity >=0.35.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "https://raw.githubusercontent.com/tonlabs/debots/main/Debot.sol";
import "https://raw.githubusercontent.com/tonlabs/DeBot-IS-consortium/main/Terminal/Terminal.sol";
import "../DateInput.sol";

contract ExampleContract is Debot {

    function start() public override {
        DateInput.get(tvm.functionId(setDate), 
            "Choose a day in 2021 from the begining until current day:", 
            Date(1, 1, 2021, 0), Date(0, 0, 0, int128(now)));
    }

    function setDate(Date date) public {
        // TODO: continue here
        Terminal.print(0, format("{}/{}/{}, unixtime: {}", date.day, date.month, date.year, date.unixtime));
    }

    function getDebotInfo() public functionID(0xDEB) override view returns(
        string name, string version, string publisher, string caption, string author,
        address support, string hello, string language, string dabi, bytes icon
    ) {
        name = "DateInput example DeBot";
        version = "0.1.0";
        publisher = "TON Labs";
        caption = "How to use the DateInput interface";
        author = "TON Labs";
        support = address(0);
        hello = "Hello, i am an example DeBot.";
        language = "en";
        dabi = m_debotAbi.get();
        icon = "";
    }

    function getRequiredInterfaces() public view override returns (uint256[] interfaces) {
        return [ Terminal.ID, DateInput.ID ];
    }

}
