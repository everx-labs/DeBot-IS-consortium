pragma ton-solidity >=0.35.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "../../Debot.sol";
import "../Menu.sol";

contract ExampleContract is Debot {

    event Selected(uint32 index, string subMenu);

    function start() public override {
        _menu();
    }

    function _menu() private inline {
        Menu.select("Main menu", "description for menu", [
            MenuItem("menu 1", "", tvm.functionId(handleMenu1)),
            MenuItem("menu 2", "desc for menu 2", tvm.functionId(handleMenu2))
        ]);
    }
    /*
    * Public
    */

    function quit() public {}

    function handleMenu1(uint32 index) public {
        emit Selected(index, 'menu 1');
        _menu();
    }

    function handleMenu2(uint32 index) public {
        emit Selected(index, 'menu 2');
        _menu();
    }

    function getVersion() public override returns (string name, uint24 semver) {
        (name, semver) = ("Menu Example DeBot", _version(1, 0, 0));
    }

    function _version(uint24 major, uint24 minor, uint24 fix) private pure inline returns (uint24) {
        return (major << 16) | (minor << 8) | (fix);
    }

}

