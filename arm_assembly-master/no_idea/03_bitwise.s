;	problem 1: Write an arm assembly language to perform all the logical operations 
;	(AND,OR,NOR,NAND,XOR,XNOR) on two 16-bit variables. Repeat it for two 32-bit variables.
	
	AREA BITWISE_OP, CODE, READONLY
	ENTRY
	EXPORT main

main
    ; 16-bit logical operations
    ; Load two 16-bit variables into r0 and r1
    LDRH r0, =0xAAAA    ; Binary: 1010101010101010
    LDRH r1, =0x5555      ; Binary: 0101010101010101
    
    ; AND operation
    AND r2, r0, r1     ; r2 = r0 AND r1
							 ; expected = 0x0000
    ; OR operation
    ORR r3, r0, r1     ; r3 = r0 OR r1
						     ; expected r3 = 0xFFFF
    ; NOR operation
    EOR r4, r0, r1       ; r4 = r0 EX-OR r1
	MVN r4,  r4	 	   ; r4 = (NOT r0) OR r1
							   ; expected r4 = 0x0000
	
    
    ; Halt execution
STOP  B STOP
    END
