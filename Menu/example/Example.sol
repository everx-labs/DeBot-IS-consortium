pragma ton-solidity >=0.35.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "Debot.sol";
import "Menu.sol";

contract TestMenu is Debot {

    function start() public override {
        Menu.select("Main menu", "description for menu", [
            MenuItem("menu 1", "", tvm.functionId(handleMenu1)),
            MenuItem("menu 2", "desc for menu 2", tvm.functionId(handleMenu2))
        ]);
    }

    function quit() public override {}

    function getVersion() public override returns (string name, uint24 semver) {
        (name, semver) = ("TestMenu", 2 << 8);
    }

    /*
    * Public
    */

    function handleMenu1(uint32 index) public {
	}

    function handleMenu2(uint32 index) public {
	}
    
}