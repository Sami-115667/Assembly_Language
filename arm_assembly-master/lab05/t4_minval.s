	AREA minval, DATA, READWRITE
arr DCD 5, 4, 1, 2, -1, 100 ; array containign integer values
sz DCD 6 ; array size
	
	AREA MAIN, CODE, READONLY
	ENTRY
	EXPORT main

min
	POP{r1, r2} ; r1=size, r2=min_element
	CMP r1, #0
	BEQ return
	LDR r3, [r0]
	ADD r0, r0, #4	; incementing array size
	SUBS r1, r1, #1	; size = size -1
	CMP r3, r2
	MOVLT r2, r3	; if the current value is less than the min_element, than update the min element
	PUSH{r1, r2}; pushing the arguments to the stack
	BL min			; making recursive call to the function
	
return
	BX lr
main
	LDR r0, =arr ; loading array address to r0
	LDR r1, =sz	 ; loading array size
	LDR r1, [r1]
	MOV r2, #999 ;considering max value possible in the array is 999
	PUSH{lr, r1, r2} 
	BL min
STOP B STOP
	END