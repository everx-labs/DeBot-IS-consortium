pragma solidity >= 0.6.0;

interface IDInvoker {

    function invoke(address callee, TvmCell request) external;
	function complete(address caller, TvmCell response) external;

}

library DInvoker {

	uint256 constant ID_INVOKER = 0xf19b3d918094a2361db2090508ce6237b5f8588bd5fcabee1a11c173ada20fb3;
	int8 constant DEBOT_WC = -31;

	function invoke(address callee, TvmCell request) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ID_INVOKER);
		IDInvoker(addr).invoke(callee, request);
	}

	function complete(address caller, TvmCell response) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ID_INVOKER);
		IDInvoker(addr).complete(caller, response);
	}
} 