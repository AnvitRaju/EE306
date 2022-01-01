; EE306 Lab3 Testcase 1 
;
    .ORIG x4004
    
    .FILL x037C ; m[x4004] = x037C
    .FILL x083F ; m[x4005] = x083F
    .FILL x1234 ; m[x4006] = x1234
    .FILL x0000 ; m[x4007] = x0000
;  After sorting 
;  m[x4004] = x1234
;  m[x4005] = x083F
;  m[x4006] = x037C
;  m[x4007] = x0000 
    .END