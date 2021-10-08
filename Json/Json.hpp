#pragma once
namespace tvm { namespace schema {

__interface IJson {

    [[internal, answer_id]]
    bool_t deserialize(string json);
    [[internal, answer_id]]
    (bool_t, JsonLib::Value) parse(string json);
    
};

}}
