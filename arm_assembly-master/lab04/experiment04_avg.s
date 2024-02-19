 	  AREA DECLARATION, DATA, READWRITE
sum	EQU 0
arr	DCD     2, 3, 3, 5, 6
avg	DCD     0
n	EQU 5
	AREA AVG, CODE
		ENTRY
		EXPORT main
main
		LDR	r0, =arr      	; array 
        LDR 	r1, =n      		;no. of elements in array
        LDR	r2, =sum		; result
		LDR	r3, =n			
		MOV r4, #0   
LOOP_START
		LDR		r5, [r0]   ; loading array element into r5
		ADD 	r2, r2, r5	; sum += arr[pos]
		ADD 	r0, r0, #4	; array next position
		ADD 	r4, r4, #1 	; ++counter
		CMP 	r4, r1		; comparing r4 with n
        BNE     LOOP_START 
		SDIV 	r3, r2, r1	; dividing, r3 = sum/n
		
stop B stop
	END















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

		

        