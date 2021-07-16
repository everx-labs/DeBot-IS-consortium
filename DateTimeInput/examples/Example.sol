pragma ton-solidity >=0.35.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "https://raw.githubusercontent.com/tonlabs/debots/main/Debot.sol";
import "https://raw.githubusercontent.com/tonlabs/DeBot-IS-consortium/main/Terminal/Terminal.sol";
import "../DateTimeInput.sol";

contract ExampleContract is Debot {

    int128 m_datestamp;
    function start() public override {
        DateTimeInput.getDate(tvm.functionId(setDate), 
            "Choose a day in 2021 from the begining until current day:", 
            1609448400, int128(now));
    }

    function setDate(int128 date) public {
        // TODO: continue here
        Terminal.print(0, format("Date unixtime: {}", date));
        m_datestamp = date;
        DateTimeInput.getTime(tvm.functionId(setTime), 
            "Choose a day time (local):", 
            55800, 86100, 1, 0x7FFF);
    }

    function setTime(uint32 time, int16 timeZoneOffset) public {
        // TODO: continue here
        Terminal.print(0, format("Time timestamp: {}, time zone: {}", time, timeZoneOffset));

        Terminal.print(0, format("Date + time : {}", time + m_datestamp));
    }

    function getDebotInfo() public functionID(0xDEB) override view returns(
        string name, string version, string publisher, string caption, string author,
        address support, string hello, string language, string dabi, bytes icon
    ) {
        name = "DateTimeInput example DeBot";
        version = "0.1.0";
        publisher = "TON Labs";
        caption = "How to use the DateTimeInput interface";
        author = "TON Labs";
        support = address(0);
        hello = "Hello, i am an example DeBot.";
        language = "en";
        dabi = m_debotAbi.get();
        icon = "";
    }

    function getRequiredInterfaces() public view override returns (uint256[] interfaces) {
        return [ Terminal.ID, DateTimeInput.ID ];
    }

}
