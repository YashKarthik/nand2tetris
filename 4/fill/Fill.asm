// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.
  @SCREEN
  D=A
  @i
  M=D
(LOOP)
  @i
  D=M
  @SCREEN
  D=D-A
  @8192
  D=A-D
  @RESET
  D;JEQ

  @KBD
  D=M
  @WHITE
  D;JEQ
  @BLACK
  D;JNE

(RESET)
  @SCREEN
  D=A
  @i
  M=D
  @LOOP
  0;JMP

(BLACK)
  @32767
  D=A
  @i
  A=M
  M=D
  @INC
  0;JMP

(WHITE)
  @0
  D=A
  @i
  A=M
  M=D
  @INC
  0;JMP

(INC)
  @i
  M=M+1
  @LOOP
  0;JMP

(END)
  @END
  0;JMP
