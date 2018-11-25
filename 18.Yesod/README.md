Yesodで、普通にHTMLページを返したり、JSON APIを作ってみる。

P5.jsで、コマが進むごとにJSON APIを呼んで、
クライアント側の状態（今回はボールの位置と速度）を
全部サーバに投げて計算させて、
結果をクライアントで描画させた。
通信が多く、サーバにやや負荷がかかる
（例にしては変則的すぎたか？）。

HaskellのウェブフレームワークといえばYesodが有名だが、
プログラムの簡潔さを重視した結果か、
やり方が独特になっていて、直接的でない。
学習コストがかかりそうなので、後回しにしていた。
日本語情報が少ないのもしんどい。

ただ、今回やってみたら、わりと大丈夫だった。
`Main.hs`は短いし、読んで挙動が想像できるレベル。
（それでも実装詳細は理解しておらず、ブラックボックスな面も多いが）。

`stack new my-yesod yesod-simple`
などとすれば、雛形を生成できる。
が、今回は勉強のため、自分でミニマルに作ってみた。
本来はベストプラクティスの詰まった雛形を使うべきらしい。

ルーティングは、外部`route`ファイルか、
Hsソースに`parseRoutes`で直接埋め込んで定義する。
今回は外部ファイルにした。

Widgetという、HTMLとCSSとJSをセットにした仕組みが独特。  
HTMLにはhamletエンジンを使う。
hamletの内容は、外部ファイルとQuasiQuoteで定義できる。  
hamletはよくあるテンプレートエンジンといった感じで違和感ないが、
JSについては、JuliusエンジンでJSを生成した後、
toWidgetでHTMLと混ぜるのが意表を付いている。
もちろんJSは外部ファイルにもできて、
`addScript`や`addScriptRemote`でロードできる。

## 参考
- [Yesodクイックスタート](http://www.yesodweb.com/page/quickstart)
- [Yesodの基本](http://www.yesodweb.com/book/basics)
- [P5.js](https://p5js.org/reference/)
