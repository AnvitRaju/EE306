;Anvit Raju
;ar68234
;Lab 6
;Write a program that creates a user interface to move students in the waiting room to the main room

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

BRZ NEXTCHECK
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

NEXTCHECK ;START HERE LAB6

;Set Head pointer to x4001 
LD R0, HEADPTR
LDR R5, R0, #0
LOOP4
BRZ NOMATCH2
LDR R1, R5, #1

;Check if there is a match
JSR MATCH

ADD R4, R4, #0
BRZ NOMATCH3

;(Delete node from waiting room list)

;Load R1 with pointer to node pointer of node that needs to be deleted 
ADD R1, R0, #0

;Load R2 with pointer to node that needs to be deleted
LDR R2, R1, #0

;R3 <-- mem[R2]
LDR R3, R2, #0

;mem[R1] <-- R3
STR R3, R1, #0

;(Insert node to the front of the main room list)

;Load R2 with pointer to node that needs to be inserted

;Load R0 with current head pointer
LDI R0, POINTER

;mem[R2] <-- R0
STR R0, R2, #0

;mem[x4000] <-- R2
LD R5, POINTER
STR R2, R5, #0

;(Display the message, "<EID> is added to the main room.")
LEA R1, LABEL
REPEAT3
LDR R0, R1, #0
OUT
ADD R1, R1, #1
ADD R0, R0, #0
BRNP REPEAT3
LEA R0, ADDED
PUTS
BR FINISH

NOMATCH2
LEA R0, NONE
PUTS
BR FINISH

NOMATCH 
LDR R0, R0, #0 
BR LOOP3 

NOMATCH3
LDR R5, R5, #0 
BR LOOP4


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

;Perform callee restore
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
HEADPTR .FILL x4001
NEGENTER .FILL x-0A
NOUTPUT .STRINGZ " is not in the main room."
YOUTPUT .STRINGZ " is already in the main room."
NONE .STRINGZ "The entered EID does not match."
ADDED .STRINGZ " is added to the main room."
SAVE1 .FILL x0
SAVE2 .FILL x0
SAVE5 .FILL x0
SAVE6 .FILL x0
SAVE4 .FILL x0
RAN .FILL x4002

.END