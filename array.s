	AREA Task1, CODE, READONLY
    ENTRY
	EXPORT main
; define the array of integers
arr	DCD 1,2,3,4,5,6,7,8,9,10			
              

main     
	LDR r0, =arr
	LDR r1,[r0]
	ADD r0 , r0, #36
	LDR r2,[r0]
	LDR r3,=arr
	MOV r4,#0
	MOV r5,#0
	
loop
	LDR r6,[r3]
	ADD r4,r4,r6
	ADD r3,r3,#4
	ADD r5,r5,#1
	CMP r5,#10
	BNE loop
	

	
	
	
	
	
	

   
	
STOP B STOP
	END
    
	
