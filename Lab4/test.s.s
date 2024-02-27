

	AREA Shifting, CODE, READONLY
	ENTRY
	EXPORT main
aa DCD 0x00000001          	; Binary: 00000000000000000000000000000001
	
main
    ; Load two 32-bit variables into r0 and r1
    LDR r0, =aa	 ; loading the address into r0 
	LDR r0, [r0] ; loading the value into r0
	
	LSR r1, r0, #4	; logical shift right 4bits r1 = r0>>4
	ASR r2, r0, #4	; arithmetic shift right 4 bits r2 = r0>>4
	LSL r3, r0, #4	; logical shift left 4bits r3 = r0<<4
	
    ; Halt execution
STOP  B STOP
    END
