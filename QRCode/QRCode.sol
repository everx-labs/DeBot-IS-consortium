pragma ton-solidity >=0.35.0;

enum QRStatus {
    Success,
    DataTooLong,
    InvalidCharacter
}

interface IQRCode {
	function scan(uint32 answerId) external returns (string value);
    function draw(uint32 answerId, string text) external returns (QRStatus result);
}

library QRCode {
    int8 constant DEBOT_WC = -31;
    uint256 constant ID = 0x940c152ddf4f920f742507f461026dc08ac56ed3392944d6d3863a409570056b;

    function scan(uint32 answerId) public pure {
        address addr = address.makeAddrStd(DEBOT_WC, ID);
        IQRCode(addr).scan(answerId);
    }

    function draw(uint32 answerId, string text) public pure {
        address addr = address.makeAddrStd(DEBOT_WC, ID);
        IQRCode(addr).draw(answerId, text);
    }
}

contract QRCodeABI is IQRCode {
    function scan(uint32 answerId) external override returns (string value) {}
    function draw(uint32 answerId, string text) external override returns (QRStatus result) {}
}