import Web.Scotty

main :: IO ()
main = scotty 8080 app

app :: ScottyM ()
app = do
  get "/" $ do
    html "<h1>Scotty is working</h1>"
  get "/:name" $ do
    name <- param "name"
    html $ mconcat ["<h1>Hello, ", name, "!</h1>"]
