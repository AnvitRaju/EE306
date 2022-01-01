; EE306 Lab6 Testcase 2
;   Empty main room, 1 element(XY123) in waiting room. 
;     - Check for XY123


; Main list 
    ;   Nodes

    ; Head node pointer - address of head
    .ORIG x4000
        .FILL x0000 ; empty main room
    .END 

; Waiting List 
    ;   Nodes

    ; Head node pointer - address of head
    .ORIG x4001
        .FILL x5000 ; pointer to first node
    .END 

    ; First node 
    .ORIG x5000
        .FILL x0000 ; null 
        .FILL x5002 ; XY123
    .END 


    ; Strings 

    ; String 1 : XY123
    .ORIG x5002
        .STRINGZ "XY123"
    .END 


; Garbage data 
    ; Strings 

    ; String 1 : XY123
    .ORIG x4800
        .STRINGZ "XY123"
    .END 

    ; String 2 : AB789
    .ORIG x4806
        .STRINGZ "AB789"
    .END

    ; String 3 : PQ567 
    .ORIG x480C
        .STRINGZ "PQ567"
    .END



; Output Expectation

; Example 1:
; Console:
;   Type EID and press Enter: XY123
;   XY123 is added to the main room.
;
;   -----Halting the processor -----
; Note: The node containing XY123 should be deleted from the waiting room linked list and inserted in the main room linked list

; Example 2: 
; Console:
;   Type EID and press Enter: AB789
;   The entered EID does not match.
;
;   -----Halting the processor ----
; Note: The main room and waiting linked list should be unchanged after this input
