
load Mul8.hdl,
output-file Mul8.out,
compare-to Mul8.cmp,
output-list a%B1.8.1 b%B1.8.1 out%B1.16.1;

set a %B11111111;  
set b %B00000001, eval, output;
set b %B00000010, eval, output;
set b %B00000100, eval, output;
set b %B00001000, eval, output;
set b %B00010000, eval, output;
set b %B00100000, eval, output;
set b %B01000000, eval, output;
set b %B10000000, eval, output;

set a %B00000000;  
set b %B00000001, eval, output;
set b %B00000010, eval, output;
set b %B00000100, eval, output;
set b %B00001000, eval, output;
set b %B00010000, eval, output;
set b %B00100000, eval, output;
set b %B01000000, eval, output;
set b %B10000000, eval, output;

set a %B10010110;  
set b %B00000001, eval, output;
set b %B00000010, eval, output;
set b %B00000100, eval, output;
set b %B00001000, eval, output;
set b %B00010000, eval, output;
set b %B00100000, eval, output;
set b %B01000000, eval, output;
set b %B10000000, eval, output;


set b %B11111111;  
set a %B00000001, eval, output;
set a %B00000010, eval, output;
set a %B00000100, eval, output;
set a %B00001000, eval, output;
set a %B00010000, eval, output;
set a %B00100000, eval, output;
set a %B01000000, eval, output;
set a %B10000000, eval, output;

set b %B00000000;  
set a %B00000001, eval, output;
set a %B00000010, eval, output;
set a %B00000100, eval, output;
set a %B00001000, eval, output;
set a %B00010000, eval, output;
set a %B00100000, eval, output;
set a %B01000000, eval, output;
set a %B10000000, eval, output;

set b %B10010110;  
set a %B00000001, eval, output;
set a %B00000010, eval, output;
set a %B00000100, eval, output;
set a %B00001000, eval, output;
set a %B00010000, eval, output;
set a %B00100000, eval, output;
set a %B01000000, eval, output;
set a %B10000000, eval, output;

set a %B11111111, set b %B11111111, eval, output;
set a %B10010110, set b %B10010110, eval, output;
