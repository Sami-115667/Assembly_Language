    AREA test,CODE,READONLY
    ENTRY
    EXPORT main

main
    MOV R0, #16
    MOV R1, #5
    ADD R2, R0, R1
	MUL R3, R0, R1
	SUB R4, R0, R1
	
	
	
	MOV R5, #0xFFFFFFFF
    MOV R6, #0xFFFFFFFF
    ADD R7, R5, R6
	MUL R8, R5, R6
	SUB R9, R5, R6
	
	
	 
    
    

stop
    B stop  ; Infinite loop to halt execution

    END
		
    