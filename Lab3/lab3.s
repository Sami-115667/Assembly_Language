    AREA test,CODE,READONLY
    ENTRY
    EXPORT main

main
    MOV R0, #0x0001
    MOV R1, #0x0000
    AND R2, R0,R1
	MVN R3, R2
	ORR R0, R1
	ORR R4, R0
	MVN R5, R4
	EOR R6, R0,R1
	MVN R7, R6
	
	
	
	MOV R8, #0x00000001
    MOV R9, #0x00000000
    AND R10, R8,R9
	MVN R10, R10
	ORR R8, R9
	ORR R11, R8
	MVN R11, R11
	EOR R12, R8,R9
	MVN R12, R12
	
	
	
	 
    
  

stop
    B stop  ; Infinite loop to halt execution

    END
		
    