; Anvit Raju
; ar68234
; Lab 4
; 10/26/2020

; Create a histogram
; Calculate the range and mean of the credit hours

; 29 and below- 'F' (Freshman)
; 30-60 - 'S' (Sophomore)
; 61-90 - 'J' (Junior)
; Above 90 - 'G' (Senior)

; Bits [15:8] from x4000 to x4003 will constain ASCII codes for 'F', 'S', 'J', 'G'
; Bits [7:0] from x4000 to x4003 will contain the number of individuals in each interval

; If there are 0 individuals in the list, the range and mean should be set as -1 (xFFFF)
; If there is 1 individual in the list, both the highest and lowest number of credit hours will be same

.ORIG x3000

;Loading all ASCII values for F, S, J, G
LD R2, ASCII1
LD R3, ASCII2
LD R4, ASCII3
LD R5, ASCII4

;Storing ASCII values for F, S, J, G at x4000 - x4003
STI R2, TWO
STI R3, THREE
STI R4, FOUR
STI R5, FIVE

;Setting pointer to x4004
LD R0, POINTER

;Clearing R2, R3, R4, R5
AND R2, R2, #0
AND R3, R3, #0
AND R4, R4, #0
AND R5, R5, #0

LD R0, POINTER
LDR R1, R0, #0
LD R6, MASK
AND R1, R1, R6
BRZ ZEROELEMENTS

LOOP
;Putting the R0 data into R1
LDR R1, R0, #0

;Loading R6 with xFF00 to use as mask
LD R6, MASK

;Checking to see if R1 is 0
AND R1, R1, R6
BRZ FINISH

;If R1[15:8] is not 0, check to see if R1[7:0] < #30
NOT R6, R6
LDR R1, R0, #0
AND R1, R1, R6
ADD R7, R1, #-15
ADD R7, R7, #-15
ADD R1, R7, #0

;Check to see if R1 is negative
BRZP NEXT
;Add 1 to R2, Increment counter, loop back
ADD R2, R2, #1
ADD R0, R0, #1
BR LOOP

NEXT
;Check to see if R1[7:0] < #61
ADD R7, R1, #-15
ADD R7, R7, #-15
ADD R7, R7, #-1
ADD R1, R7, #0

BRZP NEXT2
;Add 1 to R3, Increment counter, loop back
ADD R3, R3, #1
ADD R0, R0, #1
BR LOOP

NEXT2
;Check to see if R1[7:0] < #91
ADD R7, R1, #-15
ADD R7, R7, #-15
ADD R1, R7, #0

BRZP NEXT3
;Add 1 to R4, Increment counter, loop back
ADD R4, R4, #1
ADD R0, R0, #1
BR LOOP

NEXT3
;Add 1 to R5, Increment counter, loop back
ADD R5, R5, #1
ADD R0, R0, #1
BR LOOP

;Store values and end program
FINISH

;Load back ASCII values
LD R0, ASCII1
LD R1, ASCII2
LD R6, ASCII3
LD R7, ASCII4

;Add ASCII values with contents stored in R2, R3, R4, R5
ADD R2, R0, R2
ADD R3, R1, R3
ADD R4, R6, R4
ADD R5, R7, R5

;Store R2, R3, R4, R5 in bits [7:0] of x4000 to x4003
STI R2, TWO
STI R3, THREE
STI R4, FOUR
STI R5, FIVE

;Adding everything into R5
ADD R3, R2, R3
ADD R4, R3, R4
ADD R5, R4, R5

;Masking
LD R7, MASK4
AND R5, R5, R7

;Set ppinter to x4004
LD R0, POINTER

;Call Max Subroutine
JSR MAX

;Shift R1 to left by 8 bits
ADD R1, R1, R1
ADD R1, R1, R1
ADD R1, R1, R1
ADD R1, R1, R1
ADD R1, R1, R1
ADD R1, R1, R1
ADD R1, R1, R1
ADD R1, R1, R1

;Call Min Subroutine
JSR MIN

;Set pointer to x6000 and store max + min there
LD R6, POINTER2
ADD R3, R1, R2
STR R3, R6, #0

;Set pointer to x4004
LD R0, POINTER
;Call Mean Subroutine
JSR MEAN
;Store Mean at x6001
LD R6, POINTER2
STR R1, R6, #1
BR ENDPROGRAM

ZEROELEMENTS 
        LD R4, NUM6
        LD R5, NEGONE
        STR R5, R4, #0
        STR R5, R4, #1
        BR ENDPROGRAM 
        ENDPROGRAM HALT


ASCII1 .FILL x4600
ASCII2 .FILL x5300
ASCII3 .FILL x4A00
ASCII4 .FILL x4700
TWO .FILL x4000
THREE .FILL X4001
FOUR .FILL x4002
FIVE .FILL x4003
POINTER .FILL x4004
MASK .FILL xFF00
POINTER2 .FILL x6000
MASK4 .FILL x00FF


MAX ;Save Registers
    ST R0, SAVE0
    ST R1, SAVE1
    ST R2, SAVE2
    ST R3, SAVE3
    ST R4, SAVE4
    ST R6, SAVE6
    
HERE2 LDR R1, R0, #0
      LD R6, MASK3
      AND R6, R1, R6
      BRZ GO
    
    LDR R2, R0, #1
    LD R6, MASK3
    AND R6, R2, R6
    BRNP PROCEED
    
    GO LD R6, MASK2
    AND R1, R1, R6
    
    RET

    PROCEED   
    LD R6, MASK2
    AND R4, R1, R6
    AND R6, R2, R6
    
    NOT R6, R6
    ADD R6, R6, #1
    ADD R6, R4, R6
    BRNZ FINISH2
      
    STR R1, R0, #1
    STR R2, R0, #0
      
    FINISH2
    ADD R0, R0, #1
    BR MAX
    
    ;Load Registers back
    LD R0, SAVE0
    LD R2, SAVE2
    LD R3, SAVE3
    LD R4, SAVE4
    LD R6, SAVE6
    
MIN ;Store Registers
    ST R0, SAVE10
    ST R1, SAVE11
    ST R2, SAVE12
    ST R3, SAVE13
    ST R4, SAVE14
    ST R6, SAVE16

LD R0, NUM2 

HERE 
     LDR R1, R0, #0
     LDR R2, R0, #1
    
    LD R6, MASK3
    
    AND R6, R2, R6
    BRNP PROCEED2
    
    ADD R2, R1, #0
    LD R6, MASK2
    AND R2, R2, R6
    
    ;Load Registers back
    LD R0, SAVE10
    LD R1, SAVE11
    LD R3, SAVE13
    LD R4, SAVE14
    LD R6, SAVE16
    
    RET

    PROCEED2 
    LD R6, MASK2
    
    AND R4, R1, R6
    AND R6, R2, R6
    
    NOT R6, R6
    ADD R6, R6, #1
    ADD R6, R4, R6
    BRZP PROCEED3
    
    STR R1, R0, #1
    STR R2, R0, #0
    
    PROCEED3 
    ADD R0, R0, #1
    BR HERE

MEAN    ;Store Registers
        ST R0, SAVEA
        ST R1, SAVEB
        ST R2, SAVEC
        ST R3, SAVED
        ST R4, SAVEE
        ST R5, SAVEF
        ST R6, SAVEG
        
        ADD R2, R5, #0
        AND R3, R3, #0
        
        LD R0, NUM2
        
        REPEAT 
        LDR R4, R0, #0
        LD R6, MASK2
        
        AND R4, R4, R6
        ADD R3, R3, R4
        
        ADD R0, R0, #1
        ADD R2, R2, #-1
        BRP REPEAT

        AND R1, R1, #0
        
        NOT R6, R5
        ADD R6, R6, #1

        GO3 ADD R3, R3, R6
        BRN DONE
        ADD R1, R1, #1
        BR GO3
        
        ;Load Registers back
        LD R0, SAVEA
        LD R2, SAVEC
        LD R3, SAVED
        LD R4, SAVEE
        LD R5, SAVEF
        LD R6, SAVEG

        DONE RET
        

NUM1 .FILL x4000
NUM2 .FILL x4004
MASK2 .FILL x00FF
NUM6 .FILL x6000
MASK3 .FILL xFF00
SAVE0 .FILL x5000
SAVE1 .FILL x0
SAVE2 .FILL x0
SAVE3 .FILL x0
SAVE4 .FILL x0
SAVE6 .FILL x0
SAVE10 .FILL x0
SAVE11 .FILL x0
SAVE12 .FILL x0
SAVE13 .FILL x0
SAVE14 .FILL x0
SAVE16 .FILL x0
SAVEA .FILL x0
SAVEB .FILL x0
SAVEC .FILL x0
SAVED .FILL x0
SAVEE .FILL x0
SAVEF .FILL x0
SAVEG .FILL x0
NEGONE .FILL xFFFF

.END