	AREA Task4, CODE, READONLY
	ENTRY
	EXPORT main

; Define the data bytes
DATA_BYTES  DCB 0x12, 0x34, 0x56, 0x78  ; Define four data bytes

main
    ; Load the data bytes into registers
    LDR R4, =DATA_BYTES       ; Load the address of the first data byte into R4
    LDRB R4, [R4]             ; Load the first data byte into R4
    LDRB R5, [R4, #1]         ; Load the second data byte into R5
    LDRB R6, [R4, #2]         ; Load the third data byte into R6
    LDRB R7, [R4, #3]         ; Load the fourth data byte into R7
    
    ; Add all data bytes
    ADDS R5, R5, R4           ; Add the first and second data bytes, R5 = R5 + R4
    ADC R5, R5, R6            ; Add the third data byte with carry, R5 = R5 + R6 + carry
    ADC R5, R5, R7            ; Add the fourth data byte with carry, R5 = R5 + R7 + carry
    
STOP  B STOP
	END
