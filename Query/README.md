
# Query Interface

**Status**: Proposed.
**Revision**: 1.

| Name      | ID                                                                |
| :---------| :---------------------------------------------------------------- |
| Query     | b49e3d1b18b039effe4a8f2a3b52c696d10e851f438bf64d8c2924daa2886812  |


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
    limit: uint32 - maximum number of objects that can be returned in result array.

returns:

	status: uint8 - on of the `QueryStatus` variants. See `Query.sol` for details.
    objects: Objects[] - array of cells. Every cell is a root of tree of cells and contains data structure according to `CollectionType` variant: message, transaction, account.

## Declaration in Solidity

```solidity
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
```

## Declaration in C++

TODO: add later.


## Code Example

### Solidity

examples/Example.sol


### C++

TODO: Add example
