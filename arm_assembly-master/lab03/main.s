	AREA Lab03, CODE, READONLY
	ENTRY ; starting point of the code execution
	EXPORT main ; the declaration of identifier main
	EXPORT prob2
	EXPORT prob3
	EXPORT prob4
	EXPORT prob5
main
	MOV r1, #4
	MOV r2, #5
	MOV r3, #6
	ADD r0, r2, r3
	ADD r0, r0, r1
prob2
	MOV r1, #4
	MOV r2, #2
	SUB r0, r1,r2
prob3
	MOV r1, #12
	MOV r2, #4
	MOV r3, #5
	SUB r0, r1,r2
	SUB r0, r0,r3
prob4
	MOV r1, #4
	MOV r2, #2
	MUL r0, r1,r2
prob5
	MOV r4, #9
	MOV r3, #8
	MOV r2, #5
	ADD r0, r1,r2
	ADD r0, r0,r3
STOP B STOP ; Endless loop
	END ; End of the program, matched with ENTRY keyword