;	problem 1: Write an arm assembly language to perform all the logical operations 
;	(AND,OR,NOR,NAND,XOR,XNOR) on two 16-bit variables. Repeat it for two 32-bit variables.
	
	AREA BITWISE_OP, CODE, READONLY
	ENTRY
	EXPORT main
aa DCD 0xAAAA          	; Binary: 1010101010101010
	
main
    ; Load two 32-bit variables into r0 and r1
    LDR r0, =aa 
	LDR r0, [r0] ; loading the value into r0
	
	LSR r1, r0, #4	; logical shift right 4bits r1 = r0>>4
	ASR r2, r0, #4	; arithmetic shift right 4 bits r2 = r0>>4
	LSL r3, r0, #4	; logical shift left 4bits r3 = r0<<4
	
    ; Halt execution
STOP  B STOP
    END
