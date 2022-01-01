; EE306 Lab6 Testcase 3
;   3 elements in main room(XY123, AK378, AK379). 2 elements in waiting room(XY124, PQ567) 
;       - Check for XY124
;       - Check for XY123


; Main list 
    ;   Nodes

    ; Head node pointer - address of head
    .ORIG x4000
        .FILL x4002 ; pointer to first node
    .END 

    ; First node 
    .ORIG x4002
        .FILL x4004 ; pointer to second node
        .FILL x4800 ; XY123
    .END 

    ; Second node 
    .ORIG x4004
        .FILL x4006 ; pointer to third node
        .FILL x4806 ; AK378
    .END 

    ; Third node 
    .ORIG x4006
        .FILL x0000 ; null 
        .FILL x480C ; AK379
    .END 


    ; Strings 

    ; String 1 : XY123
    .ORIG x4800
        .STRINGZ "XY123"
    .END 

    ; String 2 : AK378
    .ORIG x4806
        .STRINGZ "AK378"
    .END

    ; String 3 : AK379 
    .ORIG x480C
        .STRINGZ "AK379"
    .END


; Waiting List 
    ;   Nodes

    ; Head node pointer - address of head
    .ORIG x4001
        .FILL x5000 ; pointer to first node
    .END 

    ; First node 
    .ORIG x5000
        .FILL xF000 ; pointer to second node
        .FILL x5002 ; XY124
    .END 

    ; Second node
    .ORIG xF000
        .FILL x0000 ; null 
        .FILL xEF00 ; PQ567
    .END


    ; Strings 

    ; String 1 : XY124
    .ORIG x5002
        .STRINGZ "XY124"
    .END 
    
    ; String 2 : PQ567 
    .ORIG xEF00
        .STRINGZ "PQ567"
    .END





; Output Expectation

; Example 1:
; Console:
;   Type EID and press Enter: XY124
;   XY124 is added to the main room.
;
;   -----Halting the processor -----
; Note: The node containing XY124 should be deleted from the waiting room linked list and inserted in the main room linked list

; Example 2:
; Console:
;   Type EID and press Enter: XY123
;   XY123 is already in the main room.
;
;   -----Halting the processor ----
; Note: The main room and waiting linked list should be unchanged after this input

