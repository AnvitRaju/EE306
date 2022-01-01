; EE306 Lab5 Testcase 3
; Same input as lab document 


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
    .FILL x4806 ; AB789
.END 

; Third node
.ORIG x4006
    .FILL x0000 ; null
    .FILL x480C ; PQ567
.END 


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
;   Type EID and press Enter: MN483
;   MN483 is not in the main room.
;
;   -----Halting the processor -----

; Example 2: 
; Console:
;   Type EID and press Enter: AB789
;   AB789 is already in the main room.
;
;   -----Halting the processor ----

; Example 3:
; Console:
;   Type EID and press Enter: XY123
;   XY123 is already in the main room.
;
;   -----Halting the processor -----




