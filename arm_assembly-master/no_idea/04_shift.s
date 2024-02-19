; problem 2: Write an assembly language to perform all the shift operations (LSR, ASR, LSL) on a 32-bit variable.
	AREA ShiftExample, CODE, READONLY
	ENTRY
	EXPORT main
; Define constants
A EQU 0x0000AAAA ; 32-bit value to shift

main
    ; Load the value to be shifted into register r1
    LDR r0, =A			; r1 = 0000 0000 0000 0000 1010 1010 1010 1010
								;	 = 43690
    ; Logical Shift Right (LSR) by 4 bits
    LSR r1, r0, #4 		; r1 = r0 >> 4
								; expected r1 = 0x00000AAA
    ; Arithmetic Shift Right (ASR) by 4 bits
    ASR r2, r0, #4 		; r2 = r0 >> 4 (sign-extension)
								; expected r2 = 0x00000AAA
    ; Logical Shift Left (LSL) by 4 bits
    LSL r3, r0, #4 		; r3 = r0 << 4
								; expected r3 = 0x000AAA0
;Hault the loop
STOP B STOP
    END
