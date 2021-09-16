pragma ton-solidity >=0.47.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
//import "https://raw.githubusercontent.com/tonlabs/debots/main/Debot.sol";
//import "https://raw.githubusercontent.com/tonlabs/DeBot-IS-consortium/main/Terminal/Terminal.sol";
import "Debot.sol";
import "Terminal.sol";
import "../Query.sol";
import "../../libraries/JsonLib.sol";

contract ExampleContract is Debot {

    using JsonLib for JsonLib.Value;
    using JsonLib for mapping(uint256 => JsonLib.Value);

    uint32 m_limit;

    function start() public override {
        m_limit = 50;
        Query.collection(
            tvm.functionId(setQueryResult), 
            QueryCollection.Messages, 
            format("{ src: { eq: \"{}\" } msg_type: { eq: 0 } }", address(this)),
            "created_at value dst",
            m_limit,
            QueryOrderBy("created_at", SortDirection.Ascending)
        );
    }

    function setQueryResult(QueryStatus status, JsonLib.Value[] objects) public {
        if (status != QueryStatus.Success) {
            Terminal.print(tvm.functionId(Debot.start), "Accounts query failed.");
            return;
        }

        if (objects.length != 0) {
            mapping(uint256 => JsonLib.Value) jsonObj;
            for (JsonLib.Value obj: objects) {
                jsonObj = obj.as_object().get();
                optional(JsonLib.Value) balance = jsonObj.get("value");
                optional(JsonLib.Value) dst = jsonObj.get("dst");
                Terminal.print(0, format(
                    "Sent {:t} tons to address {}", 
                    balance.get().as_number().get(), 
                    dst.get().as_string().get()
                ));
            }
            
            jsonObj = objects[objects.length - 1].as_object().get();

            optional(JsonLib.Value) createdAt = jsonObj.get("created_at");
            uint32 lastCreatedAt = uint32(createdAt.get().as_number().get());
            Query.collection(
                tvm.functionId(setQueryResult),
                QueryCollection.Messages,
                format("{ src: { eq: \"{}\" } msg_type: { eq: 0 } created_at: {gt: {} } }", address(this), lastCreatedAt),
                "created_at value dst",
                m_limit,
                QueryOrderBy("created_at", SortDirection.Ascending)
            );
        } else {
            Terminal.print(0, "Done.");
        }
    }

    function getDebotInfo() public functionID(0xDEB) override view returns(
        string name, string version, string publisher, string caption, string author,
        address support, string hello, string language, string dabi, bytes icon
    ) {
        name = "Query example DeBot";
        version = "0.1.0";
        publisher = "TON Labs";
        caption = "How to use Query interface";
        author = "TON Labs";
        support = address(0);
        hello = "Hello, i am an example DeBot.";
        language = "en";
        dabi = m_debotAbi.get();
        icon = "";
    }

    function getRequiredInterfaces() public view override returns (uint256[] interfaces) {
        return [ Terminal.ID, Query.ID ];
    }

}
