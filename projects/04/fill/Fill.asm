// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
@8192
D = A
@screenSize
M = D

(LOOP)
    // i = 0
    @i
    M = 0

    // if RAM[KBD] != 0 then goto DRAW_BLACK_LOOP
    @KBD
    D = M
    @DRAW_BLACK_LOOP
    D;JNE
  
    // draw screen
    // for(i = 0; i < screenSize; i++)
    //      RAM[i] = 0|-1(0xffff)
    (DRAW_WHITE_LOOP)
        // if i - screenSize >= 0 then goto DRAW_END
        @i
        D = M
        @screenSize
        D = D - M
        @DRAW_END
        D;JGE

        // D = SCREEN + i
        // RAM[D] = 0x0000
        @i
        D = M
        @SCREEN
        D = D + A
        A = D
        M = 0

        // i = i + 1
        @i
        M = M + 1

        @DRAW_WHITE_LOOP
        0;JMP

    (DRAW_BLACK_LOOP)
        // if i - screenSize >= 0 then goto DRAW_END
        @i
        D = M
        @screenSize
        D = D - M
        @DRAW_END
        D;JGE

        // D = SCREEN + i
        // RAM[D] = 0xffff
        @i
        D = M
        @SCREEN
        D = D + A
        A = D
        M = -1

        // i = i + 1
        @i
        M = M + 1
        
        @DRAW_BLACK_LOOP
        0;JMP

    (DRAW_END)
        @LOOP
        0;JMP