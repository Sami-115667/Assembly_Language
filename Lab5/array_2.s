    AREA Task1, CODE, READONLY
    ENTRY
    EXPORT main

; Define the array of integers
arr     DCD 1,2,3,4,5,6,7,8,9,10

main
    ; Load the base address of the array into r0
    LDR r0, =arr
    ; Load the base address of the array into r1
    LDR r1, =arr
    ; Calculate the address of the last element of the array
    ADD r1, r1, #40   ; 10 integers * 4 bytes each = 40 bytes
    ; Initialize r2 to 0 (to be used as a loop counter)
    MOV r2, #0
    ; Initialize r4 to 0 (to store the maximum value found in the array)
    MOV r4, #0

loop
    ; Store the value at the current memory location pointed to by r0 into the memory location pointed to by r1
    STR r0, [r1]
    ; Load the value from the memory location pointed to by r1 into r3
    LDR r3, [r1]
    ; Compare the value in r3 with the current maximum value stored in r4
    CMP r3, r4
    ; If r3 is greater than the current maximum value, update r4 with the new maximum value
    MOVGT r4, r3
    ; Move to the next element in the array (increment r0 by 4 bytes)
    ADD r0, r0, #4
    ; Move to the previous element in the array (decrement r1 by 4 bytes)
    SUB r1, r1, #4
    ; Increment the loop counter
    ADD r2, r2, #1
    ; Compare the loop counter with 10 (number of elements in the array)
    CMP r2, #10
    ; If the loop counter is not equal to 10, continue looping
    BNE loop

STOP B STOP
END
