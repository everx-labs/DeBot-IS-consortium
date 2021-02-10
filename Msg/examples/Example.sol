pragma solidity >= 0.6.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import {Msg} from "Msg.sol";

interface IWallet {
    function transfer(uint128 amount) external;
}

contract ExampleContract {

    function testSend(address dest) public {
        (uint256 pubKey, uint256 secKey) = (
            0x3fd8eb7489ed829c802e6dadea1dd054a37df1535f5e669800bfe296ec572aea,
            0xbdc01f4f79238d6e41be79cccaf785e3cd4c51de91646f690e37185ef8542d44,
        );
        TvmCell message = tvm.createExtMsg({
            extern: true,
            sign: true,
            dest: dest,
            callbackId: tvm.functionId(onSuccess),
            onErrorId: 0,
            timestamp: uint32(now),
            expire: 0,
            call: { IWallet.transfer, 1 ton }
        });
        Msg.sendWithKeypair(tvm.functionId(onSuccess), message, pubKey, secKey);
	}

    function onSuccess() public pure {

    }

}