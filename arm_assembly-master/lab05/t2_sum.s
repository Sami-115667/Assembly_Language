    AREA sum_CallByValue, CODE, READONLY
    ENTRY
	EXPORT main
addd
	; This function takes two arguments passed by value
	POP{r3, r4}		; arg1: r0, arg2: r1
	ADD r0, r3, r4    ; Add the two arguments
	PUSH{r0}		  ; Pushing result to stack
	BX  lr            ; Return to caller
	ENDP

; main function
main
	; Initialize the arguments and call the sum function
	MOV r0, #10        ; arg1 = 10
	MOV r1, #20        ; arg2 = 20
	
	PUSH {lr}		;pushing return address to stack
	PUSH {r0, r1}	;Pushing arguments to the stack
	BL  addd        ; Call addd(arg1, arg2)
	; The result is now in r0
	; Do something with the result
	POP{r5}			; getting the result from stack
	POP {pc}		;restoring return address to program counter
	MOV r0, #0      ; Return 0 to OS
	BX  lr          ; Return from main function
