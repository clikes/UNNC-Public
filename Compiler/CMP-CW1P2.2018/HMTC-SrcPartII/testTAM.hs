module MyTAMCode where
import TAMCode 
import TAMInterpreter
addAndPrint = [
    GETCHR,
    CALL "putchr",
    HALT,
    Label "putchr",
    LOAD (LB (-1)),
    PUTCHR,
    RETURN 0 1
        ]
             
       -- LOADL       3,                   
                  
       -- POP         0 1,