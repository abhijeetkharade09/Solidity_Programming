// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Struct{        // Defining a Struct

    struct Student{
        string name;
        uint roll;
        bool pass;
    }
    
    Student public s1;  // Creating a Struct Variable
                        /* Remb: - Here, Student is the datatype.
                                 - struct is the keyword used to create that datatype. */

// Inserting Data into Struct: There are two methods to assign values to a struct.
// ✅ Method 1: Assign values one by one
    function insertOnebyOne(string memory _name, uint _roll, bool _pass) public {
        s1.name=_name;
        s1.roll=_roll;
        s1.pass=_pass;
    }
// ✅ Method 2: Sets all fields at once
   function insertAllOnce(string memory _name, uint _roll, bool _pass) public {
        s1 = Student(_name,_roll,_pass);
    }

// Returning Structs in Solidity
// ✅ 1. Returning the Entire Struct
    function getAll() public view returns(Student memory) { // Remb: here, Student is a data type which is created by struct
        return s1;   // Returns the entire struct
    }
/* Explanation: # returns(Student memory)
                 - You must use memory because structs are reference data types.
                 - Solidity copies the struct from storage (where s1 is stored) into memory before returning.
                # return s1;
                 - This is useful when you want to fetch the complete data of a struct in one function call.  */


// ✅ 2. Returning Individual Values
     function getName() public view returns(string memory) {
        return s1.name;  //This returns only individual value
    }
/* Explanation: - Here only the name field is being returned.
                - Since string is also a reference type, we must use string memory.
                - You can also create or return similar functions for roll number or pass status. */
}