pragma ton-solidity >= 0.47.0;

enum Collection {
    Accounts,
    Messages,
    Transactions
}

struct Object {
    TvmCell root;
}

enum QueryStatus {
    Success,
    InvalidFilter,
    InvalidLimit,
    InvalidSorting,
    NetworkError,
    UnknownError
}

interface IQuery {

    function collection(
        uint32 answerId,
        Collection collectionType,
        string queryFilter,
        uint32 limit
    ) external returns (QueryStatus status, Object[] objects);

}

library Query {

	uint256 constant ID = 0xb49e3d1b18b039effe4a8f2a3b52c696d10e851f438bf64d8c2924daa2886812;
	int8 constant DEBOT_WC = -31;

	function collection(
        uint32 answerId,
        Collection collectionType,
        string queryFilter,
        uint32 limit
    ) public {
        address addr = address.makeAddrStd(DEBOT_WC, ID);
        IQuery(addr).collection(answerId, collectionType, queryFilter, limit);
    }
}

contract QueryABI is IQuery {
    function collection(
        uint32 answerId,
        Collection collectionType,
        string queryFilter,
        uint32 limit
    ) external override returns (QueryStatus status, Object[] objects) {}
}