import Yesod.Core
import Text.Julius

data App = App

mkYesod "App" $(parseRoutesFile "routes")

instance Yesod App

getHomeR :: Handler Html
getHomeR = defaultLayout $ do
    addScriptRemote "//cdnjs.cloudflare.com/ajax/libs/p5.js/0.5.7/p5.js"
    toWidgetHead $(juliusFileReload "index.julius.js")
    [whamlet|<h1>Yesodのテスト|]

getNextR :: Int -> Int -> Int -> Int -> Handler Value
getNextR x y vx vy = returnJson $ object
    [ "x" .= x'
    , "y" .= y'
    , "vx" .= vx'
    , "vy" .= vy'
    ]
  where (x', y') = (x + vx, y + vy)
        (vx', vy') = (vx, vy + 1)

main :: IO ()
main = warp 8080 App
