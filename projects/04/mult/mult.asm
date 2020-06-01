// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
// R2 = 0;
// for(i = 0; i < R1; ++i){
//     R2 += R0
// }

// R2 = 0; i = 0
@R2
M = 0
@i
M = 0

(LOOP)
    // if i >= R1 (i-R1 >= 0), goto END
    @i
    D = M
    @R1
    D = D - M
    @END
    D;JGE

    // i += 1
    @i
    M = M + 1

    // D = R2 + R0
    // R2 = D
    @R2
    D = M
    @R0
    D = D + M
    @R2
    M = D
    // goto LOOP
    @LOOP
    0;JMP

(END)
    @END
    0;JMP
