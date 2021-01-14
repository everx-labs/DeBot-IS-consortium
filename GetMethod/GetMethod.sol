pragma solidity >= 0.6.0;

interface IGetMethod {

    function run(uint32 answerId, TvmCell message) external;

}

library GetMethod {

	uint256 constant ID = 0x3d0323283da25520cc32eb881b41e556055bf666351f09b4729f38838e0f7049;
	int8 constant DEBOT_WC = -31;

	function run(uint32 answerId, TvmCell message) public pure {
		address addr = address.makeAddrStd(DEBOT_WC, ID);
		IGetMethod(addr).run(answerId, message);
	}

} 