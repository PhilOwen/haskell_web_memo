import Happstack.Lite
import qualified Data.Text.Lazy as T

main :: IO ()
main = do
  putStrLn $ unlines ["starting...", "http://localhost:8000"]
  serve Nothing routings

routings :: ServerPart Response
routings = msum [
    dir "public" $ staticFiles
  , post
  , home
  ]

home :: ServerPart Response
home = serveFile contentType index where
  contentType = asContentType "text/html"
  index = "static/index.html"

post :: ServerPart Response
post = do
  method POST
  msg <- lookText "msg"
  ok $ toResponse $ doSomething msg where

staticFiles :: ServerPart Response
staticFiles = serveDirectory DisableBrowsing [] "static"

doSomething :: T.Text -> T.Text
doSomething msg = T.unwords [msg, "がPOSTされた。 length =", T.pack $ show $ T.length msg]
