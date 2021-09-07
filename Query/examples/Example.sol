pragma ton-solidity >=0.47.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "https://raw.githubusercontent.com/tonlabs/debots/main/Debot.sol";
import "https://raw.githubusercontent.com/tonlabs/DeBot-IS-consortium/main/Terminal/Terminal.sol";
import "../Query.sol";
import {TonMessageLib} from "../TonMessageLib.sol";

contract ExampleContract is Debot {

    using TonMessageLib for TvmCell;
    
    uint32 m_limit;

    function start() public override {
        m_limit = 50;
        Query.collection(
            tvm.functionId(setQueryResult), 
            Collection.Messages, 
            format("{ src: { eq: \"{}\" } msg_type: { eq: 0 } }", address(this)), 
            m_limit,
            0
        );
    }

    function setQueryResult(QueryStatus status, Object[] objects, uint256 nextId) public {
        if (status != QueryStatus.Success) {
            Terminal.print(tvm.functionId(Debot.start), "Accounts query failed.");
            return;
        }

        if (objects.length != 0) {
            for (Object obj: objects) {
                TvmCell message = obj.root;
                Terminal.print(0, format("Sent {:t} tons to address {}", message.balance(), message.dst()));
            }

            Query.collection(
                tvm.functionId(setQueryResult),
                Collection.Messages,
                format("{ src: { eq: \"{}\" } msg_type: { eq: 0 } }", address(this)),
                m_limit,
                nextId
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
