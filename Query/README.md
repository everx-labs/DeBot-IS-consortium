
# Query Interface

**Status**: Proposed.
**Revision**: 2.

| Name      | ID                                                                |
| :---------| :---------------------------------------------------------------- |
| Query     | 5c6fd81616cdfb963632109c42144a3a885c8d0f2e8deb5d8e15872fb92f2811  |


## Description

Interface for querying accounts, transactions, messages from blockchain.


## Functions

`collection` - makes a query to blockchain with a certain filter.

arguments:

    answerId: uint32 - id of function callback.
    collectionType: uint8 - one of the `CollectionType` variants: 
        Accounts (0), Messages (1), Transactions(2). 
        See Query.sol for details.
    queryFilter: bytes - utf-8 string with object query.
    returnFilter: bytes - utf-8 string with object query.
    limit: uint32 - maximum number of objects that can be returned in result array.
    orderBy: QueryOrderBy - structure that defines sorting rules for returning objects.

returns:

	status: uint8 - one of the `QueryStatus` variants. See `Query.sol` for details.
    objects: JsonLib.Value[] - array of json values. Every json value represents fields requested in `returnFilter` for certain `CollectionType` variant: message, transaction, account.

## Declaration in Solidity

```solidity
enum QueryCollection {
    Accounts,
    Messages,
    Transactions
}

enum SortDirection {
    Ascending,
    Descending
}

struct QueryOrderBy {
    string path;
    SortDirection direction;
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
        QueryCollection collectionType,
        string queryFilter,
        string returnFilter,
        uint32 limit,
        QueryOrderBy orderBy
    ) external returns (QueryStatus status, JsonLib.Value[] objects);

}
```

## Declaration in C++

TODO: add later.


## Code Example

### Solidity

examples/Example.sol


### C++

TODO: Add example
