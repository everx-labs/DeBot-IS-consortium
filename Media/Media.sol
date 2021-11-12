pragma ton-solidity >= 0.40.0;

enum MediaStatus {
    Success,
    UnsupportedMediaType,
    InvalidDataScheme
}

interface IMedia {
    function output(uint32 answerId, string prompt, string data) external returns (MediaStatus result);
    function getSupportedMediaTypes(uint32 answerId) external returns (string mediaTypes);
}

library Media {

    int8 constant DEBOT_WC = -31;
    uint256 constant ID = 0x59cdc2aafe53760937dac5b1c4b89ce12950f56a56298108a987cfe49b7c84b5;

    function output(uint32 answerId, string prompt, string data) public {
        address addr = address.makeAddrStd(DEBOT_WC, ID);
        IMedia(addr).output(answerId, prompt, data);
    }

    function getSupportedMediaTypes(uint32 answerId) public {
        address addr = address.makeAddrStd(DEBOT_WC, ID);
        IMedia(addr).getSupportedMediaTypes(answerId);
    }

}

contract MediaABI is IMedia {

    function output(uint32 answerId, string prompt, string data) external override returns (MediaStatus result) {}
    function getSupportedMediaTypes(uint32 answerId) external override returns (string mediaTypes) {}

}

