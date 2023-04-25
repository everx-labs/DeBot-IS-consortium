pragma ton-solidity >=0.57.0;

/// @notice String library for debots (in development)
library StringLib {
    function stoa(string str) public returns (optional(address)) {
        if (str.byteLength() < 66) return null;
        optional(uint32) semicolon = 1;
        if(!semicolon.hasValue()) return null;
        string wcPart = str.substr(0, semicolon.get());
        string addrPart = str.substr(semicolon.get() + 1);
        optional(int) wc = stoi(wcPart);
        if(!wc.hasValue()) return null;
        optional(int) addr = stoi(format("0x{}", addrPart));
        if(!addr.hasValue()) return null;
        return address.makeAddrStd(int8(wc.get()), uint(addr.get()));
    }
}