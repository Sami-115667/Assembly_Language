	AREA Task3, CODE, READONLY
    ENTRY
    EXPORT main

arr     DCD 4, 3, 2, 1, 5     ; Example array of numbers
size    EQU 5                  ; Number of elements in the array

main
    LDR R0, =arr               ; Load the base address of the array into R0
    LDR R0, [R0]               ; Load the value stored at the address into R0

    MOV R1, #size              ; Number of elements in the array
    MOV R2, #0                 ; Initialize loop counter (i)
    MOV R3, #0                 ; Flag to check if any swap occurred
    MOV R4, #0                 ; Temporary register for swapping
    
outer_loop
    MOV R3, #0                 ; Reset the swap flag for each iteration
    MOV R2, #0                 ; Reset the loop counter for each iteration
    
inner_loop
    CMP R2, R1                 ; Compare loop counter with array size
    BEQ end_sort               ; If loop counter equals array size, exit loop
    LDR R5, [R0, R2, LSL #2]   ; Load current element (arr[i]) into R5
    LDR R6, [R0, R2, LSL #2]   ; Load current element (arr[i]) into R6
    
    ADD R7, R2, #1             ; Calculate index of next element (i+1)
    LDR R6, [R0, R7, LSL #2]   ; Load next element (arr[i+1]) into R6
    
    CMP R5, R6                 ; Compare current element with next element
    BLE not_swap               ; If current element <= next element, skip swap
    STR R6, [R0, R2, LSL #2]   ; Swap current and next elements
    STR R5, [R0, R7, LSL #2]   ; Store the current element to the next position
    MOV R3, #1                 ; Set swap flag to indicate a swap occurred
    
not_swap
    ADD R2, R2, #1             ; Increment loop counter (i)
    B inner_loop               ; Repeat inner loop
    
end_sort
    CMP R3, #1                 ; Check if any swap occurred in the last pass
    BEQ outer_loop             ; If a swap occurred, repeat the sorting process
    ; If no swap occurred, the array is sorted in ascending order
    LDR R0, =arr               ; Load the base address of the array into R0
    LDR R0, [R0] 	
STOP  B STOP
    END
