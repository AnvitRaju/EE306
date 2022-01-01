; OPERATING SYSTEM CODE

.ORIG x500
        
        LD R0, VEC
        LD R1, ISR
        ; (1) Initialize interrupt vector table with the starting address of ISR.


        ; (2) Set bit 14 of KBSR. [To Enable Interrupt]

	

        ; (3) Set up system stack to enter user space. So that PC can return to the main user program at x3000.
	; R6 is the Stack Pointer. Remember to Push PC and PSR in the right order. Hint: Refer State Graph



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






CNT .FILL xFFFF
MESSAGE .STRINGZ  "WHAT STARTS HERE CHANGES THE WORLD\n"
.END