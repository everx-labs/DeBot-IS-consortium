pragma ton-solidity >=0.35.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "../../Debot.sol";
import "../AmountInput.sol";

contract ExampleContract is Debot {

    event Amount(uint128 amount);

    function start() public override {
        AmountInput.get(tvm.functionId(setAmount), "Enter amount of tons:",  9, 1e9, 100e9);
    }

    function setAmount(uint128 value) public pure {
        // TODO: continue here
        emit Amount(value);
    }

    function getVersion() public override returns (string name, uint24 semver) {
        (name, semver) = ("AddressInput Example DeBot", _version(1, 0, 0));
    }

    function _version(uint24 major, uint24 minor, uint24 fix) private pure inline returns (uint24) {
        return (major << 16) | (minor << 8) | (fix);
    }

}

