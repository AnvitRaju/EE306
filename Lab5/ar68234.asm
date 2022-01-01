;Anvit Raju
;ar68234
;Lab 5
;Write a program to determine if a student EID matches a list of student EIDs

.ORIG x3000

;Prompt user to enter EID
LEA R0, PROMPT
PUTS

;Load R1 to reserved block of memory containing user's EID
LEA R1, LABEL

;Load -(ascii for enter)
LD R2, NEGENTER

LOOP1
;Read character that user types
GETC
;Check if character types is Enter (x0A)
ADD R3, R0, R2
OUT
BRZ DONE
;Mem[R1] <-- R0
STR R0, R1, #0
;R1 <-- R1 + 1
ADD R1, R1, #1
BR LOOP1

DONE ;Store Null in Mem[R1]
     AND R2, R2, #0
     STR R2, R1, #0

;Setting pointer to x4000
LDI R0, POINTER 

LOOP3

BRZ NULL
LDR R1, R0, #1

JSR MATCH

;Check if R4 = 0 (no match) or R4 = 1 (match)
ADD R4, R4, #0
BRZ NOMATCH

;Display message <EID> is already in the main room
LEA R1, LABEL
REPEAT
LDR R0, R1, #0
OUT
ADD R1, R1, #1
ADD R0, R0, #0
BRNP REPEAT
LEA R0, YOUTPUT
PUTS
BR FINISH

NULL ;Display message <EID> is not in the main room
     LEA R1, LABEL
     AGAIN
     LDR R0, R1, #0
     OUT
     ADD R1, R1, #1
     ADD R0, R0, #0
     BRNP AGAIN
     LEA R0, NOUTPUT
     PUTS
     BR FINISH

NOMATCH
LDR R0, R0, #0 
BR LOOP3

FINISH HALT

MATCH

;Perform callee save of registers
ST R1, SAVE1
ST R2, SAVE2
ST R5, SAVE5
ST R6, SAVE6
ST R4, SAVE4

;Set R2 to point to reserved 6 word eid location
LEA R2, LABEL

LOOP2
;Store contents of R1 into R5
LDR R5, R1, #0

;Store contents of R2 into R6
LDR R6, R2, #0

;Check if R6 = 0?
ADD R6, R6, #0
BRZ PROCEED

;If R6 does not = 0, then do R5 <-- R5 - R6 to check if R5 is 0
NOT R6, R6
ADD R6, R6, #1
ADD R5, R5, R6
BRZ ZERO

;If R5 does not = 0, then set R4 = 0
AND R4, R4, #0
BR SKIP

;If R5 is 0, increment R1 and R2, then loop back to after callee save
ZERO
ADD R1, R1, #1
ADD R2, R2, #1
BR LOOP2

;If R6 = 0, set R4 to 1
PROCEED
AND R4, R4, #0
ADD R4, R4, #1

;Perform callee resore
SKIP
LD R1, SAVE1
LD R2, SAVE2
LD R5, SAVE5
LD R6, SAVE6

;Return back to main program
RET

PROMPT .STRINGZ "Type EID and press Enter: "
LABEL .BLKW #6
POINTER .FILL x4000
NEGENTER .FILL x-0A
NOUTPUT .STRINGZ " is not in the main room"
YOUTPUT .STRINGZ " is already in the main room"
SAVE1 .FILL x0
SAVE2 .FILL x0
SAVE5 .FILL x0
SAVE6 .FILL x0
SAVE4 .FILL x0

.END