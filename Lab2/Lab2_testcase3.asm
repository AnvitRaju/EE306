; EE306 Lab2 Testcase 3
;
    .ORIG x3300
    
    .FILL x00FE ; m[x3300] = x00FE
    .FILL x00FF ; m[x3301] = x00FF

;   m[x3302]  should get x00FF

    .END