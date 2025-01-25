
load Mul16x1.hdl,
output-file Mul16x1.out,
compare-to Mul16x1.cmp,
output-list a%B1.16.1 b%B1.16.1 out%B1.16.1;

set a %B1111111111111111;  
set b 0, eval, output;
set b 1, eval, output;

set a %B0000000000000000;  
set b 0, eval, output;
set b 1, eval, output;

set a %B0100101101001011;  
set b 0, eval, output;
set b 1, eval, output;

