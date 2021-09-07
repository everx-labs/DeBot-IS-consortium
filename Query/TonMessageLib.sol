pragma ton-solidity >= 0.47.0;

library TonMessageLib {
    
	function src(TvmCell message) public returns (address) {
        TvmSlice slice = message.toSlice();
        // TODO: decode source address.
        return slice.decode(address);
    }

    function dst(TvmCell message) public returns (address) {
        TvmSlice slice = message.toSlice();
        // TODO: decode dest address.
        return slice.decode(address);
    }

    function balance(TvmCell message) public returns (uint64) {
        TvmSlice slice = message.toSlice();
        // TODO: decode balance.
        return slice.decode(uint64);
    }

    function body(TvmCell message) public returns (TvmCell) {
        TvmSlice slice = message.toSlice();
        // TODO: decode message body.
        return slice.decode(TvmCell);
    }
}