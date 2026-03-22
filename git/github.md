# ローカルファイルをGitHubにアップロードする手順

## ◯ リモートリポジトリ作成
* GitHub ログイン
* Create New repository
  * **README等不要**

## ◯ ローカルリポジトリ作成
### 初期化
```
cd 作業ディレクトリ
git init
```

### 作業者を登録（リポジトリ毎に分けたい場合）
```
git config user.name xxxx
git config user.email xxxx@xxxx.com
```

### 作業を登録
```
git add .
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/xxxx/xxxxxxxx.git
git push -u origin main
```

#### ▽ Authentication failed になる場合
* パスワード認証が廃止になったので、トークンを用意
* Settings -> Developer Settings
  * Personal access tokens -> Tokens (classic) -> Generate new token (classic)
    * Note: 何でもOK
    * Expiration: お好みでOK
    * Scopes: repo のみでOK
  * Generate token
    * この画面でしか表示されないので、コピーしておく
* push（再）
  * ```git push -u origin main```
  * Username: GitHub のユーザー名
  * Password: < token >

---

# クローンしてから push する手順

## ◯ リモートリポジトリをクローン
```
cd クローンを置きたい場所
git clone リポジトリURL
```

## ◯ 作成されたローカルリポジトリに移動
### 作業者を登録（リポジトリ毎に分けたい場合）
```
cd ローカルリポジトリ
git config user.name xxxx
git config user.email xxxx@xxxx.com
```

### 作業を登録
元々作業していたデータがあるなら、クローンしたところに格納する
```
git add .
git commit -m "update"
git push
```
