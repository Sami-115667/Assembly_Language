	AREA Task8, CODE, READONLY
    ENTRY
    EXPORT main

; Define constants
SIZE            EQU 3               ; Number of records (byte triplets)
RECORD_SIZE     EQU 3               ; Size of each record (byte triplet)

; Define source and destination arrays
source_array        DCD 0x112233, 0x445566, 0x778899
destination_array   SPACE SIZE*4      ; Destination array to store the largest bytes

main
    LDR R0, =source_array          ; Load the base address of the source array into R0
    LDR R1, =destination_array     ; Load the base address of the destination array into R1
    
    MOV R2, #SIZE                  ; Number of records to process
    MOV R3, #0                     ; Initialize loop counter
    
process_loop
    CMP R3, R2                     ; Compare loop counter with the number of records
    BEQ end_process                ; If loop counter equals number of records, exit loop
    
    ; Load the current record (byte triplet) into R4
    LDR R4, [R0, R3, LSL #2]      
    
    ; Extract the three bytes from the record
    MOV R5, R4, LSR #16            ; Extract the most significant byte
    MOV R6, R4, LSR #8             ; Extract the middle byte
    AND R6, R6, #0xFF              ; Mask out any extra bits
    AND R7, R4, #0xFF              ; Extract the least significant byte
    
    ; Compare the three bytes to find the largest
    CMP R5, R6                     ; Compare R5 with R6
    MOVGT R8, R5                   ; If R5 > R6, set R8 = R5
    MOVLE R8, R6                   ; If R5 <= R6, set R8 = R6
    
    CMP R8, R7                     ; Compare R8 with R7
    MOVGT R8, R8                   ; If R8 > R7, set R8 = R8
    MOVLE R8, R7                   ; If R8 <= R7, set R8 = R7
    
    ; Store the largest byte in the destination array
    STRB R8, [R1, R3]              ; Store R8 in destination_array[R3]
    
    ADD R3, R3, #1                 ; Increment loop counter
    B process_loop                 ; Repeat loop
    
end_process
    ; Processing complete

STOP  B STOP
    END
