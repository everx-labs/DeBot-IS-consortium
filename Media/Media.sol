pragma ton-solidity >= 0.40.0;

enum MediaStatus {
    Success,
    UnsupportedMediatype,
    InvalidDataScheme
}

interface IMedia {
    function output(uint32 answerId, string prompt, string data) external returns (MediaStatus result);
    function getSupportedMediatypes(uint32 answerId) external returns (string mediatypes);
}

library Media {

    int8 constant DEBOT_WC = -31;
    uint256 constant ID = 0x59cdc2aafe53760937dac5b1c4b89ce12950f56a56298108a987cfe49b7c84b5;

    function output(uint32 answerId, string prompt, string data) public pure {
        address addr = address.makeAddrStd(DEBOT_WC, ID);
        IMedia(addr).output(answerId, prompt, data);
    }

    function getSupportedMediatypes(uint32 answerId) public pure {
        address addr = address.makeAddrStd(DEBOT_WC, ID);
        IMedia(addr).getSupportedMediatypes(answerId);
    }

}

contract MediaABI is IMedia {

    function output(uint32 answerId, string prompt, string data) external override returns (MediaStatus result) {}
    function getSupportedMediatypes(uint32 answerId) external override returns (string mediatypes) {}

}

