	AREA Task5, CODE, READONLY
    ENTRY
    EXPORT main

; Define BCD data
bcd_data    DCB 0x12, 0x34, 0x56, 0x78  ; Example BCD data
size        EQU 4                        ; Number of BCD digits

main
    LDR R0, =bcd_data      ; Load the base address of the BCD data into R0
    MOV R1, #size          ; Number of BCD digits
    MOV R2, #0             ; Initialize loop counter
    
convert_loop
    CMP R2, R1             ; Compare loop counter with size
    BEQ end_convert       ; If loop counter equals size, exit loop
    
    LDRB R3, [R0, R2]     ; Load BCD digit into R3
    
    ; Convert BCD to binary
    AND R4, R3, #0x0F      ; Extract lower nibble (least significant digit)
    LSR R3, R3, #4         ; Shift right to get upper nibble (most significant digit)
    LDR R5, =10            ; Load 10 into R5 for multiplication
    MUL R3, R3, R5         ; Multiply upper nibble by 10
    ADD R4, R4, R3         ; Add lower nibble to the result
    
    ; Store binary result (BCD converted to binary) back into bcd_data
    STRB R4, [R0, R2]     
   
    ADD R2, R2, #1         ; Increment loop counter
    B convert_loop         ; Repeat loop
    
end_convert
    ; Conversion complete

STOP  B STOP
    END
