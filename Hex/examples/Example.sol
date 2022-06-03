pragma ton-solidity >= 0.47.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;

import "https://raw.githubusercontent.com/tonlabs/debots/main/Debot.sol";
import "https://raw.githubusercontent.com/tonlabs/DeBot-IS-consortium/main/Hex/Hex.sol";

contract Example is Debot {

    function start() public override {
        Hex.encode(tvm.functionId(setEncoded), bytes("abc"));
    }

    function setEncoded(string hexstr) public pure {
        require(hexstr == "616263", 101);
        Hex.decode(tvm.functionId(setDecoded), hexstr);
    }

    function setDecoded(bytes data) public pure {
        require(string(data) == "abc", 102);
        // TODO: continue here
    }

    function getDebotInfo() public functionID(0xDEB) override view returns(
        string name, string version, string publisher, string caption, string author,
        address support, string hello, string language, string dabi, bytes icon
    ) {
        name = "Hex example DeBot";
        version = "1.0.0-rc.1";
        publisher = "DeBot Consortium";
        caption = "How to use the Hex interface";
        author = "DeBot Consortium";
        support = address(0);
        hello = "Hello, i am an example Hex DeBot.";
        language = "en";
        dabi = m_debotAbi.get();
        icon = "";
    }

    function getRequiredInterfaces() public view override returns (uint256[] interfaces) {
        return [
            Hex.ID
        ];
    }
}
