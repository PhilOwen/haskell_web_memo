高速で軽量なHaskellのウェブサーバWarpを使ってみる。  
高速と言われるNginxより速いこともあるらしい。
Yesodフレームワークでも、下で使われている。  
WAI(Web Application Interface)という規格に沿っていて、
今回のコードにもWaiモジュールが出てくる。

ルーティングを設定して、
静的ファイルを返したり、単純な文字列を返してみた。
マッチしなければ404になる。
このくらいなら簡単。
（本気でウェブ開発するなら、
さすがにヘッダくらいは自動で設定してほしいし、
フレームワークを使うのが自然だと思うが）

> stack build  
> stack exec hello-wai

とすると、`http://localhost:8080`で動く

## 参考
- [WAIのHackage](https://hackage.haskell.org/package/wai)
- [Warpの詳しい解説](http://www.aosabook.org/en/posa/warp.html)