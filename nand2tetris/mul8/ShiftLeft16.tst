
load ShiftLeft16.hdl,
output-file ShiftLeft16.out,
compare-to ShiftLeft16.cmp,
output-list in%B1.16.1 out%B1.16.1;

set in %B0000000000000000,  
eval, output;

set in %B1111111111111111,  
eval, output;

set in %B1001011010010001,  
eval, output;

set in %B1010101010101010,  
eval, output;

