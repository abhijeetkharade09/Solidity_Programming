// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract MapwithStruct {
    struct Student{           // struct
        string name;
        uint roll;
        bool pass;
    }

    mapping(uint=>Student) public data;         // mapping

    function insertStruct(uint index, string memory _name,uint _roll, bool _pass) public {    // Inserting Data
        data[index]=Student(_name,_roll,_pass);
    }

    function returnStruct(uint index) public view returns(Student memory) {   // Getting Data
        return data[index];
    }

/* Note: Definitely you can also, You know I using different index as a unique key 
         you can also use this roll number as your index and unique key as well that's depend on you */

}
/*
Mapping with Struct:
- A struct allows you to store complex data by grouping multiple different data types together.
- A mapping can then be used to store these structs and access each one using a unique key (such as an ID or roll number).


*/  