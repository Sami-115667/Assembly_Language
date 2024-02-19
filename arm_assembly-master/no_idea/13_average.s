; problem: Write an assembly language program to find the average of n numbers.
	AREA AVERAGE, CODE, READONLY
	ENTRY
	EXPORT main
		
;Define constants
n EQU  5				; number of value to average
arr DCD 1,2,3,4,5 	; numbers in the array
	
main
	MOV r1, #0		; sum = 0
	MOV r2, #0		; counter = 0
	LDR r3, =arr		;loading array
	loop:
			LDR r0,[r3]		;load the value from array
			ADD r1, r1, r0	; sum = sum+arr[pos]
			ADD r2, r2, #1	; counter++;
			ADD r3, r3, #4	; next position at array
			CMP	r2, #5			; compare counter with n
			BNE	loop ; if counter !=n, continue loop
			BX lrf
STOP B STOP
	END