; EE306 Lab4 Testcase 1
;
    .ORIG x4004
    
    .FILL x0A01 ; m[x4004] = x0A01
    .FILL x0902 ; m[x4005] = x0902
    .FILL x0805 ; m[x4006] = x0805
    .FILL x0704 ; m[x4007] = x0704
    .FILL x0001 ; m[x400E] = x0001
    
;  After running lab4 
; m[x4000] = x4604
; m[x4001] = x5300 
; m[x4002] = x4A00
; m[x4003] = x4700

; m[x6000] = x0501
; m[x6001] = x0003

    .END
