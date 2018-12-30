import Web.Spock
import Web.Spock.Config
import Data.Text

main :: IO ()
main = do
  spockCfg <- defaultSpockCfg () PCNoDatabase ()
  runSpock 8080 (spock spockCfg app)

app :: SpockM () () () ()
app = do
  get root $
    html "Hello World!"
  get ("hello" <//> var) $ \name -> do
    html ("Hello " `append` name)
