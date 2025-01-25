
load NewALU8bit.hdl,
output-file NewALU8bit.out,
compare-to NewALU8bit.cmp,
output-list a%B1.8.1 b%B1.8.1 opcode%B1.2.1 out%B1.16.1;

set a %B11111111, set b %B11111111;
set opcode %B00, eval, output;
set opcode %B01, eval, output;
set opcode %B10, eval, output;
set opcode %B11, eval, output;

set a %B11111111, set b %B00000000;
set opcode %B00, eval, output;
set opcode %B01, eval, output;
set opcode %B10, eval, output;
set opcode %B11, eval, output;

set a %B00000000, set b %B11111111;
set opcode %B00, eval, output;
set opcode %B01, eval, output;
set opcode %B10, eval, output;
set opcode %B11, eval, output;

set a %B00000000, set b %B10101010;
set opcode %B00, eval, output;
set opcode %B01, eval, output;
set opcode %B10, eval, output;
set opcode %B11, eval, output;

set a %B01011011, set b %B10001000;
set opcode %B00, eval, output;
set opcode %B01, eval, output;
set opcode %B10, eval, output;
set opcode %B11, eval, output;

set a %B10010110, set b %B10010110;
set opcode %B00, eval, output;
set opcode %B01, eval, output;
set opcode %B10, eval, output;
set opcode %B11, eval, output;
