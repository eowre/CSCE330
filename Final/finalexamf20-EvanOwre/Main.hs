module Main where
 
data MyTree a = MyEmptyNode
              | MyFilledNode a (MyTree a) (MyTree a)
              deriving (Eq,Ord,Show,Read)
 
main :: IO ()
main  =
   do
      putStrLn "Begin program"
 
      let aMyTree = MyFilledNode 5 (MyFilledNode 3 MyEmptyNode MyEmptyNode) (MyFilledNode 7 MyEmptyNode MyEmptyNode)
      print aMyTree
      print (sumMyTree aMyTree)
 
      let bMyTree = MyFilledNode "r" (MyFilledNode "s" MyEmptyNode MyEmptyNode) (MyFilledNode "a" MyEmptyNode MyEmptyNode)
      print bMyTree
      print validBST aMyTree
      putStrLn "End program"
 
sumMyTree                       :: Num a => MyTree a -> a
sumMyTree MyEmptyNode            = 0
sumMyTree (MyFilledNode n t1 t2) = n + sumMyTree t1 + sumMyTree t2

validBST :: Ord a => MyTree a -> Bool
validBST MyEmptyNode = True
validBST (MyFilledNode l v r) = rightComp r v && leftComp l v && validBST l && validBST r

rightComp :: Ord a => MyTree a -> a -> Bool
rightComp (MyFilledNode _ x _) v = v < x 

leftComp :: Ord a => MyTree a -> a -> Bool
leftComp (MyFilledNode _ x _) v = v > x 

