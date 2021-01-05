# アイデアアップ
## 概要
アイデアを投稿・募集・買取するアプリケーション
    
## 本番環境
ログイン情報（テスト用）<br>
ユーザー１
・Eメール：hoge@hoge.com
・パスワード：hoge1234<br>
ユーザー２
・Eメール：fuga@fuga.com
・パスワード：fuga1234

## 製作背景
今回のオリジナルアプリを制作するにあたり、どのようなものを制作すればよいかといったアイデアを思いつかなかった。<br>
オリジナルアプリなどは自分が感じている課題を解決するために制作するというアドバイスをもらっていたため、アイデアを思いつかないという課題を解決するためのアプリケーションを制作することにした。<br>
その方法としてユーザーが自由にアイデアを投稿し、それを別のユーザーが買取る機能 / 欲しいアイデアを募集し、それに合ったアイデアを投稿してもらう機能を採用した。

## DEMO
### 1.ホーム画面
  ![image](https://user-images.githubusercontent.com/72326957/103554791-ce973400-4ef2-11eb-9999-d05decc5f8a3.png)
<br>
<br>
<br>
### 2.アイデア投稿一覧ベージ
ユーザーが自由にアイデアを投稿することが出来る。<br>
投稿はユーザー名、ユーザーアイコン、投稿日、アイデアのタイトル、価格、ジャンルを表示するようにした。<br>
また、アイデアを購入したユーザーしか詳細を閲覧することが出来ないため、一覧ではアイデアのタイトルしか表示しないようにした。
   ![image](https://user-images.githubusercontent.com/72326957/103555704-0488e800-4ef4-11eb-84de-e5e5d3b46e1a.png)
<br>
<br>
<br>   
### 3.アイデア投稿詳細ベージ（購入前）
購入する前ではアイデアの詳細（関連画像やアイデア、その他）を見ることができない。
   ![image](https://user-images.githubusercontent.com/72326957/103556205-c50ecb80-4ef4-11eb-99ec-2ee8e4deb78f.png)
<br>
<br>
<br>   
### 4.アイデア投稿詳細ベージ（購入後）
購入後にアイデアの詳細を購入したユーザーのみが閲覧できるようにした。
   ![image](https://user-images.githubusercontent.com/72326957/103555910-56317280-4ef4-11eb-9996-76c437d7f444.png)
 <br>
<br>
<br>   
### 5.アイデア募集一覧ページ
欲しいアイデアを募集する。その際にアイデアの買取価格の範囲を設定する。
   ![image](https://user-images.githubusercontent.com/72326957/103555757-1ec2c600-4ef4-11eb-968c-91ff31584ab2.png)
<br>
<br>
<br>   
### 6.アイデア募集詳細ページ
   ![image](https://user-images.githubusercontent.com/72326957/103555952-647f8e80-4ef4-11eb-9baa-2db11148ad05.png)
<br>
<br>
<br>   
### 7.アイデア募集に対する投稿一覧
６.アイデア募集詳細ページに下部にコメント投稿のような形式で、表示するようにした。
   ![image](https://user-images.githubusercontent.com/72326957/103556121-a4467600-4ef4-11eb-987e-92a7866d46ed.png)
<br>
<br>
<br>   
### 8.アイデア購入ページ
募集に対する投稿の購入ページではクレジット情報と価格を入力するフォームが追加されている。
   ![image](https://user-images.githubusercontent.com/72326957/103556253-d6f06e80-4ef4-11eb-9a44-93267c4d6cfd.png)
<br>
<br>
<br>   
### 9.ユーザー新規登録ページ
登録内容はニックネーム、Eメール、ログイン時のパスワード、ユーザーアイコン、電話番号、本人確認用のフルネーム（カナを含む）
   ![image](https://user-images.githubusercontent.com/72326957/103556288-e5d72100-4ef4-11eb-8712-c50be8ee24a3.png)
<br>
<br>
## 開発環境
#### バックエンド
Ruby on Rails
<br>
#### フロントエンド
JavaScript
<br>
#### ソース管理
GitHub,GitHubDesktop
<br>
#### テスト
RSpec
<br>
#### エディタ
VSCode（Visual Studio Code）
    
## 今後実装したい機能
・画像のポップアップ表示機能<br>
・Good,Badなどの評価機能

    
# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| password           | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| phone_number       | string  | null: false |


### Association

- has_many :ideas
- has_many :idea_purchases
- has_many :recruits
- has_many :tweets
- has_many :tweet_purchases



## idea テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| title               | string     | null: false                    |
| idea                | string     | null: false                    |
| price               | integer    | null: false                    |
| category_id         | integer    | null: false                    |
| other               | text       |                                |
| user                | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :idea_purchase



## idea_purchase テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| idea    | references | null: false, foreign_key: true |


### Association

- belongs_to :idea
- belongs_to :user



## recruits テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| theme       | string     | null: false                    |
| price       | string     | null: false                    |
| category_id | integer    | null: false                    |
| other       | text       |                                |
| user        | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many :tweets



## tweet テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| idea                | string     | null: false                    |
| explain             | text       | null: false                    |
| other               | text       |                                |
| user                | references | null: false, foreign_key: true |
| recruit             | references | null: false, foreign_key: true |


### Association

- has_one :tweet_purchase
- belongs_to :user
- belongs_to :recruit


## tweet_purchase テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| tweet   | references | null: false, foreign_key: true |
| price   | integer    | null: false                    |


### Association

- belongs_to :user
- belongs_to :tweet
