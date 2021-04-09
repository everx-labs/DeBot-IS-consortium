pragma ton-solidity >=0.35.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "../../Debot.sol";
import "../NumberInput.sol";

contract ExampleContract is Debot {

	event Number(int256 value);

    function start() public override {
		NumberInput.get(tvm.functionId(setNumber), "Enter number:", -10, 100);
	}

	function setNumber(int256 value) public pure {
        // TODO: continue here
		emit Number(value);
	}

	function getVersion() public override returns (string name, uint24 semver) {
        (name, semver) = ("AddressInput Example DeBot", _version(1, 0, 0));
    }

    function _version(uint24 major, uint24 minor, uint24 fix) private pure inline returns (uint24) {
        return (major << 16) | (minor << 8) | (fix);
    }

}