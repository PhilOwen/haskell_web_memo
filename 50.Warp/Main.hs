import Network.Wai
import Network.HTTP.Types
import Network.Wai.Handler.Warp (run)

main :: IO ()
main = do
  putStrLn $ unwords ["starting server...", "http://localhost:8080/"]
  run 8080 app

app :: Application
app request respond = respond $
  case rawPathInfo request of
    "/"      -> index
    "/hello" -> hello
    _        -> notFound

index :: Response
index = responseFile
  status200
  [("Content-Type", "text/html")]
  "index.html"
  Nothing

hello :: Response
hello = responseLBS
  status200
  [("Content-Type", "text/html")]
  "Hello, Warp!!!"

notFound :: Response
notFound = responseLBS
  status404
  [("Content-Type", "text/plain")]
  "404 - Not Found"
