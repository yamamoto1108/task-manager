 # Task-manager
カンバン型のToDoアプリです。  
http://task--manager.tk/   
Sign UpまたはLog Inページからテストユーザーでログインできます。

# 実装した機能
* ユーザー関連(devise)
  * ユーザー新規登録・ログイン機能
  * ユーザー情報編集機能
  * ユーザーマイページ機能

* Todo管理関連
  * ボード作成・編集・削除機能
  * リスト作成・編集・削除機能
  * カード作成・編集・削除機能
  * リスト・カードのドラッグ&ドロップ機能（ranked-model）
  * ログインユーザーのボード・カード一覧表示機能
  * コメント機能

* チーム関連
  * チーム作成・編集機能
  * ユーザー検索機能
  * チームページ機能

* ダイレクトメッセージ関連
  * チームメンバーへのダイレクトメッセージ送信機能

* ファイルアップロード関連(Active Storage, mini_magick)
  * ユーザー・チームアバター
  * カードへのファイル添付

* 単体・統合テスト

# 使用技術・環境
* Ruby 2.6.3
* Rails 5.2.3
* Mysql
* AWS
  * EC2
  * S3
  * Route53
