// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Loops {

    function loop() public pure returns(uint){
        uint sum;
        uint count;

        while (count <5)      // while loop
        {
            sum = sum + count;
            count = count + 1;
        }
        return sum;
        
        // do {                  // do while loop
        //     sum = sum + count;
        //     count = count + 1;
        // } 
        // while (count<5);
        // return sum;

        // for (uint count; count<5; count++)   // for loop
        // {
        //     sum = sum + count;
        // }
        // return  sum;


    }
    
}

/*Types of loops: while
                  for
                  do-while

Remb: you cannot create loop at contract level, you have to create loop inside function only         
*/