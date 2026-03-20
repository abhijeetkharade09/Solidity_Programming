// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract ArrayStruct{    // Defining a Struct

    struct Student{
        string name;
        uint roll;
        bool pass;
    }

/* Student public s1;   
   - In this s1 is variable that can hold the data value of a single Student we cannot store the data value 
     of multiple student for example of 100 different student.
   - So to store the data value of multiple student we need to create Array of Struct */

Student[4] public s1;    // Array of Struct --> Fixed Array   Remb: s1 is a variable actually here

function insertFixed(uint index, string memory _name, uint _roll, bool _pass) public  {  // Insert
    s1[index]=Student(_name,_roll,_pass);
}

function returnFixed(uint index) public view returns(Student memory){                    // Return
        return s1[index];
}

function returnAllArray() public view returns(Student[4] memory){                    // Return All Array of Struct
        return s1;
}

Student[] public s2;    // Array of Struct --> Dynamic Array

function insertDynamic(string memory _name, uint _roll, bool _pass) public  {           // Insert
    s2.push(Student(_name,_roll,_pass)); 
    /* - we know for dynamic array we use push for inserting data values here
       - we do not require an index value because push will automatically push the value
         at index 0, then 1, then 2 and continue....  */
}

function returnDynamic(uint index) public view returns(Student memory){                // Return
        return s2[index];
}



}   