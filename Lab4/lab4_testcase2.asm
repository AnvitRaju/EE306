; EE306 Lab4 Testcase 2 
;
    .ORIG x4004
    
    .FILL xCC74 ; m[x4004] = xCC74
    .FILL xAB27 ; m[x4005] = xAB27
    .FILL x1220 ; m[x4006] = x1220
    .FILL x3404 ; m[x4007] = x3404
    .FILL xA502 ; m[x4008] = xA502
    .FILL x0002 ; m[x4009] = x0002
    
;  After running lab4
; m[x4000] = x4602
; m[x4001] = x5302
; m[x4002] = x4A00
; m[x4003] = x4701

; m[x6000] = x7402
; m[x6001] = x0026

    .END
    
