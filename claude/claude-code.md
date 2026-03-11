# Claude Code

## ◯ 仕様を詰める
* 可能な限り最初に徹底的に作成しておいた方が手戻りが少ない
* [Best Practices](https://code.claude.com/docs/ja/best-practices)
  * SPEC.md や TASKS.md のようなものを用意しておくといい

### Claude Code
* Plan Mode: `Shift + Tab` x 2
* 精度の高いモデル使う: `/model opusplan`
* **Ask User Question Tool** 機能を使って質問してもらいながら固める
```
Ask User Question Tool を使って曖昧な仕様を詰めてください。
* Xcodeを使用しないで手軽に実装できるクリップボードアプリを作成したい
* イメージとしては、コピー履歴を保持して直近以外のものを探し出して貼り付けることができる
* 必要最小限の機能で十分
```

* （発展:）出来上がった計画ファイルのパスを、別のウィンドウで起動したClaudeに渡してレビューしてもらって、より完成度を上げる
  * `この計画で問題ないかレビューしてください` -> セキュリティ的にとか技術的にとか
  * （Codexなど、別のAIにレビューしてもらう方がいいかも）
  * レビューのフィードバックをコピー
  * **4, Type here to tell Claude what to change**: ここにフィードバックを貼り付けて修正してもらう

* **1,Yes, clear context and auto-accept edits**

## ◯ Context Engineering
* 言語モデルに入力できる文章量は限りがある
* 入力が長くなるほど精度が落ちる
* `/context' で確認

## ◯ 実装
* Create Claude.md: `/init'
  * やらない方がいい、という説あり
  * 読んでほしいディレクトリなども、Claudeが自分で検索してくれる方が効率が良い
  * 毎回読み込まれることによりコンテキストが増えるので、必要最小限の内容にする
  * 書くとすれば、プロジェクト特有のルールや技術など、Claudeがプロジェクトを検索しても見つけられない情報だけを記述する
    * `/init'` を実行しないで手動で用意
    * 汎用的に使うものではない
  * `ユーザーの入力が曖昧な場合は、**Ask User Question Tool** を積極的に使ってください。` を書いておくのは効果的
  * 良さそうな例:
    ```
    現在のファイルを確認して、変更箇所を順番に示してください。
    各変更箇所ごとに、
      * 変更後のコードを提示
      * なぜこのように変更したのかを説明
    という流れで進めてください。
    ```

## Ultrathink
* 言語モデルに考えさせるレベルを最も高くする: `ultrathink`
  * デフォルトのレベル: `/model' -> Medium effort
  * `ultrathink` にすると、High effort の状態で利用できる

## Other Commands
* `/copy`: 直近の返答をコピーする
* `/rewind`: 特定の履歴に戻る
* `/fork`: 会話を分岐することができる
* `/remote-control`: リモート環境からアクセスできる
