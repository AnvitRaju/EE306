;Anvit Raju
;Date: 10/13/20

.ORIG x3000

LD R0, NUM1
LDR R1, R0, #0
LDR R2, R0, #1

LD R3, NUM2

;Clearing bits [15:8]
AND R1, R1, R3
AND R2, R2, R3

;Finding 2's complement
NOT R4, R2
ADD R4, R4, #1

;If statement with BRN
ADD R5, R1, R4
BRN OVER

;Storing R1 if R5 is Zero or Positive
STR R1, R0, #2
BRNZP SKIP

OVER 

;Storing R2 if R5 is negative
STR R2, R0, #2

SKIP

HALT

NUM1 .FILL x3300
NUM2 .FILL x00FF

.END