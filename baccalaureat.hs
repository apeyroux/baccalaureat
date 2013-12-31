import System.Random
import Control.Concurrent
import System.ProgressBar

import System.IO ( hSetBuffering, BufferMode(NoBuffering), stdout )

main = do
  hSetBuffering stdout NoBuffering
  c <- randomRIO ('a','z')

  putStrLn "\n+---------+---------+---------+---------+---------+---------+---------+---------+---------+"
  putStrLn "| Prénom  |  Ville  |  Pays   | Végétal | Animal  |Célébrité| Métier  |  Objet  | Points  |"
  putStrLn "+---------+---------+---------+---------+---------+---------+---------+---------+---------+\n"
 
  mapM (\s -> reboursLettre s) [0..5]

  putStrLn $ "\n---\nLetter : " ++ show c ++ "\n---"
  putStrLn "You have 2 minutes ..."
  mapM (\s -> reloadPB s) [0..120]
  putStrLn "End !"

  where
    reloadPB s = do
      progressBar (msg $ show s ++ "s") percentage 60 s 120
      threadDelay 1000000

    reboursLettre s = do
      progressBar (msg $ "I search letter") percentage 60 s 5
      threadDelay 1000000
