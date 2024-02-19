	AREA BITWISE_OP, CODE, READONLY
	ENTRY
	EXPORT main ;16bit
	EXPORT op32 ;32bit

a16 DCD 0xAAAA
b16 DCD 0x5555
a32 DCD 0x0000AAAA
b32 DCD 0x00005555

; main loop for 16 bit operation
main
	LDR r0, =a16				;load the memory address of a16 into r0
X LDRH r1, [r0]				;loads lower 16 bits value into r1
	LDR r0, =b16				;load the memory address of b16 into r0
	LDRH r2, [r0]				;load the lower 16bit value into r2
	AND r3, r1, r2			; performs bitwise AND operation
	MVN r4, r3				; r4 = NOT(AND(r1,r2)) Equvalent to NAND
	ORR r5, r1, r2			; performs bitwise OR operation
	MVN r6, r5				; nor operation as OR value stored in r5
	EOR r7, r1, r2			; EX-OR 
	MVN r8, r7				; EX-NOR
op32
	LDR r0, =a32				;load the memory address of a32 into r0
	LDR r1, [r0]				;loads value of a32 into r1
	LDR r0, =b32				;load the memory address of b32 into r0
	LDR r2, [r0]				;load the value of b32 into r2
	AND r3, r1, r2			; performs bitwise AND operation
	MVN r4, r3				; r4 = NOT(AND(r1,r2)) Equvalent to NAND
	ORR r5, r1, r2			; performs bitwise OR operation
	MVN r6, r5				; nor operation as OR value stored in r5
	EOR r7, r1, r2			; EX-OR 
	MVN r8, r7				; EX-NOR
STOP B STOP
	END