pragma ton-solidity >= 0.47.0;

library TonMessageLib {
    enum MsgKind {
        Int,
        ExtIn,
        ExtOut,
        Invalid
    }
    
	function src(TvmCell message) internal returns (address) {
        TvmSlice slice = message.toSlice();
        (, slice) = _readUntilSrc(slice);
        return slice.decode(address);
    }

    function dst(TvmCell message) internal returns (address) {
        TvmSlice slice = message.toSlice();
        (, slice) = _readUntilSrc(slice);
        // decode src
        slice.decode(address);
        return slice.decode(address);
    }

    function balance(TvmCell message) internal returns (uint128) {
        TvmSlice slice = message.toSlice();
        (, slice) = _readUntilSrc(slice);
        // decode src, dst
        slice.decode(address, address);
        return slice.loadTons();
    }

    function body(TvmCell message) internal returns (TvmSlice) {
        TvmSlice slice = message.toSlice();
        MsgKind kind;
        (kind, slice) = _readUntilSrc(slice);
        slice.decode(address, address);
        if (kind == MsgKind.Int) {
            slice.loadTons(); // value:CurrencyCollection
            slice.loadUnsigned(1);
            slice.loadTons(); // ihr_fee
            slice.loadTons(); // fwd_fee
            // created_lt, created_at
            slice.decode(uint64, uint32);
        } else {
            revert(1000);
        }
        uint maybitInit = slice.loadUnsigned(1);
        if (maybitInit == 1) {
            uint eitherbitInit = slice.loadUnsigned(1);
            if (eitherbitInit == 0) {
                revert(1001);
            } else {
                slice.loadRef();
            }
        }
        uint eitherbitBody = slice.loadUnsigned(1);
        TvmSlice sbody;
        if (eitherbitBody == 0) {
            sbody = slice;
        } else {
            sbody = slice.loadRefAsSlice();
        }
        return sbody;
    }

    //
    // Privates
    //

    function _readKind(TvmSlice slice) private returns (MsgKind, TvmSlice) {
        uint bit1 = slice.loadUnsigned(1);
        MsgKind kind = MsgKind.Invalid;
        if (bit1 == 0) {
            // internal message
            kind = MsgKind.Int;
        } else {
            int bit2 = slice.loadUnsigned(1);
            if (bit2 == 1) {
                kind = MsgKind.ExtOut;
            } else {
                kind = MsgKind.ExtIn;
            }
        }
        return (kind, slice);
    }

    function _readUntilSrc(TvmSlice slice) private returns (MsgKind, TvmSlice) {
        (MsgKind kind, TvmSlice slice) = _readKind(slice);
        if (kind == MsgKind.Int) {
            // ihrDisabled, bounce, bounced
            slice.decode(bool, bool, bool);
            //(bool ihrDisabled, bool bounce, bool bounced) = slice.decode(bool, bool, bool);
        }
        return (kind, slice);
    }
}