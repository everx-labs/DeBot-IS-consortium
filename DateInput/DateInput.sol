pragma ton-solidity >= 0.35.0;

struct Date {
    uint8 day;
    uint8 month;
    uint16 year;
    int128 unixtime;
}

interface IDateInput {

	function get(uint32 answerId, string prompt, Date minDate, Date maxDate) external returns (Date date);

}

library DateInput {

    int8 constant DEBOT_WC = -31;
    uint256 constant ID = 0x4e862a9df81183ab425bdf0fbd76bd0b558c7f44c24887b4354bf1c26c74a623;

    function get(uint32 answerId, string prompt, Date minDate, Date maxDate) public pure {
        address addr = address.makeAddrStd(DEBOT_WC, ID);
        IDateInput(addr).get(answerId, prompt, minDate, maxDate);
    }

}

contract DateInputABI is IDateInput {

    function get(uint32 answerId, string prompt, Date minDate, Date maxDate) external override returns (Date value) {}

}

