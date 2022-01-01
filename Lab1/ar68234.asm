; Author: Anvit Raju
; Date: 10/6/20

    .ORIG x3000
    
    LD R0, #12
    LDR R1, R0, #0
    LDR R2, R0, #1
    
    LD R3, #10
    AND R1, R1, R3 
    AND R2, R2, R3
    
    ADD R4, R1, R2
    
    NOT R5, R2
    ADD R5, R5, #1
    
    ADD R6, R1, R5
    
    STR R4, R0, #2
    STR R6, R0, #3
    
    HALT
    
    .FILL x3300
    .FILL x00FF

    .END
