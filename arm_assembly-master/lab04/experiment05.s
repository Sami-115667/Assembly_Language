	AREA DECLARATION, DATA, READWRITE
n EQU 5
arr DCD 1,2,3,4,5
	AREA GREATEST, CODE, READONLY
	ENTRY
	EXPORT main

main
	LDR r0, =arr
	LDR r0, [r0]	; considering first number as greatest
	LDR r1, =n	; number of elements in the array
	LDR r2,=arr	; array start from 2nd element
	ADD r2, r2,#4 ;moving r2 position in the array 1 step ahead 
	MOV r3,#1	; starting loop from arrray position 1
START_LOOP
	CMP r3, r1
	BEQ STOP 
	LDR r4, [r2]
	CMP r0, r4
	BGT SAVEMAX	;storing current greatest value
	ADD r2, r2, #4		;moving r2 position in the array 1 step ahead
	ADD r3, r3, #1
	
SAVEMAX
	MOV r0, r4
	B START_LOOP
STOP B STOP
	END
	
	