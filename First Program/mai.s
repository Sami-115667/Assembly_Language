    AREA test,CODE,READONLY
    ENTRY
    EXPORT main

main
    MOV R0, #16
    MOV R1, #5
    ADD R2, R0, R1
	MUL R3, R0, R1
	SUB R4, R0, R1
	CMP R0, R1
	 
stop
    B stop  ; Infinite loop to halt execution
END
		
		
    