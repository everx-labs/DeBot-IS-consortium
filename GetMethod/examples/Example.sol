pragma solidity >= 0.6.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import {GetMethod} from "GetMethod.sol";

contract Wallet {
    mapping(int8 => address) m_owners;

    function getOwnerById(int8 id) public view returns (address owner) {
        owner = m_owners[id];
    }
}

contract ExampleContract {
    address m_target;

    function testGet() public {
        int8 id = 1;
        TvmCell message = tvm.createExtMsg({dest: m_target, expire: 60, cell: { Wallet.getOwnerById, id });
		GetMethod.run(tvm.functionId(setResult), message);
	}

    function setResult(address owner) public pure {
    }

}  