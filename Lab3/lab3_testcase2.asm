; EE306 Lab3 Testcase 2 
;
    .ORIG x4004
    
    .FILL xCC74 ; m[x4004] = xCC74
    .FILL xAB27 ; m[x4005] = xAB27
    .FILL x1220 ; m[x4006] = x1220
    .FILL x3404 ; m[x4007] = x3404
    .FILL x0000 ; m[x4008] = x0000
    
;  After sorting 
;  m[x4004] = x3404
;  m[x4005] = x1220
;  m[x4006] = xAB27
;  m[x4007] = xCC74 
;  m[x4008] = x0000
    .END
    