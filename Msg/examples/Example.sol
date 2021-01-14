pragma solidity >= 0.6.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import {Msg, SendStatus} from "Msg.sol";

interface IWallet {
    function transfer(uint128 amount) external;
}

contract ExampleContract {

    function testSend(address dest) public {
        TvmCell message = tvm.createExtMsg({dest: dest, expire: 60, cell: { IWallet.transfer, 1 ton });
		Msg.send(tvm.functionId(sendResult), message, true);
	}

    function sendResult(SendStatus status) public pure {
        require(status.succeeded);
        require(status.code == 0);
    }

} 