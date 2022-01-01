; OPERATING SYSTEM CODE

.ORIG x500
        
        LD R0, VEC
        LD R1, ISR
        ; (1) Initialize interrupt vector table with the starting address of ISR.
        STR R1, R0, #0

        ; (2) Set bit 14 of KBSR. [To Enable Interrupt]
        LDI R0, KBSR
        LD R1, MASK
        
        AND R0, R0, R1
        NOT R1, R1
        ADD R0, R0, R1
        
        STI R0, KBSR
	

        ; (3) Set up system stack to enter user space. So that PC can return to the main user program at x3000.
    	; R6 is the Stack Pointer. Remember to Push PC and PSR in the right order. Hint: Refer State Graph
    	LD R0, PSR
    	ADD R6, R6, #-1
    	STR R0, R6, #0
    	
    	LD R0, PC
    	ADD R6, R6, #-1
    	STR R0, R6, #0

        ; (4) Enter user Program.
        RTI
        
VEC     .FILL x0180
ISR     .FILL x1700
KBSR    .FILL xFE00
MASK    .FILL xBFFF
PSR     .FILL x8002
PC      .FILL x3000

.END

; INTERRUPT SERVICE ROUTINE

.ORIG x1700
ST R0, SAVER0
ST R1, SAVER1
ST R2, SAVER2
ST R3, SAVER3
ST R7, SAVER7

; CHECK THE KIND OF CHARACTER TYPED AND PRINT THE APPROPRIATE PROMPT

        LDI R1, KBDR
        LD R2, ASCII_UC

        ADD R3, R1, R2
        BRN NOTUP
    
        ADD R3, R3, #-16
        ADD R3, R3, #-9
        BRP NOTUP

        LEA R0, STRING1
GO      LDR R2, R0, #0
        BRZ end
POLL    LDI R7, DSRPTR
        BRZP POLL
        STI R2, DDRPTR
        ADD R0, R0, #1
        BR GO

NOTUP   LD R2, ASCII_LC

        ADD R3, R1, R2
        BRN NOTLOW

        ADD R3, R3, #-16
        ADD R3, R3, #-9
        BRP NOTLOW

        LEA R0, STRING2
BACK    LDR R2, R0, #0
        BRZ end
POLL1   LDI R7, DSRPTR
        BRZP POLL1
        STI R2, DDRPTR
        ADD R0, R0, #1
        BR BACK

NOTLOW  LD R2, ASCII_NUM

        ADD R3, R1, R2
        BRN ELSE

        ADD R3, R3, #-9
        BRP ELSE

        LEA R0, STRING3
DOAGAIN LDR R2, R0, #0
        BRZ end
POLL2   LDI R7, DSRPTR
        BRZP POLL2
        STI R2, DDRPTR
        ADD R0, R0, #1
        BR DOAGAIN

ELSE    LEA R0, STRING4
DOREP   LDR R2, R0, #0
        BRZ end2
POLL3   LDI R7, DSRPTR
        BRZP POLL3
        STI R2, DDRPTR
        ADD R0, R0, #1
        BR DOREP

end2    HALT

end LD R0, SAVER0
    LD R1, SAVER1
    LD R2, SAVER2
    LD R3, SAVER3 
    LD R7, SAVER7
    RTI

ASCII_NUM .FILL x-30
ASCII_LC  .FILL x-61
ASCII_UC  .FILL x-41
KBDR .FILL xFE02
DSRPTR .FILL xFE04
DDRPTR .FILL xFE06
STRING1 .STRINGZ "\nPractice Social Distancing\n"
STRING2 .STRINGZ "\nWash your Hands frequently\n"
STRING3 .STRINGZ "\nStay Home, Stay Safe\n"
STRING4 .STRINGZ "\n ---------- END OF EE306 LABS -------------\n"
SAVER0 .BLKW x1
SAVER1 .BLKW x1
SAVER2 .BLKW x1
SAVER3 .BLKW x1
SAVER7 .BLKW x1
.END

; USER PROGRAM

.ORIG x3000

; MAIN USER PROGRAM
; PRINT THE MESSAGE "WHAT STARTS HERE CHANGES THE WORLD" WITH A DELAY LOGIC
REPEAT  LEA R0, MESSAGE
        PUTS
        LD R1, CNT
AGAIN   ADD R1, R1, #-1
        BRNP AGAIN
        BR REPEAT

CNT .FILL xFFFF
MESSAGE .STRINGZ  "WHAT STARTS HERE CHANGES THE WORLD\n"
.END