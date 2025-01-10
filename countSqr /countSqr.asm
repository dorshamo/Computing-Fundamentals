

//SP = &SCREEN;
@SCREEN
D = A
@SP
M = D
//push(R2);
@R2
D = M
@SP
M = M-1
A = M
M = D
//push(R1);
@R1
D = M
@SP
M = M-1
A = M
M = D
//push(&RET1);
@RET1
D = A
@SP
M = M - 1
A = M
M = D
//goto COUNT_SQUARE;
@COUNT_SQUARE
0;JMP
//RET1:
(RET1)
//R3 = pop();
@SP
A = M
D = M // D = *SP
@SP
M = M + 1
@R3
M = D
//SP += 3;
@3
D=A
@SP
M = D + M
//goto END;
@END
0;JMP


//COUNT_SQUARE:
(COUNT_SQUARE)
//count = 0;
@count
M = 0
//j2 = 0;
@j2
M = 0
//index=*(SP+1);
@1
D = A
@SP
A = D + M
D = M
@index
M = D
//i3 = index
@index
D=M
@i3
M=D
//size_f=*(SP+2);
@2
D = A
@SP
A = D + M
D = M
@size_f
M = D
//WHILE1:
(WHILE1)
//if(i3 >= index + size_f) goto WHILE1_END
@size_f
D = M 
@index
D = D + M //index + size_f
@i3
D = M - D
@WHILE1_END
D;JGE
//num = Ram[i3];
@i3
A = M //Ram[i3]
D = M
@num
M = D
//j2 = 0;
@j2
M = 0
//WHILE2:
(WHILE2)
//push(j2);
@j2
D = M
@SP
M = M-1
A = M
M = D
//push(&RET2);
@RET2
D = A
@SP
M = M - 1
A = M
M = D
//goto MULTSELF;
@MULTSELF
0;JMP
//RET2:
(RET2)
//i_mult_i = pop();
@SP
A = M
D = M // D = *SP
@SP
M = M + 1
@i_mult_i
M = D
//SP += 2;
@2
D=A
@SP
M = D + M
//if(i_mult_i >= num) goto WHILE2_END
@num
D = M
@i_mult_i
D = M - D // i_mult_i - num > 0
@WHILE2_END
D;JGT
//if(i_mult_i != num) goto SKIP_COUNT
@num
D = M
@i_mult_i
D = M - D // i_mult_i - num != 0
@SKIP_COUNT
D;JNE
//count++;
@count
M = M + 1
//SKIP_COUNT:
(SKIP_COUNT)
//j2++;
@j2
M = M + 1
//goto WHILE2;
@WHILE2
0;JMP
//WHILE2_END:
(WHILE2_END)
//i3++;
@i3
M = M + 1
//goto WHILE1;
@WHILE1
0;JMP
//WHILE1_END:
(WHILE1_END)
//push(count);
@count
D = M
@SP
M = M - 1
A = M
M = D
//goto RET1;
@SP          
A = M + 1   
A = M           
0;JMP 

//MULTSELF:
(MULTSELF)
//mult = 0;
@mult
M = 0
//i2=*(SP+1);
@1
D = A
@SP
A = D + M
D = M
@i2
M = D
//j = 0;
@j
M = 0
//WHILE:
(WHILE)
//if(j >= i) goto MULTEND;
@i2
D = M
@j
D = M - D // j - i2 >= 0
@MULTEND
D;JGE
//mult = mult + i2;
@i2
D = M
@mult
M = M + D
//j++;
@j
M = M + 1
//goto WHILE;
@WHILE
0;JMP
//MULTEND:
(MULTEND)
//push(mult);
@mult
D = M
@SP
M = M - 1
A = M
M = D
//goto RET2;
@SP          
A = M + 1   
A = M           
0;JMP        
//END:
(END)
@END
0;JMP