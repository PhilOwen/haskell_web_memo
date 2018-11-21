RubyのSinatraの影響を受けているHaskellのScottyを使ってみる。

Haskellは、元々クセのある言語だが、
それでウェブフレームワークなど大きなことをやろうとすると、
難解な言語拡張が使われていたりしてかなり厄介。
有名なフレームワークのYesodとかは結構巨大で、とっかかりづらい。  
ただ、純粋関数型のウェブサーバというのは自分はよくわかっていなくて、
面白いかもしれないので、まずはシンプルらしいScottyを試してみる。
Haskellの勉強にもなるかもしれない。

今回は、`/`でアクセスしたときに固定の文字列を返す。  
`/world`など文字列でアクセスしたときはHello　worldと返す。  
その他（`/abc/123`など）の場合はNot Found。  
確かにコードはSinatraっぽくなっている。

ビルドにはstackを使った。
> stack build  
> stack exec hello-scotty

とすると、8080ポートで開始する。

## 参考
- [公式GitHub](https://github.com/scotty-web/scotty)
