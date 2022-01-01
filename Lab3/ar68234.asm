; Write a program in LC-3 assembly language to sort a list of students and the number of credit hours they completed
; Bits[15:8] - Unique ID, Bits [7:0] - Credit Hours Completed
; Sort credit hours in ascending order along with corresponding unique IDs 
; Sorted list starts at x4004
; Needs to be terminated with null ID

.ORIG x3000

; Load pointers at x4004 and x4005
LD R0, NUM1 ; Outer Loop Pointer
LD R1, NUM2 ; Inner Loop Pointer
LD R5, CHECK ; Mask with xFF00

BACK LDR R2, R0, #0 ;Put R0 data into R2

AND R6, R2, R5 ; AND With mask xFF00 to check if R2[15:8] = 0

BRZ STOP ; Checks if R5 is 00

BACK2 LDR R2, R0, #0 
LDR R3, R1, #0 ; Put R1 data into R3
AND R6, R3, R5 ; AND with mask xFF00 to check if R3[15:8] = 0
; When I run my code, why is R5 always going to 0 with every test case
BRZ INCREMENTR1R2 ; Checks if R3[15:8]is 

JSR COMPARE ; Call subroutine COMPARE

; If it should be swapped, Mem[R1] = R2
; If it should not be swapped, Increment R1 by 1, and loop back to Label STOP

ADD R4, R4, #0 ;Checking if R4 is 0
BRZ INCREMENTR1 ;If it is 0 go to IncrementR1

STR R3, R0, #0
STR R2, R1, #0

INCREMENTR1 
ADD R1, R1, #1 ;Increment R1, inner loop pointer by 1

BRNZP BACK2

INCREMENTR1R2 ADD R0, R0, #1 ;Increment R0 and R1, inner loop counter and outer loop counter
ADD R1, R0, #1

BRNZP BACK

STOP HALT

NUM1 .FILL x4004
NUM2 .FILL x4005
CHECK .FILL xFF00

; The subroutine named "COMPARE" checks if R2 and R3 should be swapped

COMPARE

; Save Registers
ST R2, SAVER2
ST R3, SAVER3
ST R5, SAVER5
ST R6, SAVER6
ST R7, SAVER7

AND R4, R4, #0 ; Clear register R4

LD R7, MASK ; Load x00FF into R7
;Clear bits [15:8] of R2 and R3 and store back into R5 and R6 respectively
AND R5, R2, R7
AND R6, R3, R7

;Find difference with 2's complement
NOT R6, R6
ADD R6, R6, #1
ADD R5, R5, R6

BRP CHECKPOS ; Check if R5 is positive
BR RESTOREVALUES

CHECKPOS ; Set R4 = 1
ADD R4, R4, #1 

RESTOREVALUES ;Restoring is same as LD right?
LD R2, SAVER2
LD R3, SAVER3
LD R5, SAVER5
LD R6, SAVER6
LD R7, SAVER7

RET

SAVER2 .FILL x0
SAVER3 .FILL x0
SAVER5 .FILL x0
SAVER6 .FILL x0
SAVER7 .FILL x0
MASK .FILL x00FF

.END