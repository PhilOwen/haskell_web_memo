HaskellのウェブフレームワークHappstackの軽量版、happstack-liteを使ってみる。  
手始めに、URL埋め込みパラメータのマッチングと、
デフォルトルートでページを表示できるようにした。
`/echo/something`でアクセスすると
`something`がパラメータとしてマッチされる。

チュートリアルにしたがって、BlazeHtmlでHTMLを生成している。
外部ファイルを使わず、Haskellコードで生成するのでちょっとびっくり。
確かに、コードを見ればインデントもされていて、
何をやっているかすぐ追えるが、実戦ではやりたくない…。

ルーティングは、`dir "path" $ controller`のようにして定義される。
`dir`はguard文。
マッチしたとき、対応するコントローラに進む。  
今回、`home`はノーガードなので、
実は`echo`にマッチしなかったものすべてが来る
（404がない）。

依存関係が、StackageのLTSだけでは解決できない。
stack.yamlにパッケージを追加する。
さらに、パッケージのバージョン制約で、
新しい方向に制約を破っているのは許容するようにした。

開発も止まり気味だし、アクは強めだし、
他のフレームワークをでなくあえてこれを使う理由はないかなぁ…

> stack build  
> stack exec hello-happstack-lite

とすると、`http://localhost:8000`で起動する。

## 参考
- [Happstack公式ページのチュートリアル](http://www.happstack.com/page/view-page-slug/9/happstack-lite)
- [Happstack.LiteのHackage](https://hackage.haskell.org/package/happstack-lite-7.3.6/docs/Happstack-Lite.html)
