pragma ton-solidity >=0.35.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "../../Debot.sol";
import "../Terminal.sol";

contract ExampleContract is Debot {

    function start() public override {
		Terminal.print(tvm.functionId(formatPrint), "I am Debot");
		Terminal.input(tvm.functionId(setText), "Enter your name:", false);
	}

	function setText(string value) public {
        // continue here
		string result = format("Hello {}", value);
		Terminal.print(0, result);
	}

    function formatPrint() public {
        TvmBuilder b;
		b.store(int8(1), uint32(10));
		Terminal.printf(0, "Enter number beetween {int8} and {uint32}", b.toCell());
    }

	function getVersion() public override returns (string name, uint24 semver) {
        (name, semver) = ("Terminal Example DeBot", _version(1, 0, 0));
    }

    function _version(uint24 major, uint24 minor, uint24 fix) private pure inline returns (uint24) {
        return (major << 16) | (minor << 8) | (fix);
    }

}
