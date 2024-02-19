	AREA Task1, CODE, READONLY
    ENTRY
	EXPORT main
; define the array of integers
arr	DCD 2, 3, 4, 5, 6, 7, 8, 9, 11, 13, 17, 19, 23, 29			
; define the prime function
; input: integer in r0
; output: 0 if not prime, non-zero if prime
prime    
	MOV r1, #2           ; initialize divisor to 2
	CMP r0, #1           ; check if input is 1
	BEQ not_prime        ; branch if input is 1
loop     
	CMP r0, r1           ; compare input to divisor
    BEQ is_prime         ; branch if input equals divisor
    MOV r2, #0           ; clear remainder register
    MOV r3, r0           ; copy input to working register
    SDIV r3, r3, r1      ; divide input by divisor
    MUL r3, r3, r1       ; multiply quotient by divisor
    SUB r2, r0, r3       ; calculate remainder
	CMP r2, #0           ; compare remainder to 0
	BEQ not_prime        ; branch if remainder is 0
	ADD r1, r1, #1       ; increment divisor
	B loop               ; repeat loop with new divisor
is_prime 
	MOV r0, #1          ; set return value to 1 (prime)
    BX lr               ; return to calling function
not_prime 
	MOV r0, #0         ; set return value to 0 (not prime)
    BX lr              ; return to calling function
	
main     
	MOV r4, #0           ; initialize array index to 0
    MOV r5, #10          ; set array size to 10
	LDR r7, =arr
	BL check_primes

check_primes
	CMP r4, r5           ; compare array index to size
    BEQ STOP      ; branch if array is complete
	LDR r0, [r7]		 ; reading array element
	ADD r7, r7, #4		 ; incrementing array position
	ADD r4, r4, #1       ; increment array index
	BL prime
	B check_primes       ; repeat loop with next integer
	
STOP B STOP
	END
    
	
