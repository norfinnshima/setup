# Raspberry Pi OS Setup

## ◯ Things to Prepare
* 本体（ここでは Raspberry Pi 4）
* microSD カード
* 電源アダプタ
* HDMIケーブル
* キーボード
* マウス

## ◯ Flash an OS image
書き込みソフト: **Raspberry Pi Imager**

* Device: インストールするデバイスを選択
* OS: Raspberry Pi OS (64-bit)
* Storage: 書き込む microSD カードを選択
* App Options
  * Enable anonymous statistics(telemetry) をオフ 
* Customisation
  * Hostname:
  * Localisation: 
  * User:
  * Wi-Fi:
    * ステルスSSID: チェックしない
  * Remote access:
    * SSHを有効化
  * Raspberry Pi Connect:
    * Enable Raspberry Pi Connect: オフ

## ◯ Backup
ストレージ全体を「イメージファイル」として丸ごとコピーする

### 手順
* Raspberry Piをシャットダウン: `sudo shutdown -h now`
* SDカードを取り外し、PCに接続
* デバイス名を確認: `diskutil list`
  * おそらく `/dev/disk2`
* **gzipで圧縮しながらバックアップ**:
  * `sudo dd if=/dev/disk2 bs=4M status=progress | gzip > $HOME/raspi-backup/raspi-backup-$(date +%Y%m%d).img.gz`
* **圧縮イメージからの復元**:
  * `gunzip -c $HOME/raspi-backup-20260226.img.gz | sudo dd of=/dev/disk2 bs=4M status=progress`
