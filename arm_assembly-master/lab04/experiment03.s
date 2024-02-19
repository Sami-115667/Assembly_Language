	AREA DECLARATION, DATA, READWRITE
w	 	DCD 0x20000000
x	 	DCD 0x20000000
	AREA OPERATION, CODE,READONLY

addition; function for addition
	adds r3, r2, r1		; r3 = r1+r2
	bvs overAdd
	b STOP
overAdd
	mov r10, #1			; set 1 if overflow occurs
	b STOP
subtraction; function for subtraction
	subs r4, r2, r1		; r3 = r1-r2
	bvs overSub
	b STOP
overSub
	mov r11, #1			; set 1 if overflow occurs
	b STOP

	EXPORT main
main
	;init values in registers
	ldr r0, =w
	ldr r1,[r0]	;r1 = w
	ldr r0, =x
	ldr r2,[r0]	;r2 = x
	
	BL addition
	BL subtraction

	
STOP B STOP
	END
	