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
        uint32 limit,
        uint256 paginationId
    ) external returns (QueryStatus status, Object[] objects, uint256 nextId);

}

library Query {

	uint256 constant ID = 0x5c6fd81616cdfb963632109c42144a3a885c8d0f2e8deb5d8e15872fb92f2811;
	int8 constant DEBOT_WC = -31;

	function collection(
        uint32 answerId,
        Collection collectionType,
        string queryFilter,
        uint32 limit,
        uint256 paginationId
    ) public {
        address addr = address.makeAddrStd(DEBOT_WC, ID);
        IQuery(addr).collection(answerId, collectionType, queryFilter, limit, paginationId);
    }
}

contract QueryABI is IQuery {
    function collection(
        uint32 answerId,
        Collection collectionType,
        string queryFilter,
        uint32 limit,
        uint256 paginationId
    ) external override returns (QueryStatus status, Object[] objects, uint256 nextId) {}
}