pragma ton-solidity >=0.35.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;

import "https://raw.githubusercontent.com/tonlabs/debots/main/Debot.sol";
import "../Menu.sol";

contract ExampleContract is Debot {

    function start() public override {
        _menu();
    }

    function _menu() private inline {
        Menu.select("Main menu", "description for menu", [
            MenuItem("menu 1", "", tvm.functionId(handleMenu1)),
            MenuItem("menu 2", "desc for menu 2", tvm.functionId(handleMenu2))
        ]);
    }

    function handleMenu1(uint32 index) public {
        // TODO: continue here
    }

    function handleMenu2(uint32 index) public {
        // TODO: continue here
    }

    function getDebotInfo() public functionID(0xDEB) override view returns(
        string name, string version, string publisher, string key, string author,
        address support, string hello, string language, string dabi, bytes icon
    ) {
        name = "Menu example DeBot";
        version = "0.2.0";
        publisher = "TON Labs";
        key = "How to use the Menu interface";
        author = "TON Labs";
        support = address(0);
        hello = "Hello, i am an example DeBot.";
        language = "en";
        dabi = m_debotAbi.get();
        icon = "";
    }

    function getRequiredInterfaces() public view override returns (uint256[] interfaces) {
        return [ Menu.ID ];
    }

}
