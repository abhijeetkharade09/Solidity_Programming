// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Integer {

    uint public num=4; 
    // in deploy --> we see uint256 
    // i.e  uses 256 bits by default(uint = uint256)
    // By default, all uint and int types use 256 bits for storage.
    // This is the most efficient size for the Ethereum Virtual Machine (EVM).

    int8 public num2=120; // -128 to +127 {Correct}
//  int8 public num3=129; // -128 to +127 {Error: out of range}

    uint8 public num4=252; // 0 to +255 {Correct}
//  uint8 public num5=260; // 0 to +255 {Error: out of range}
    
}