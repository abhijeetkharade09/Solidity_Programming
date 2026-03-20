// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract NestedMapping {

    mapping(uint=>mapping(uint=>bool)) public data;   // nested mapping

    function insertNested(uint row, uint column, bool value) public {    // Inserting values
        data[row][column]= value;
    }

    function returnNested(uint row, uint column) public view returns(bool){   // Reading values
        return data[row][column];
    }
    /*
    Important point:
                    - Default bool = false
                    - So any position not filled manually shows false.
    */

}
/*
# Nested Mapping:
  - A nested mapping means a mapping inside another mapping.
  - Nested Mapping is a very important thing to know because this is also something that you are going to use a lot in solidity projects.
    So understand this data type in very very very important way because it is very important. So in order to declare nested mapping
    in solidity, this is how you declare a nested mapping in solidity

# Example: 
  mapping(address => mapping(address => bool)) public check;  // key can be anything, we are using here address datatype to understand

# Why is it confusing?
  Because the value of the first mapping is itself another mapping.

# Teacher’s trick:
  Imagine nested mapping like a 2D array (rows and columns).

# Visual understanding: First mapping key = row
                        Second mapping key = column
                        Value = bool

# Example:
  data[address1][address2] = true;

# Means: Row = address1
         Column = address2
         Value stored = true
*/