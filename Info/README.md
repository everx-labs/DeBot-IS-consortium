## Description

It's basic functions in debots for getting of info about debot and work with this

## Functions

`getInfo` - return information about debot

returns:

    name: bytes - name of debot, e.g. "DePool"

    version: bytes - version of debot, e.g. "0.0.1"

    publisher: bytes - whos deployed debot to blochain, e.g. "TON Labs"

    key: bytes - (10-20 ch.) short description, e.g. "Work with DePools"

    author: bytes - author of DeBot, e.g. "Nikita Monakhov"

    support: bytes - Surf address

    hello: bytes - first messsage with DeBot description, e.g. "Hello, I'm a FreeTON Debot Kapellmeister. I know everything about DePools. Let's start." 

---

`getRequiredInterfaces` - returns array of required interfaces.

returns:

    interfaces: uint256[] 

## Declaration in Solidity

    // Base contract for all debots
    abstract contract Debot {
    
        i32 constant DEBOT_WC = -31;
    
        function getRequiredInterfaces() virtual returns (uint256[] interfaces); 
    
    }
    
    contract DebotA is Debot {
    
        function getRequiredInterfaces() override returns (uint256[] interfaces) {
        return [ID_TERMINAL, ID_MENU, ...];
        }
    
    }

## Declaration in C++

TODO: Add declaration

## Code Example

### Solidity

TODO: Add example

### C++

TODO: Add example
