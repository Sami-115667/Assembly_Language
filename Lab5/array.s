	AREA Task1, CODE, READONLY
	ENTRY
	EXPORT main
; define the array of integers
arr DCD 1,2,3,4,5,6,7,8,9,10              

main     
    ; Load the base address of the array into r0
    LDR r0, =arr
    ; Load the first value of the array into r1
    LDR r1, [r0]
    ; Move to the next address after the first integer
    ADD r0, r0, #4
    ; Load the last value of the array into r2
    LDR r2, [r0]
    ; Load the base address of the array into r3
    LDR r3, =arr
    ; Initialize r4 to 0 (to store sum of array elements)
    MOV r4, #0
    ; Initialize r5 to 0 (to use as a loop counter)
    MOV r5, #0
    
loop
    ; Load the value of the current element into r6
    LDR r6, [r3]
    ; Add the current element to the sum (r4)
    ADD r4, r4, r6
    ; Move to the next element in the array
    ADD r3, r3, #4
    ; Increment the loop counter
    ADD r5, r5, #1
    ; Compare the loop counter with the length of the array (10)
    CMP r5, #10
    ; If the loop counter is not yet 10, continue looping
    BNE loop

; End of loop

STOP B STOP
END
