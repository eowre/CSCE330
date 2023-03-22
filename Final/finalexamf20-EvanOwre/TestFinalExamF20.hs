import Debug.Trace
import FinalExamF20
main = do
    putStrLn("\nPlease:")
    putStrLn("Read the rules at the top of FinalExamF20.hs")
    putStrLn("\"Code Incrementally\"++['!' | i<-[1..] ] \n")
    putStrLn("Tests:")
    putStrLn(msg)
        where
            msg = show score

score = s12+s11+s10+s9+s8+s7+s6+s5+s4+s3+s2+s1
    where  -- NOTE: Reading the test argument lists index-by-index helps
        q1args1     =  [False,False,True,  True]
        q1args2     =  [False,True, False, True]
        q1expecteds =  [False,True, True,  False]
        s1 = test2 "test: q1 (xor) " (xor) q1args1 q1args2 q1expecteds 5
        
        q2args    = [ 'A',    'B',   'C',   'D' , 'F'  ]
        q2expecteds = [89.5,  79.5,  69.5,  59.5,  0.0 ]
        s2 = test1 "test: q2 (minGrade) " (minGrade) q2args q2expecteds 5
        
        q3args    =   [89.5,  87.5,  69.5,  66  ,  10.0 ]
        q3expecteds = [ 'A',    'B',   'C',   'D' , 'F'  ]
        s3 = test1 "test: q3 (letterGrade) " (letterGrade) q3args q3expecteds 5
        
        q4argsInt    = [ [1..5] , [10..20]  ]
        q4expectedsInt = [ [2,1,3,4,5], [11,10]++[12..20] ]
        s4Int = test1 "test: q4Ints (flipFirstTwo) " (flipFirstTwo) q4argsInt q4expectedsInt 5
        q4argsString      = [ "fred", "ted"  ]
        q4expectedsString = [ "rfed", "etd" ]
        s4String = test1 "test: q4String (flipFirstTwo) " (flipFirstTwo) q4argsString q4expectedsString 5
        s4 = min s4Int s4String

        q5args    =   ["capitalization is annoying" , "I do not like green eggs."]
        q5expecteds = ["capItalIzatIon Is annoyIng",  "I do not lIke green eggs."]
        s5 = test1 "test: q5 (capitalizeIs) " (capitalizeIs) q5args q5expecteds 5

        q6args1     =  [2,            5]
        q6args2     =  [0,            1]
        q6args3     =  [10,           20]
        q6expecteds =  [[0,2,4,6,8],  [5,10,15]]
        s6 = test3 "test: q6 (multRange) " (multRange) q6args1 q6args2 q6args3 q6expecteds 5

        q7args1     =  ["Irene","Irene", "Irene",   "Hippopotamus", [],    ""]
        q7args2     =  ["Igloo","irene", "Catalyst", "Apoptosis",  "Fred","Fred"]
        q7expecteds =  [True,    True,   False,      True,        False,  False]
        s7 = test2 "test: q7 (sameXAtSameIndex) " (sameXAtSameIndex) q7args1 q7args2 q7expecteds 5

        q8args    = [ [1,2,3,4],   [1,2,3,5,6] , [1,3,5,7] , [0,1,3,5,6,9,12]  ]
        q8expecteds = [False,      False,        True,       True ]
        s8 = test1 "test: q8 (evensMultOf3) " (evensMultOf3) q8args q8expecteds 5

        q9iargs1     =  [0,        0         ]
        q9iargs2     =  [[1..10],  [-1,-2,-3] ]
        q9iexpecteds =  [10,       0             ]
        s9i = test2 "test: q9integers (maxOrMin) " (maxOrMin) q9iargs1 q9iargs2 q9iexpecteds 10
        q9fargs1     =  [20.0,                  20.0 ]
        q9fargs2     =  [[1.0,2.0,3.0,2.0,1.0], [10.0,20.0,30.0,20.0,10.0] ]
        q9fexpecteds =  [20.0,                   30.0]
        s9f = test2 "test: q9fractional (maxOrMin) " (maxOrMin) q9fargs1 q9fargs2 q9fexpecteds 10
        s9 = min s9f s9i

        q10args    = [ goodBST,  badBST1,   badBST2,   emptyBST ]
        q10expecteds = [True,    False,     False,     True ]
        s10 = test1 "test: q10 (validBST) " (validBST) q10args q10expecteds 10

        q11iargs1     =  [1,              4,              1              ]
        q11iargs2     =  [4,              1,              1              ]
        q11iargs3     =  [[0,1,2,3,4,5,6],[0,1,2,3,4,5,6],[0,1,2,3,4,5,6]]
        q11iexpecteds =  [[1,2,3],        [],             []             ]
        s11i = test3 "test: q11ints (sublistI2J) " (sublistI2J) q11iargs1 q11iargs2 q11iargs3 q11iexpecteds 10
        q11cargs1     =  [1,              2,              1              ]
        q11cargs2     =  [4,              6,              4              ]
        q11cargs3     =  ["abcdefghi",    "fred",         []             ]
        q11cexpecteds =  ["bcd",          "ed",           []             ]
        s11c = test3 "test: q11strings (sublistI2J) " (sublistI2J) q11iargs1 q11iargs2 q11iargs3 q11iexpecteds 10
        s11 = min s11i s11c

        q12iargs1     =  [[2,4,8],   []      ]
        q12iargs2     =  [[1..10],   [1..10] ]
        q12iexpecteds =  [True   ,   True    ] 
        s12i = test2 "test: q12integers (subseq) " (subseq) q12iargs1 q12iargs2 q12iexpecteds 10
        q12cargs1     =  ["red",   "der",   "fey"    ]
        q12cargs2     =  ["freddy","freddy","freddy" ]
        q12cexpecteds =  [True   ,  False,   True    ] 
        s12c = test2 "test: q12strings (subseq) " (subseq) q12cargs1 q12cargs2 q12cexpecteds 10
        s12 = min s12i s12c

test1 msg f [] [] value = trace (msg++" passed!") value
test1 msg f (arg:args) (expected:expecteds) value
  | result == expected = test1 msg f args expecteds value
  | otherwise = trace (msg ++ "on input "++ show arg ++ " returned " ++ show result ++ ", expected " ++ show expected ) 0 
    where
       result = f arg
       
test2 msg f [] [] [] value = trace (msg++" passed!") value
test2 msg f (arg1:args1) (arg2:args2) (expected:expecteds) value
  | result == expected = test2 msg f args1 args2 expecteds value
  | otherwise = trace (msg ++ "on inputs "++ show arg1 ++" "++ show arg2++ " returned " ++ show result ++ ", expected " ++ show expected ) 0 
    where
       result = f arg1 arg2

test3 msg f [] [] [] [] value = trace (msg++" passed!") value
test3 msg f (arg1:args1) (arg2:args2) (arg3:args3) (expected:expecteds) value
  | result == expected = test3 msg f args1 args2 args3 expecteds value
  | otherwise = trace (msg ++ "on inputs "++ show arg1 ++" "++ show arg2++" "++ show arg3++ " returned " ++ show result ++ ", expected " ++ show expected ) 0 
    where
       result = f arg1 arg2 arg3