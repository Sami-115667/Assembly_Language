    AREA data, DATA, READWRITE
n DCD 4 ; number 1
m DCD 5	; number 2
r DCD 1	; result
	
	AREA sum_CallByReference, CODE, READONLY
    ENTRY
	EXPORT main

addd
	; This function takes two arguments passed by value
	POP{r3, r4, r5}		; arg1: r0, arg2: r1, arg3: r2
	LDR r3, [r3]	; Loading value from memory location for number 1
	LDR r4, [r4]	; Loading value from memory location for number 2
	ADD r4, r3, r4	; r4 = number1(r0) + number2(r1)
	STR r4, [r5]	; storing result to result address
	LDR r6, [r5]
	BX  lr          ; Return to caller

; main function
main
	; Initialize the arguments and call the sum function
	LDR r0, =n        ; r0 = address of the first number
	LDR r1, =m        ; r1 = address of the second number
	LDR r2, =r		  ; result addresss
	
	PUSH {r0, r1, r2} 	; pushing the value addressed to the stack
	BL addd				; calling the function to add
	LDR r3, [r2]		; getting result from memory address
STOP B STOP		
	END
	