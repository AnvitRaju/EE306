; EE306 Lab3 Testcase 3
;
    .ORIG x4004
    
    .FILL x0A01 ; m[x4004] = x0A01
    .FILL x0902 ; m[x4005] = x0902
    .FILL x0803 ; m[x4006] = x0803
    .FILL x0704 ; m[x4006] = x0704
    .FILL x0605 ; m[x4006] = x0605
    .FILL x0506 ; m[x4006] = x0506
    .FILL x0407 ; m[x4006] = x0407
    .FILL x0308 ; m[x4006] = x0308
    .FILL x0208 ; m[x4006] = x0208
    .FILL x0109 ; m[x4006] = x0109
    .FILL x0000 ; m[x4008] = x0000
    
;  After sorting 
; m[x4004] = x0A01
; m[x4005] = x0902
; m[x4006] = x0803
; m[x4006] = x0704
; m[x4006] = x0605
; m[x4006] = x0506
; m[x4006] = x0407
; m[x4006] = x0308
; m[x4006] = x0208
; m[x4006] = x0109
; m[x4008] = x0000

    .END
    