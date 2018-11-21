Haskell版SinatraのScottyからフォークしたSpockを使ってみる。

`/`でアクセスしたときはHello Worldと返して、
`/hello/alice`などとアクセスしたときは、Hello aliceと返す。
超単純なアプリ。

`app :: SpockM () () () ()`
という関数の型が一見意味不明だが、
元々は`SpockM conn sess st a`という型。  
今回のアプリでは、DBを使わないのでconnが`()`、
セッションクッキーを使わないのでsessが`()`、
状態もないのでstが`()`、
返り値もないのでaも`()`になっている。  
状態を持たせたり色々やりたいときには、
これらの型変数がちゃんと仕事する。

SpockとScottyはあまり差がない感じ。  
一応、Spockのほうが後発で、
URL埋め込みパラメータを型つきで安全にマッチングできたり、
いくらか改良もされているらしい
（それでも公式のサンプルコードが動かなかったりするが）。

ビルドにはstackを使った。
> stack build  
> stack exec hello-spock

とすると、8080ポートで開始する。

## 参考
- [公式サイト](https://www.spock.li/)
- [公式チュートリアル](https://www.spock.li/tutorial/)
- [公式Hackage](https://hackage.haskell.org/package/Spock)
