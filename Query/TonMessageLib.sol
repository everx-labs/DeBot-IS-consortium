pragma ton-solidity >= 0.47.0;

library TonMessageLib {
    
	function src(TvmCell message) public returns (address) {
        TvmSlice slice = message.toSlice();
        return slice.decode(address);
    }

    function dst(TvmCell message) public returns (address) {
        TvmSlice slice = message.toSlice();
        return slice.decode(address);
    }

    function balance(TvmCell message) public returns (uint64) {
        TvmSlice slice = message.toSlice();
        return slice.decode(uint64);
    }

    function body(TvmCell message) public returns (TvmCell) {
        TvmSlice slice = message.toSlice();
        return slice.decode(TvmCell);
    }
}