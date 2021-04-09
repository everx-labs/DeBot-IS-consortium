pragma ton-solidity >=0.35.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "../../Debot.sol";
import "../ConfirmInput.sol";

contract ExampleContract is Debot {

    event Confirm(bool value);

    function start() public override {
        ConfirmInput.get(tvm.functionId(setConfirm), "Say yes or no:");
    }

    function setConfirm(bool value) public pure {
        // TODO: continue here
        emit Confirm(value);
    }

    function getVersion() public override returns (string name, uint24 semver) {
        (name, semver) = ("AddressInput Example DeBot", _version(1, 0, 0));
    }

    function _version(uint24 major, uint24 minor, uint24 fix) private pure inline returns (uint24) {
        return (major << 16) | (minor << 8) | (fix);
    }

}

