Haskellのウェブフレームワークhappstack-liteを使ってみる続き。

サーバサイドでごちゃごちゃHTMLを作るのは好きではないので、
静的なHTMLとJSを使ってシングルページにした。
と言っても、クライアントがjQueryでPOSTしたものを、
happstackサーバが受け取って適当に処理して返して
ページに表示しただけ（さすがにテキトーすぎるが…）。  
チュートリアルにある、POSTの扱いや静的ファイルの配信の項目を
少しひねって組み合わせた。

HTTPメソッドによる分岐は、`method`で行う。  
POSTされたパラメータは`lookText`で取り出せる。  
静的なHTMLやJSは、`serveFile`と`serveDirectory`で配信した。
どれも、引数を見ればどう使うか察しがつく。  
静的ファイルは、実際は`static`というディレクトリに入れているが、
ウェブからは`public`でアクセスさせた。

## 参考
- [Happstack公式ページのチュートリアル](http://www.happstack.com/page/view-page-slug/9/happstack-lite)
- [Happstack.LiteのHackage](https://hackage.haskell.org/package/happstack-lite-7.3.6/docs/Happstack-Lite.html)
