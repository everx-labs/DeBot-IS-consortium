pragma ton-solidity >=0.47.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "https://raw.githubusercontent.com/tonlabs/debots/main/Debot.sol";
import "../AddressInput.sol";

contract ExampleContract is Debot {

    function start() public override {
        AddressInput.get(tvm.functionId(setAddress), "Enter wallet address:");
    }

    function setAddress(address value) public pure {
        // TODO: continue here
    }

    function getDebotInfo() public functionID(0xDEB) override view returns(
        string name, string version, string publisher, string caption, string author,
        address support, string hello, string language, string dabi, bytes icon
    ) {
        name = "AddressInput example DeBot";
        version = "0.2.0";
        publisher = "TON Labs";
        caption = "How to use the AddressInput interface";
        author = "TON Labs";
        support = address(0);
        hello = "Hello, i am an example DeBot.";
        language = "en";
        dabi = m_debotAbi.get();
        icon = "";
    }

    function getRequiredInterfaces() public view override returns (uint256[] interfaces) {
        return [ AddressInput.ID ];
    }

}
