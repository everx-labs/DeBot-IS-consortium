pragma solidity >= 0.6.0;
interface ICrypto {
    //seed phrase
    function mnemonicFromRandom(uint32 answerId, uint32 dict, uint32 wordCount)  external returns (uint32 phraseHandle);
    function mnemonicSelect(uint32 answerId, string prompt)  external returns (uint32 phraseHandle);
    function mnemonicFromDeBot(uint32 answerId, string phrase) external returns (uint32 phraseHandle);
    function mnemonicPrint(uint32 answerId, string text, uint32 phraseHandle)  external returns (bool result);
    function mnemonicDeriveSignKeys(uint32 answerId, uint32 phraseHandle, uint32 index, bool hardened) external returns (uint32 edHandle, uint256 pubkey);
    function mnemonicRemove(uint32 answerId, uint32 phraseHandle) external returns (bool result);
    //ed25519
    function edFromRandom() external returns (uint32 edHandle, uint256 pubkey);
    function edSelect(uint32 answerId, string prompt)  external returns (uint32 edHandle, uint256 pubkey);
    function edFromDeBot(uint32 answerId, uint256 pub, uint256 sec) external returns (uint32 edHandle);
    function edGetPubKey(uint32 answerId, uint32 edHandle)  external returns (uint256 pubkey);
    function edPrint(uint32 answerId, string text, uint32 edHandle)  external returns (bool result);
    function edRemove(uint32 answerId, uint32 edHandle) external returns (bool result);
    //curve25519
    function curveFromRandom(uint32 answerId) external returns (uint32 curveHandle, uint256 pubkey);
    function curveSelect(uint32 answerId, string prompt)  external returns (uint32 curveHandle, uint256 pubkey);
    function curveFromDeBot(uint32 answerId, uint256 pub, uint256 sec) external returns (uint32 curveHandle);
    function curveFromEd(uint32 answerId, uint32 edHandle)  external returns (uint32 curveHandle, uint256 pubkey);
    function curveGetPubKey(uint32 answerId, uint32 curveHandle)  external returns (uint256 pubkey);
    function curvePrint(uint32 answerId, string text, uint32 curveHandle)  external returns (bool result);
    function curveRemove(uint32 answerId, uint32 curveHandle ) external returns (bool result);
    //encryption key
    function encFromRandom(uint32 answerId, uint32 len) external returns (uint32 encHandle);
    function encSelect(uint32 answerId, string prompt)  external returns (uint32 encHandle);
    function encFromDeBot(uint32 answerId, bytes key) external returns (uint32 encHandle);
    function encFromEdSec(uint32 answerId, uint32 edHandle)  external returns (uint32 encHandle);
    function encPrint(uint32 answerId, string text, uint32 encHandle) external returns (bool result);
    function encRemove(uint32 answerId, uint32 encHandle ) external returns (bool result);
    //crypto
    function naclBox(uint32 answerId, bytes decrypted, bytes nonce, uint256 theirPublic, uint32 curveHandle) external returns (bytes encrypted);
    function naclBoxOpen(uint32 answerId, bytes encrypted, bytes nonce, uint256 theirPublic, uint32 curveHandle) external returns (bytes decrypted);
    function chacha20(uint32 answerId, bytes data, bytes nonce, uint32 encHandle) external returns (bytes output);
    //message
    function sendMsg(uint32 answerId, TvmCell message, uint32 edHandle) external returns (bool result);
}

