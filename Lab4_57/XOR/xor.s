
	AREA XOR, CODE, READONLY
	ENTRY
	EXPORT main
p DCD 0x000020F2          	; Binary: 0010000011110010
q DCD 0x000030F0 			; Binary: 0011000011110000
r DCD 0x0000C4F8 			; Binary: 1100010011111000
z DCD 0x0000003E 			; Binary: 1100010011111000
	
	
main
   
    LDR r0, =p	    ; loading the address into r0 
	LDR r0, [r0]    ; loading the value into r0
	
	LDR r1, =q	    ; loading the address into r1
	LDR r1, [r1]    ; loading the value into r1
	
	LDR r2, =r	    ; loading the address into r2 
	LDR r2, [r2]    ; loading the value into r2
	
	LSL r3, r0, #17	; logical shift left 1 bit, storing the result in r3
	LSR r3, r3, #26	; logical shift right 10 bits, storing the result in r3
	
	LSL r4, r1, #25	; logical shift left 1 bit, storing the result in r4
	LSR r4, r4, #26	; logical shift right 10 bits, storing the result in r4
	
	LSL r5, r2, #21	; logical shift left 5 bits, storing the result in r5
	LSR r5, r5, #26	; logical shift right 10 bits, storing the result in r5
	
	LDR r0, =z	    ; loading the address into r0 
	LDR r0, [r0] 	; loading the value into r2
	
	EOR r6, r4, r5  ;xor r4,r5 and store in r6
	ORR r7, r3, r6  ;or r3,r6 and store in r7
	AND r8, r7, r0  ;and r7,r0 and store in r8
			
	
    ; Halt execution
STOP  B STOP
    END
