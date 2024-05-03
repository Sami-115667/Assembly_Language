    AREA Task2, CODE, READONLY
    ENTRY
    EXPORT main

; Define the 2D arrays for matrix1, matrix2, and result_matrix
matrix1 DCD 1,2,3,4,5,6,7,8,9  ; Example matrix 1 (3x3)
matrix2 DCD 9,8,7,6,5,4,3,2,1  ; Example matrix 2 (3x3)
result_matrix DCD 0,0,0,0,0,0,0,0,0  ; Resulting matrix (3x3)

main
    LDR R0, =matrix1      ; Load the base address of matrix1 into R0
    LDR R1, =matrix2      ; Load the base address of matrix2 into R1
    LDR R7, =result_matrix  ; Load the base address of result_matrix into R7
    MOV R2, #3            ; Number of rows in matrix1/matrix2
    MOV R3, #3            ; Number of columns in matrix2
    MOV R4, #0            ; Initialize R4 to hold the calculated offset for matrix1
    MOV R5, #0            ; Initialize R5 to hold the calculated offset for matrix2
    MOV R6, #0            ; Initialize R6 to hold the calculated offset for result_matrix
	MOV R8, #4

matrix_multiplication_loop
    MOV R5, #0            ; Reset R5 for each column of matrix2
column_loop
    MOV R6, #0            ; Reset R6 for each element of result_matrix
    MUL R4, R2, R5        ; Calculate the offset for the corresponding row of matrix1
    MUL R5, R3, R6        ; Calculate the offset for the corresponding column of matrix2
    MUL R6, R4, R8        ; Multiply the offset by 4 to account for each element being 4 bytes (assuming integers)
    ADD R6, R6, R7        ; Add the base address of result_matrix to the offset
	LDR R7, [R6]

    ; Perform matrix multiplication for the current element of result_matrix
    ; You need to write the code to multiply corresponding row of matrix1 with corresponding column of matrix2
    ; and sum up the products to get the final value of the element in result_matrix

    ; Update loop counters
    ADD R5, R5, #1        ; Increment column index
    CMP R5, R3            ; Compare column index with number of columns in matrix2
    BNE column_loop       ; Branch back to column_loop if not equal

    ADD R4, R4, #1        ; Increment row index
    CMP R4, R2            ; Compare row index with number of rows in matrix1
	
    BNE matrix_multiplication_loop  ; Branch back to matrix_multiplication_loop if not equal

    ; At this point, result_matrix should contain the result of matrix multiplication

STOP  B STOP
    END
