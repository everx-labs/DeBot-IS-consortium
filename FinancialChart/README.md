# FinancialChart Interface

**Status**: Accepted

| Name         | ID                                                                |
| :--------    | :---------------------------------------------------------------- |
| AddressInput | 88d6254a2ab8e832e6fe9073be5fa57f3fffc07fea5fe7436a0cedc5b5fadc90  |


## Description

Allows to draw financial charts.

## Functions

Since DeBot is a smart contract then all functions work asyncronously by design. It means that they don't return anything despite the fact that all have `returns` value in their specification. Result callback will be called later and it must have arguments defined in `returns` section.

`orderBook` - allows to draw order book chart.

arguments:

	answerId: uint32 - function id of result callback

    orderBook: OrderBookRow[] - array of data to draw chart.

`linear` - allows to draw linear chart.

arguments:

	answerId: uint32 - function id of result callback

    prices: mapping(uint32=>TradeData) - mapping (time(uint32) - price and volume) of data to draw chart.

`candlestick` - allows to draw candlestick chart.

arguments:

	answerId: uint32 - function id of result callback

    candles: mapping(uint32=>TradeData) - mapping (time(uint32) - open,close,high,low,volume) of data to draw chart.

## Declaration in Solidity

```jsx
interface IFinancialChart {
    function orderBook(uint32 answerId, OrderBookRow[] orderBook) external;
    function linear(uint32 answerId, mapping(uint32=>TradeData) prices) external;
    function candlestick(uint32 answerId, mapping(uint32=>Candlestick) candles) external;
}

```

## Declaration in C++

TODO: add later

## Code Example

### Solidity

TODO: add later

### C++

TODO: add later
