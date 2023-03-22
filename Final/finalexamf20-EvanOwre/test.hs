module test where
 
data MyTree a = MyEmptyNode
              | MyFilledNode a (MyTree a) (MyTree a)
              deriving (Eq,Ord,Show,Read)
 
main :: IO ()
main  =
   do
      putStrLn "Begin program"
 
      let aMyTree = MyFilledNode 5 (MyFilledNode 3 MyEmptyNode MyEmptyNode) (MyFilledNode 2 MyEmptyNode MyEmptyNode)
      print aMyTree
      print (sumMyTree aMyTree)
 
      let bMyTree = MyFilledNode "r" (MyFilledNode "s" MyEmptyNode MyEmptyNode) (MyFilledNode "a" MyEmptyNode MyEmptyNode)
      print bMyTree
 
      putStrLn "End program"
 
sumMyTree                       :: Num a => MyTree a -> a
sumMyTree MyEmptyNode            = 0
sumMyTree (MyFilledNode n t1 t2) = n + sumMyTree t1 + sumMyTree t2 a = MyEmptyNode
