// File name: countSqr.tst

// Tests the countSqr.asm program in the CPU emulator.

load countSqr.asm,
output-file countSqr.out,
compare-to countSqr.cmp,
output-list RAM[3]%D2.6.2 ;

set RAM[3] -1,   // sets test arguments
set RAM[1] 7,
set RAM[2] 5,
set RAM[7] 9,
set RAM[8] -33,
set RAM[9] 11,
set RAM[10] 4,
set RAM[11] 6;  // tests the example
repeat 500{ 
  ticktock;
}
set RAM[1] 0,   // restores the arguments in case the program used them
set RAM[2] 0,
output;

