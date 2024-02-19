; 1. Write a simple program to calculate: P = Q + R + S. Let Q = 2, R = 4, S = 5. Assume that r1 = Q, r2 = R, r3 = S. The result P will go in r0.
; 2. Write a simple program to calculate: P = Q - R . Assume that r1 = Q, r2 = R, and Q¿R. The result P will go in r0.
; 3. Write a simple program to calculate: P = Q - R- S. Let Q = 12, R = 4, S = 5. Assume that r1 = Q, r2 = R, r3 = S. The result P will go in r0.
; 4. Write a simple program to calculate: P = Q x R . The result P will go in r0.
; 5. This problem is same as the problem 1. W = X + Y + Z . Once again, let X = 9, Y = 8, Z = 5 and we assume that r4 = X, r3 = Y, r2 = Z. In this case, you will put the data inmemory in the form of constants before the program runs.
	
		AREA EXAMPLE, CODE, READONLY
        ENTRY
		EXPORT main

; Define constants
Q   EQU 2
R   EQU 4
S   EQU 5
X   EQU 9
Y   EQU 8
Z   EQU 5
main
        ; Problem 1: P = Q + R + S
        LDR r1, =Q      			; Load Q into r1
        LDR r2, =R      			; Load R into r2
        LDR r3, =S      			; Load S into r3
        ADD r0, r1, r2  			; P = Q + R
        ADD r0, r0, r3  			; P = P + S
        ; Result is in r0

        ; Problem 2: P = Q - R
        LDR r1, =Q      			; Load Q into r1
        LDR r2, =R      			; Load R into r2
        SUB r0, r1, r2  			; P = Q - R
        ; Result is in r0

        ; Problem 3: P = Q - R - S
        LDR r1, =Q      			; Load Q into r1
        LDR r2, =R      			; Load R into r2
        LDR r3, =S      			; Load S into r3
        SUB r0, r1, r2  			; P = Q - R
        SUB r0, r0, r3  			; P = P - S
        ; Result is in r0

        ; Problem 4: P = Q x R
        LDR r1, =Q      			; Load Q into r1
        LDR r2, =R      			; Load R into r2
        MUL r0, r1, r2  			; P = Q x R
        ; Result is in r0

        ; Problem 5: W = X + Y + Z
        LDR r4, =X      ; Load X into r4
        LDR r3, =Y      ; Load Y into r3
        LDR r2, =Z      ; Load Z into r2
        ADD r0, r4, r3  ; W = X + Y
        ADD r0, r0, r2  ; W = W + Z
        ; Result is in r0
STOP  B STOP
        END
