pragma ton-solidity >= 0.47.0;

library JsonLib {
    enum ValKind {
        String,
        Number,
        Bool,
        Array,
        Object,
        Null,
        Cell
    }

    struct Cell {
        TvmCell cell;
    }

    struct Value {
        ValKind kind;
        TvmCell value;
        mapping(uint256 => TvmCell) object;
        Cell[] array;
    }

    function is_null(Value val) internal returns (bool) {
        return val.kind == ValKind.Null;
    }

    function as_number(Value val) internal returns (optional(int)) {
        optional(int) num;
        if (val.kind == ValKind.Number) {
            num = val.value.toSlice().decode(int);
        }
        return num;
    }

    function as_string(Value val) internal returns (optional(string)) {
        optional(string) str;
        if (val.kind == ValKind.String) {
            str = val.value.toSlice().decode(string);
        }
        return str;
    }

    function as_bool(Value val) internal returns (optional(bool)) {
        optional(bool) boolean;
        if (val.kind == ValKind.Bool) {
            boolean = val.value.toSlice().decode(bool);
        }
        return boolean;
    }

    function as_cell(Value val) internal returns (optional(TvmCell)) {
        optional(TvmCell) cell;
        if (val.kind == ValKind.Cell) {
            cell = val.value;
        }
        return cell;
    }

    function as_object(Value val) internal returns (optional(mapping(uint256 => TvmCell))) {
        optional(mapping(uint256 => TvmCell)) object;
        if (val.kind == ValKind.Object) {
            object = val.object;
        }
        return object;
    }

    function as_array(Value val) internal returns (optional(Cell[])) {
        optional(Cell[]) array;
        if (val.kind == ValKind.Array) {
            array = val.array;
        }
        return array;
    }

    function get(mapping(uint256 => TvmCell) object, string key) internal returns (optional(Value)) {
        optional(TvmCell) cell = object.fetch(sha256(key));
        optional(Value) val;
        if (cell.hasValue()) {
            val = cell.get().toSlice().decode(Value);
        }
        return val;
    }

    function decodeObjectValue(TvmCell cell) internal returns (optional(Value) val, optional(string) name) {
        TvmSlice slice = cell.toSlice();
        val = slice.decode(Value);
        name = slice.decode(string);
    }

    function decodeArrayValue(TvmCell cell) internal returns (optional(Value) val) {
        TvmSlice slice = cell.toSlice();
        val = slice.decode(Value);
    }
}