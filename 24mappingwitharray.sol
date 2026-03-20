// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract MappingArray{

    mapping(address=>uint[]) public marks;  // - Key = address  - Value = dynamic array (marksValue list)

 // Inserting Marks
    function insertMarks(address student, uint marksValue) public {
        marks[student].push(marksValue);
    }
/* How it works: - The student address is passed.
                 - marks[student] gives the Array of that student.
                 - .push(marksValue) adds new marks value. */
    
 // Returning the Marks Array
    function returnMarks(address student) public view returns(uint[] memory) {
        return marks[student];
    }
/* Important points: - Since we return an array, we must use memory.
                     - Solidity requires memory for returning complex (reference) types */
}

/* 
Mapping with Array:
- A mapping with an array means the value of the mapping is an array instead of a single value. So each key has its own independent array.
- Let us understand with example, so there is a Student who want to store his marks okay so the student has a address and this address want to store his marks. 
- Let say there are various subject, then we definitely need a array kind of structure which can hold all the marks of that particular student. So in such scenario
  we have to declare mapping with array.

Example:
mapping(address => uint[]) public marks;    // - Key = address  - Value = dynamic array (marksValue list)

Meaning: Every student(address) has an array of marks.
Why array? --> Because a student can have marks for many subjects.

*/