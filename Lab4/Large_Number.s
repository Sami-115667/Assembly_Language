	AREA DECLARATION, DATA, READWRITE

arr	DCD 1, 2, 3, 4, 5

	AREA LARGE_NUMBER, CODE
		ENTRY
		EXPORT main

main
		LDR	r0, =arr      	; Load array address into r0
		MOV	r2, #0      		; Initialize maximum to 0    
		MOV	r4, #0          ; Initialize loop counter to 0

LOOP_START
		LDR		r1, [r0]    ; Load array element into r1
		CMP		r1, r2      ; Compare current element with current maximum
		BLE		NOT_GREATER ; If not greater or equal, skip updating maximum
		MOV		r2, r1		; Update maximum to current element  
NOT_GREATER
		ADD 	r0, r0, #4	; Move to next array element
		ADD 	r4, r4, #1 	; Increment loop counter

		CMP 	r4, #5		; Compare loop counter with array length
        BNE     LOOP_START 

		B		stop

stop
		END
