//int sum = 0;
@sum
M = 0;
//int i = R1;
@R1
D=M
@i
M=D
//WHILE:
(WHILE)
//if(i > R1 + R2) goto STOP;
@R1
D=M - 1 //D = R1 - 1
@R2
D = D + M //R1+R2 - 1
@i
D = M - D //i - (R1-R2-1)
@STOP
D;JGT//goto STOP
//if(Ram[i] & 1 != 0) goto ODD
@1
D = A //D=1
@i
A = M //Ram[i]
D = M & D //Ram[i] & 1
@ODD
D;JNE//if D != 0 jump to ODD
//sum = sum + Ram[i];
@i
A = M 
D = M //D = Ram[i]
@sum
M = M + D //sum = sum + Ram[i];
//ODD:
(ODD)
//i = i + 1;
@i
M = M + 1
//goto WHILE;
@WHILE
0;JMP
//STOP:
(STOP)
//R0 = sum;
@sum
D = M
@R0
M = D
//END:
(END)
@END
0;JMP