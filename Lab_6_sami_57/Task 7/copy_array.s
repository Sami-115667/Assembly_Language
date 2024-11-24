	AREA Task5, CODE, READONLY
    ENTRY
    EXPORT main

; Define source and destination arrays
source_array    DCD 0x11223344, 0x55667788  ; Example source array with 8 bytes of data
destination_array   SPACE 8                   ; Destination array with space for 8 bytes

main
    LDR R0, =source_array      ; Load the base address of the source array into R0
    LDR R1, =destination_array ; Load the base address of the destination array into R1
    
    MOV R2, #8                 ; Number of bytes to copy
    MOV R3, #0                 ; Initialize loop counter
          
copy_loop
    CMP R3, R2                 ; Compare loop counter with the number of bytes
    BEQ end_copy               ; If loop counter equals number of bytes, exit loop
    
    LDR R4, [R0, R3]           ; Load a word (4 bytes) from the source array into R4
    STR R4, [R1, R3]           ; Store the word into the destination array
    
    ADD R3, R3, #4             ; Increment loop counter by 4 bytes (word size)
    B copy_loop                ; Repeat loop
    
end_copy
    ; Copy complete

STOP  B STOP
    END
