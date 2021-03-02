## Description

Document describes the functions that every Debot should have.

## Functions

`getInfo` - return information about debot

returns:

    name: bytes - utf-8 string with name of debot, e.g. "DePool"

    version: bytes - SemVer version of debot, e.g. "0.0.1"

    publisher: bytes - utf-8 string with info about who has deployed debot to blokchain, e.g. "TON Labs"

    key: bytes - (10-20 ch.) utf-8 string with short description, e.g. "Work with DePools"

    author: bytes - utf-8 string with name of author of DeBot, e.g. "Ivan Ivanov".

    support: address - Free TON address of author for questions and donations

    hello: bytes - utf-8 string with first messsage with DeBot description, e.g. "Hello, I'm a FreeTON Debot Kapellmeister. I know everything about DePools. Let's start." 

    language: bytes - (ISO-639) utf-8 string with debot interface language, e.g. "en"
---

`getRequiredInterfaces` - returns array of interfaces used by debot. Debot Browser should check if it supports all interfaces from this array. If anyone is not supported debot should not be started. 

returns:

    interfaces: uint256[] - array of interface ids

## Declaration in Solidity

    // Base contract for all debots
    abstract contract Debot {
    
        function getRequiredInterfaces() virtual returns (uint256[] interfaces); 
    function getInfo() virtual returns (string name, string version, string publisher, string key, string author, address support, string hello, string language);
    }
    
    contract DebotA is Debot {
    
        function getRequiredInterfaces() override returns (uint256[] interfaces) {
        return [ID_TERMINAL, ID_MENU, ...];
        }
    function getInfo() override returns (string name, string version, string publisher, string key, string author, address support, string hello, string language) {
        name = "Depool Debot";
        version = "0.1.0";
        publisher = "TON Labs";
        key = "Works with DePools";
        author = "Ivan Ivanov";
        support = address.makeAddrStd(0, 0x841288ed3b55d9cdafa806807f02a0ae0c169aa5edfe88a789a6482429756a94);
        hello = "Hello, I'm a FreeTON Debot Kapellmeister. I know everything about DePools. Let's start.";
        language = "en";
    }
    }

## Declaration in C++

TODO: Add declaration
