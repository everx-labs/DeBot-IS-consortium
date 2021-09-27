pragma ton-solidity >=0.47.0;

struct OrderBookRow {
    string price;
    string buyVolume;
    string sellVolume;
}

struct TradeData {
    string price;
    string volume;
}

struct Candlestick {
    string open;
    string close;
    string high;
    string low;
    string volume;
}

interface IFinancialChart {

    function orderBook(uint32 answerId, OrderBookRow[] orderBook) external;
    function linear(uint32 answerId, mapping(uint32=>TradeData) prices) external;
    function candlestick(uint32 answerId, mapping(uint32=>Candlestick) candles) external;

}

library FinancialChart {

    int8 constant DEBOT_WC = -31;
    uint256 constant ID = 0x88d6254a2ab8e832e6fe9073be5fa57f3fffc07fea5fe7436a0cedc5b5fadc90;

    function orderBook(uint32 answerId, OrderBookRow[] orderBook) public pure {
        address addr = address.makeAddrStd(DEBOT_WC, ID);
        IFinancialChart(addr).orderBook(answerId, orderBook);
    }
    function linear(uint32 answerId, mapping(uint32=>TradeData) prices) public pure {
        address addr = address.makeAddrStd(DEBOT_WC, ID);
        IFinancialChart(addr).orderBook(answerId, prices);
    }
    function candlestick(uint32 answerId, mapping(uint32=>Candlestick) candles) public pure {
        address addr = address.makeAddrStd(DEBOT_WC, ID);
        IFinancialChart(addr).orderBook(answerId, candles);
    }

}

contract FinancialChartABI is IFinancialChart {

    function orderBook(uint32 answerId, OrderBookRow[] orderBook) external override {}
    function linear(uint32 answerId, mapping(uint32=>TradeData) prices) external override {}
    function candlestick(uint32 answerId, mapping(uint32=>Candlestick) candles) external override {}

}

