pragma ton-solidity >=0.40.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "../SigningBoxInput.sol";
import "../../Terminal/Terminal.sol";
import "../Debot.sol";

contract ExampleContract is Debot {

    function start() public override {
		SigningBoxInput.get(tvm.functionId(setSigningBoxHandle), "Enter my signing keys:", [tvm.pubkey()]);
	}

	function setSigningBoxHandle(uint32 handle) public {
        Terminal.print(0, format("Signing Box Handle: {}", handle));
	}

    /// @notice Returns Metadata about DeBot.
    function getDebotInfo() public functionID(0xDEB) override view returns(
        string name, string version, string publisher, string caption, string author,
        address support, string hello, string language, string dabi, bytes icon
    ) {
        name = "SigningBoxInput";
        version = "0.1.0";
        publisher = "TON Labs";
        caption = "Example of SigningBoxInput.";
        author = "TON Labs";
        support = address(0);
        hello = "Example DeBot.";
        language = "en";
        dabi = m_debotAbi.get();
        icon = "";
    }

    function getRequiredInterfaces() public view override returns (uint256[] interfaces) {
        return [ Terminal.ID, SigningBoxInput.ID ];
    }

}