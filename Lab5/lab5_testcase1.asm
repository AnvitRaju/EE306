; EE306 Lab5 Testcase 3
; Two element list 


;   Nodes

; Head node pointer - address of head
.ORIG x4000
    .FILL x5002 ; pointer to first node
.END 

; First node 
.ORIG x5002
    .FILL x5004 ; pointer to second node
    .FILL x4200 ; XY123
.END 

; Second node 
.ORIG x5004
    .FILL x0000 ; null 
    .FILL x4206 ; AK378
.END 


; Strings 

; String 1 : XY123
.ORIG x4200
    .STRINGZ "XY123"
.END 

; String 2 : AK378
.ORIG x4206
    .STRINGZ "AK378"
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
;   AB789 is not in the main room.
;
;   -----Halting the processor ----

; Example 3:
; Console:
;   Type EID and press Enter: AK378
;   AK378 is already in the main room.
;
;   -----Halting the processor ----

