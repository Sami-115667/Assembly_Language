	
	AREA list2, DATA, READWRITE

LIST_SIZE   EQU 5       ; Size of the list
LIST        DCD 1, 2, 3, 4, 5  ; Example list
ARRAY       DCD 0	
	AREA list, CODE, READONLY
    ENTRY
    EXPORT main
                      


main
   
    LDR R0, =LIST
	LDR R7, =ARRAY
    
    ; Load the size of the list into R1
    MOV R1, #LIST_SIZE
    
    ; Initialize loop variables
    MOV R2, #0      
    MOV R3, #0      
    MOV R4, #4      
	MOV R7, #0
    
LOOP
    
    CMP R2, R1
    BEQ EXIT_LOOP  
    
    ; Load the current element into R5
    LDR R5, [R0, R3]
	
    
    ; Check if it Is the first element
    CMP R3, #0
    BEQ NOT_STORED  
    
    
	MOV R8, R5
	LDR R6, [R5, #0]
    STR R5, [R7, R3, LSL #2] 
	
	
    
NOT_STORED
    
    ADD R2, R2, #1
    ADD R3, R3, R4 
    
    
    B LOOP
    
EXIT_LOOP
    
    B END

END
    
    END
