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

(FILL)
    @KBD
    D=M
    @UNFILL
    D;JEQ
    //fill
    @i
    M=0
    @8192
    D = A
    @n
    M=D

    (LOOPFILL)
        @i
        D = M
        @SCREEN
        A = A + D
        M = -1

        @i
        M = M + 1
        D = M

        @n
        D = M-D

        @LOOPFILL
        D;JNE


    @FILL
    0;JMP
(UNFILL)
    @KBD
    D=M
    @FILL
    D;JNE
    //unfill
    @i
    M=0
    @8192
    D = A
    @n
    M=D

    (LOOPUNFILL)
        @i
        D = M
        @SCREEN
        A = A + D
        M = 0

        @i
        M = M + 1
        D = M

        @n
        D = M-D

        @LOOPUNFILL
        D;JNE

    @UNFILL
    0;JMP
    