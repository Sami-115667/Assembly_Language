	AREA DECLARATION, DATA, READWRITE

arr	DCD 2, 3, 3, 5, 6

	AREA AVG, CODE
		ENTRY
		EXPORT main

main
		LDR	r0, =arr      	; Load array address into r0
		MOV	r2, #0      		; Initialize sum to 0
		MOV	r4, #0      		; Initialize loop counter to 0
		MOV	r5, #5

LOOP_START
		LDR		r1, [r0]   ; Load array element into r1
		ADD 	r2, r2, r1	; sum += arr[pos]
		ADD 	r0, r0, #4	; Move to next array element
		ADD 	r4, r4, #1 	; Increment loop counter
		CMP 	r4, #5		; Compare loop counter with array length
        BNE     LOOP_START 

		SDIV 	r3, r2, r5	; Calculate average, r3 = sum/n
		
		
		B		stop

stop
		END
