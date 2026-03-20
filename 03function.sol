// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Setget {
    uint public num;

    function setter(uint _num) public {
        num = _num;
    }   // take a number from the user → store it on the blockchain.

    function getter() public view returns(uint) {
        return num;
    }   // read the stored value from the blockchain → return it to the user.
}

/*
✅ 1. uint public num;

uint → This means unsigned integer (only positive numbers).
public → Makes the variable accessible outside the contract; Solidity automatically creates a getter function for public variables.
num → The name of the variable.
So this line creates a state variable stored on the blockchain.

✅ 2. function set(uint _num) public {

function: Tells Solidity that we are defining a function.

set: The name of the function.
     You can call it anything, but “set” is used because it sets a value.

(uint _num): This is the input parameter.
             uint = type
             _num = name of the input
             The underscore _ is used to avoid confusion with the state variable num.
             So _num is the value the user gives when calling the function.

public: Anyone can call this function.
        It is visible both inside and outside the contract.
        { … } Curly braces contain the function body.

✅ 3. num = _num;
This assigns (=) the input value _num
→ to the state variable num.

So, whatever number the user gives, it gets stored permanently on the blockchain.
This line does the real work → it sets the value.

➤ The complete setter function does:
   take a number from the user → store it on the blockchain.
*/

/*
✅ 4. function get() public view returns (uint) {
function: Starting a function.

get(): Function name with no parameters.

public: Anyone can call it.

view: This function does not change the blockchain.
      It only reads data.
      So calling it is free (no gas cost).

returns (uint): The function will return a uint value to the user.

✅ 5. return num;
Sends back the value stored in the state variable num.
Does not modify anything → just returns.

➤ The complete getter function does:
   read the stored value from the blockchain → return it to the user.
*/