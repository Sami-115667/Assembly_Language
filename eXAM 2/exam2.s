	AREA array_length, CODE, READONLY
    ENTRY
    EXPORT main

    
ARRAY       DCD  1, 2, 3, 4, 5, 0  
ARRAY1      DCD  0
main
    
    LDR R0, =ARRAY
    
    
    MOV R1, #0     
    
    
    LDR R2, [R0]    
    CMP R2, #0      
    BEQ EMPTY_ARRAY  
    
LOOP
    
    LDR R2, [R0], #4  
    
    
    CMP R2, #0
    BEQ END_LOOP   
    
    
    ADD R1, R1, #1
    
    B LOOP

END_LOOP
	MOV R3, R1
    MOV R4, #1
    B END

EMPTY_ARRAY
	MOV R5, #1
    B END

END
    ; End of program

    END
