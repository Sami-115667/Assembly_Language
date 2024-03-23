	AREA Task1, CODE, READONLY
    ENTRY
	EXPORT main

arr	DCD 1,2,3,4,5,6,7,8,9,10			
              

main     
	LDR r0,=arr
	LDR r1,=arr
	ADD r1,r1,#36
	MOV r2,#0
	MOV r4,#0
	
loop
	
	STR r0,[r1] 
	LDR r3,[r1]
	CMP r3,r4
	MOVGT r4,r3
	ADD r0,r0,#4
	SUB r1,r1,#4
	ADD r2,r2,#1
	CMP r2,#10
	BNE loop
	
	
	
	
	
	
	

   
	
STOP B STOP
	END
    
	
