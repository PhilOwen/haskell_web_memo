import Happstack.Lite
import Text.Blaze.Html5 (p, toHtml)
import qualified Text.Blaze.Html5 as H

main :: IO ()
main = do
  putStrLn "http://localhost:8000"
  serve Nothing routings

routings :: ServerPart Response
routings = msum [
    dir "echo" $ echo
  , home
  ]

home :: ServerPart Response
home = ok $ toResponse $ do
  H.html $ do
    H.body $ do
      H.h1 "This is the home"

echo :: ServerPart Response
echo = path $ \(msg :: String) ->
  ok $ toResponse $ do
    H.html $ do
      H.body $ do
        H.h1 "URL Parameter matching"
        p $ (toHtml msg) >> " is matched"
