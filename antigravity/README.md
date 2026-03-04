# Antigravity Settings

## ◯ UIを日本語化
* 拡張機能: Japanese Language Pack

### ルール設定
* チャット右上「…」: Additional options -> Customizations -> Rules -> +Global
	* GEMINI.md: 「Think in Japanese and always respond in Japanese.」

## ◯ Webサーチ
* **プロンプトインジェクションに注意**

### Secure Mode
* Antigravity -> Preferences -> Antigravity Settings -> Secure Mode: ON
* 有効にすることで、AIが作業を進める前に確認を求めてくれるようになる

## ◯ MCPの導入
* **公式のみ使用すること**
* チャット右上「…」: MCP Servers -> Manage MCP Servers -> View raw config
	* mcp_config.json に記述
	* Manage MCP Servers -> Refresh
* チャット右上「…」: Additional options -> Customizations -> Rules -> Workspace
	* ルールの名前をつける
	* GEMINI.md に指示を記述

### Context7
* ライブラリなどを使うときに、最新のドキュメントを参照してくれる
* **APIキーが必要**
	* ログイン後、Create API Key をクリック、名前を付けて保存、コピーしておく
* **@GEMINI.md**:
	```
	コード生成、セットアップや設定手順、またはライブラリ/APIドキュメントが必要な場合は、常にContext7を使用してください。明示的に依頼しなくても、Context7 MCPツールを自動的に使用してライブラリIDを解決し、ライブラリのドキュメントを取得する必要があります。
	```

## ◯ カスタムコマンド / ワークフロー
* ファイル名がそのままコマンド名になる
	* proofread.md なら ```/proofread``` というコマンドが使える
* チャット右上「…」: Additional options -> Customizations -> Workflows -> +Workspace
	* ワークフロー名をつける
	* .md に指示を記述

### [sample] ワークフロー（/add-image）の設定
**Description（説明）:**
```
与えられたテキストを解説する図解を作成してください
```
**Content（内容）:**
```
1. チャットで与えられたテキストに基づき、Nano Banana Proで図解画像を生成します。
   - 画像内のテキストは必ず日本語にすること
   - 白を基調としたプロフェッショナルなスタイリングにすること
2. 生成された画像を `images` ディレクトリに保存します（ディレクトリがない場合は作成）。
   - ファイル名は内容を表す英語の名称にしてください（例: `feature_summary.png`）。
3. 与えられたテキストに近い、適切な位置に保存した画像へのリンクを追加します。
```

## ◯ ガードレール
* 実行前に確認
* アクセス制限
	* ワークスペース以外のファイルは、デフォルトでは編集できない
* 禁止コマンド
* サンドボックス

### 人間の許可を求めるか
* ステータスバー右下: Antigravity -Settings
	* Auto Execution: ターミナルコマンドの実行方法
	* Review Policy: 実装プランの確認方法
		* Always Proceed: 許可を求めず、自動で実行する
		* Request Review: 常に人間の許可を求める

### コマンドの許可・拒否リスト
* ステータスバー右下: Antigravity -Settings -> Advanced Settings -> Agentタブ
	* Allow List Terminal Commands
	* Deny List Terminal Commands
		* +Add ```rm```

### ブラウザのURL許可リスト
* ステータスバー右下: Antigravity -Settings -> Advanced Settings -> Browserタブ
	* Enable Browser Tools: オフにすると、そもそもWebへのアクセスをさせない

### 自分でガードレールを設定
* Git を活用する
* sudo に注意する
* わからないコマンドは、調べて理解してから実行する
	* 特に ```rm``` 系
* コードの内容を理解する
* 影響範囲を確認する
* 段階的に実行する
* .env など機密情報を含むものに注意する
