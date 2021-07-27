// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

        @R1
        D=M			// D=R1
        @n
        M=D			// n=R1
        @R2
        M=0			// R2=0
(LOOP)
        @n
        D=M			// D=n
        @END
        D; JEQ		// n==0 Ç»ÇÁÇŒENDÇ÷à⁄ìÆ
        @R0
        D=M			// D=R0
        @R2
        M=M+D		// R2=R2+R0
        @n
        M=M-1		// n=n-1
        @LOOP
        0; JMP		// LOOPÇ÷à⁄ìÆ
(END)
        @END
        0; JMP		// ñ≥å¿ÉãÅ[Év
