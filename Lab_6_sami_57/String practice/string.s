	AREA Task5, CODE, READONLY
    ENTRY
    EXPORT main

; Define constants for SWI numbers
SYS_WRITE   EQU 4      ; SWI number for writing to standard output
STDOUT      EQU 1      ; File descriptor for standard output (console)

main
    ; Load the address of the string into a register
    LDR R0, =string
    
    ; Iterate over each character of the string
loop:
    LDRB R1, [R0], #1 ; Load a byte (character) from memory and increment the pointer
    CMP R1, #0        ; Check if it's the null terminator
    BEQ end_loop      ; If it is, exit the loop
    
    ; Display the ASCII value of the character
    MOV R2, R1        ; Move the character to R2
    MOV R0, #STDOUT   ; File descriptor for standard output
    MOV R7, #SYS_WRITE; SWI number for writing
    SWI 0             ; Call the operating system to write the character's ASCII value
    MOV R0, #32       ; ASCII value for space character
    MOV R7, #SYS_WRITE; SWI number for writing
    SWI 0             ; Call the operating system to write a space character
    B loop            ; Repeat for the next character

end_loop:
    ; End of program

    END

; Data section
string DCB "sami", 0     ; Null-terminated string "sami"
