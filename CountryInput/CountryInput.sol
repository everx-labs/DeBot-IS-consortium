pragma ton-solidity >=0.35.0;

interface ICountryInput {

    function get(uint32 answerId, string prompt, string[] permitted, string[] banned) external returns (string value);

}

library CountryInput {

    int8 constant DEBOT_WC = -31;
    uint256 constant ID = 0x9b593b1fec84f39a45821a119da78f79af36fe62a64541ba5fd04d5898cf6241;

    function get(uint32 answerId, string prompt, string[] permitted, string[] banned) public {
        address addr = address.makeAddrStd(DEBOT_WC, ID);
        ICountryInput(addr).get(answerId, prompt, permitted, banned);
    }

}

contract CountryInputABI is ICountryInput {

    function get(uint32 answerId, string prompt, string[] permitted, string[] banned) external override returns (string value) {}

}
