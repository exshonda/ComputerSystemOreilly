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
(LOOP_KBD)
        // select color
        @KBD
        D=M			// �L�[�{�[�h�̓��͂�D�ɓǂݍ���
        @SELECT_WHITE
        D; JEQ		// �����L�[��������Ă��Ȃ����@SELECT_WHITE��JMP
        @0
        D=A-1		// D=0xFFFF
        @SET_COLOR
        0; JMP		// @SET_COLOR��JMP
(SELECT_WHITE)
        @0
        D=A			// D=0
(SET_COLOR)
        @color
        M=D			// @color�̃A�h���X��D����

        @SCREEN
        D=A			// @SCREEN�̃A�h���X��D�ɓǂݍ���
        @pos
        M=D			// @pos�̃A�h���X��D����������

        // 32 * 256 = 8192
        @8192
        D=A			// D=8192
        @n
        M=D			// n=8192

(LOOP_FILL)
        @n
        D=M			// D=@n
        @FILL_END
        D; JEQ		// @n��0�Ȃ��@FILL_END��

        // print color
        @color
        D=M			// @color�̓��e��D�ɓǂݍ���
        @pos
        A=M			// A��@pos�̓��e��ǂݍ���
        M=D			// A�̃A�h���X��D����������

        @pos
        M=M+1		// @pos+1
        @n
        M=M-1		// @n-1

        @LOOP_FILL
        0; JMP		// @LOOP_FILL�Ɉړ�
(FILL_END)
        @LOOP_KBD
        0; JMP		// @LOOP_KBD�ɖ߂�
