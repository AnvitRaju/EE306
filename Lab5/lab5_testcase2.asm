; EE306 Lab5 Testcase 2
; No element list 


;   Nodes

; Head node pointer - address of head
.ORIG x4000
    .FILL x0000 ; pointer to first node
.END 


; Strings : these don't matter as there are no nodes

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

