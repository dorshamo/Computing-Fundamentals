// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// Assumes that R0 >= 0, R1 >= 0, and R0 * R1 < 32768.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

//// Replace this comment with your code.

//R2 = R0*R1

//int i = 0;
@R0
D = M
@i
M = D
//int = *R2 = 0;
@R2
M = 0
//if (i == 0) goto STOP;
(WHILE)
@i
D = M
@STOP
D;JEQ
//R2 = R2 + R1;
@R1
D = M 
@R2
M = M + D
//i--;
@i
M = M - 1
//goto WHILE;
@WHILE
0;JMP
(STOP)
@STOP
0;JMP