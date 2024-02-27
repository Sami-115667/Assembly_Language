

	AREA Booleian, CODE, READONLY
	ENTRY
	EXPORT main
w DCD 0x00000001          	
x DCD 0x00000002 			
y DCD 0x00000003 
z DCD 0x00000004	
main
    LDR r0, =w	    ; loading the address into r0 
	LDR r0, [r0]    ; loading the value into r0

	LDR r1, =x	    ; loading the address into r1
	LDR r1, [r1]    ; loading the value into r1

	LDR r2, =y	    ; loading the address into r2 
	LDR r2, [r2]    ; loading the value into r2
	
	LDR r3, =z	    ; loading the address into r3 
	LDR r3, [r3]    ; loading the value into r3
	
	AND r4, r0, r1  ; add r0 , r1 and store in r4
	AND r5, r2, r3  ; add r2 , r3 and store in r5
	MVN r6, r5      ;Not r5 and store in r6
	ORR r7, r4, r6  ; Or r4 , r6 and store in r7
	
	
    ; Halt execution
STOP  B STOP
    END
