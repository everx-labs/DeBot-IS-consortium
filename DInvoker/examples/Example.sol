pragma solidity >= 0.6.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import {DInvoker} from "DInvoker.sol";

interface IResult {
    function result(int sum) external;
}

contract CalculatorDebot {
    function sum(int a, int b) public {
        int c = a + b;
        TvmCell response = tvm.encodeBody(IResult.result, c);
        DInvoker.complete(msg.sender, response);
    }
}

contract ExampleContract is IResult {

    function testInvoke(address debot) public {
        TvmCell request = tvm.encodeBody(CalculatorDebot.sum, 1, 2);
		DInvoker.invoke(debot, request);
	}

    function result(int sum) external override {
        require(sum == 3);
    }

} 