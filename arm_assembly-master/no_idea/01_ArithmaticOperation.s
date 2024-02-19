; 1. Write a simple program to calculate: P = Q + R + S. Let Q = 2, R = 4, S = 5. Assume that r1 = Q, r2 = R, r3 = S. The result P will go in r0.
; 2. Write a simple program to calculate: P = Q - R . Assume that r1 = Q, r2 = R, and Q¿R. The result P will go in r0.
; 3. Write a simple program to calculate: P = Q - R- S. Let Q = 12, R = 4, S = 5. Assume that r1 = Q, r2 = R, r3 = S. The result P will go in r0.
; 4. Write a simple program to calculate: P = Q x R . The result P will go in r0.
; 5. This problem is same as the problem 1. W = X + Y + Z . Once again, let X = 9, Y = 8, Z = 5 and we assume that r4 = X, r3 = Y, r2 = Z. In this case, you will put the data inmemory in the form of constants before the program runs.
	
	AREA ARITHMETIC1, CODE, READONLY
	ENTRY ; starting point of the code execution
	EXPORT main 						; the declaration of identifier main, task 1
	EXPORT addition2				; task 5
	EXPORT subtraction1			;task 2
	EXPORT subtraction2			;task 3
	EXPORT multiplication			;task 4

X EQU 9
Y EQU 8
Z EQU 5

main 
	MOV r1, #4
	MOV r2, #5
	MOV r3, #6
	ADD r0, r2, r3
	ADD r0, r0, r1
addition2
	LDR r4, =X
	LDR r3, =Y
	LDR r2, =Z
	ADD r0, r1,r2
	ADD r0, r0,r3
subtraction1
	MOV r1, #4
	MOV r2, #2
	SUB r0, r1,r2
subtraction2
	MOV r1, #12
	MOV r2, #4
	MOV r3, #5
	SUB r0, r1,r2
	SUB r0, r0,r3
multiplication
	MOV r1, #4
	MOV r2, #2
	MUL r0, r1,r2
STOP B STOP ; Endless loop
	END ; End of the program, matched with ENTRY keyword