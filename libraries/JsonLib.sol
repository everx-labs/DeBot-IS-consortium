pragma ton-solidity >= 0.47.0;

library JsonLib {
    enum ValKind {
        String,
        Number,
        Bool,
        Array,
        Object,
        Null
    }

    struct Cell {
        TvmCell cell;
    }

    struct Value {
        ValKind kind;
        bytes value;
        mapping(uint256 => TvmCell) object;
        Cell[] array;
    }

    function is_null(Value val) internal pure returns (bool) {
        return val.kind == ValKind.Null;
    }

    function as_number(Value val) internal pure returns (optional(int)) {
        optional(int) num;
        if (val.kind == ValKind.Number) {
            num = val.value.toSlice().decode(int);
        } 
        return num;
    }

    function as_string(Value val) internal pure returns (optional(string)) {
        optional(string) str;
        if (val.kind == ValKind.String) {
            str = val.value.toSlice().decode(string);
        } 
        return str;
    }

    function as_bool(Value val) internal pure returns (optional(bool)) {
        optional(bool) boolean;
        if (val.kind == ValKind.Bool) {
            boolean = val.value.toSlice().decode(bool);
        }
        return boolean;
    }

    function as_object(Value val) internal pure returns (optional(mapping(uint256 => Value))) {
        optional(mapping(uint256 => Value)) object;
        if (val.kind == ValKind.Object) {
            object = val.value.toSlice().decode(mapping(uint256 => Value));
        } 
        return object;
    }

    function get(mapping(uint256 => Value) object, string key) internal pure returns (optional(Value)) {
        return object.fetch(sha256(key));
    }
}