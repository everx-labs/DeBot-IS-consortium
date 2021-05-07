pragma ton-solidity >=0.40.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "SigningBoxInput.sol";
import "Terminal.sol";

contract ExampleContract {

    function start() public {
		SigningBoxInput.get(tvm.functionId(setSigningBoxHandle), "Enter my signing keys:", [tvm.pubkey()]);
	}

	function setSigningBoxHandle(uint32 handle) public {
        Terminal.print(0, format("Signing Box Handle: {}", handle));
	}

}