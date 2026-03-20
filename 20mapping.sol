// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Mapping{

    mapping(uint=>string) public data;

 // Inserting Data: Now in case of mapping just like we insert values in an array right in the same we insert values in mapping                                 
    function insertinMap(uint roll, string memory name) public {
        data[roll]= name;               // Mappings automatically update if the key already exists. i.e new value get insert in place of old value
    }

 // Getting Data
    function getterinMap(uint roll) public view returns(string memory){
        return data[roll];             // If the key does NOT exist, mapping returns the default value
    }

}


/*
Mapping in Solidity: Mapping data type in solidity deals with keys and values means it stores data in key–value form.

Basic Syntax: mapping(keyType => valueType) public mapName;
- keyType → any basic type (uint, string, address, bool) // this keyType is datatype of your key
- valueType → any type (uint, struct, array, bool)       // And this valueType is datatype of your value

Example: - Let's say i want to store the name of students and for every name that I'm going to store I'm going 
           to map it with there roll number. So in this case, this is how i will declare my mapping
         - So First of all we will be have data type of the roll number which will be uint right 
           then we will have string data type for name of student. 
         - So this mapping is from uint to string and this is public so definitely it is optional 
           and then we will have this variable as a mapname
   
mapping(uint => string) public rollToName;
This means: - Key: uint (roll number)
            - Value: string (name of student)

*/
 
/*
Question: Are arrays and mapping the same thing, so answer to this question is NO. 
Syntax wise for insert and get data it might look same but mappings are very very very much dfferent from arrays.
And Mapping are always better than Array
*/

/*
REMB in Advance:
❌ Mapping cannot be returned i.e return data;
✔  Only access using key      i.e return data[roll];  
*/