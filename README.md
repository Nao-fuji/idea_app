# アイデアアップ
## 概要
アイデアを投稿・募集・買取するアプリケーション
    
## 本番環境
url: https://idea-app-0301.herokuapp.com/
<br>
ログイン情報（テスト用）<br>
ユーザー１
・Eメール：hoge@hoge.com
・パスワード：hoge1234<br>
ユーザー２
・Eメール：fuga@fuga.com
・パスワード：fuga1234

テスト用クレジットカード情報　　・番号：4242424242424242　　・セキュリティー番号：123

## 製作背景
今回のオリジナルアプリを制作するにあたり、どのようなものを制作すればよいかといったアイデアを思いつかなかった。<br>
オリジナルアプリなどは自分が感じている課題を解決するために制作するというアドバイスをもらっていたため、アイデアを思いつかないという課題を解決するためのアプリケーションを制作することにした。<br>
その方法としてユーザーが自由にアイデアを投稿し、それを別のユーザーが買取る機能 / 欲しいアイデアを募集し、それに合ったアイデアを投稿してもらう機能を採用した。

## DEMO
### 1.ホーム画面
  ![image](https://user-images.githubusercontent.com/72326957/105339013-90528200-5c1f-11eb-9ff1-71adca49d405.png)
<br>
<br>
<br>
### 2.アイデア投稿一覧ページ
ユーザーが自由にアイデアを投稿することが出来る。<br>
投稿はユーザー名、ユーザーアイコン、投稿日、アイデアのタイトル、価格、ジャンルを表示するようにした。<br>
また、アイデアを購入したユーザーしか詳細を閲覧することが出来ないため、一覧ではアイデアのタイトルしか表示しないようにした。
   ![image](https://user-images.githubusercontent.com/72326957/103555704-0488e800-4ef4-11eb-84de-e5e5d3b46e1a.png)
<br>
<br>
<br>   
### 3.アイデア投稿詳細ページ（購入前）
購入する前ではアイデアの詳細（関連画像やアイデア、その他）を見ることができない。
   ![image](https://user-images.githubusercontent.com/72326957/103556205-c50ecb80-4ef4-11eb-99ec-2ee8e4deb78f.png)
<br>
<br>
<br>   
### 4.アイデア投稿詳細ページ（購入後）
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
６.アイデア募集詳細ページの下部にコメント投稿のような形式で、表示するようにした。
   ![image](https://user-images.githubusercontent.com/72326957/103556121-a4467600-4ef4-11eb-987e-92a7866d46ed.png)
<br>
<br>
<br>
### 8.ユーザーページ
カレントユーザーは購入したアイデア、投稿したアイデア、アイデア募集が表示されており、別のユーザーにはそのユーザーのアイデア募集のみが表示されるように実装した。
また、このアプリは購入してからでないと、アイデアの詳細が見られない機能にした。
そこで、売る側ユーザーの評価を見られるようにすることで、買う側ユーザーの購入の決め手となるような機能が必要であったので、
それを今回は商品に対してのいいね機能を利用して、ユーザー評価（Good or Bad）をつけるように実装した。
   ![image](https://user-images.githubusercontent.com/72326957/105339032-96486300-5c1f-11eb-91ce-3875b8b01646.png)
<br>
<br>
<br>  
### 9.アイデア購入ページ
募集に対する投稿の購入ページではクレジット情報と価格を入力するフォームが追加されている。
   ![image](https://user-images.githubusercontent.com/72326957/103556253-d6f06e80-4ef4-11eb-9a44-93267c4d6cfd.png)
<br>
<br>
<br>   
### 10.ユーザー新規登録ページ
登録内容はニックネーム、Eメール、ログイン時のパスワード、ユーザーアイコン、電話番号、本人確認用のフルネーム（カナを含む）<br>
ユーザーに使いやすくするためにウィザード形式（ユーザー情報登録と本人確認情報登録）で登録するように実装した。<br>
また、新規登録やログインにgoogleアカウントを用いて行えるようにした。
<br>
<br>
**ユーザー情報登録画面**
   ![image](https://user-images.githubusercontent.com/72326957/107869434-4e8cc280-6ed1-11eb-995c-450403f463f3.png)
<br>
<br>
**本人確認情報登録画面**
   ![image](https://user-images.githubusercontent.com/72326957/105786308-2429a280-5fc0-11eb-9503-26db50209341.png)
<br>
<br>
## 工夫したポイント
・エラーが発生した際に、行うべきことを細分化し、順番に解決するように意識した。<br>
## 開発環境
#### バックエンド
Ruby on Rails
<br>
#### フロントエンド
html, css, JavaScript
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


    
# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| password           | string  | null: false |


### Association

- has_many :ideas
- has_many :idea_purchases
- has_many :recruits
- has_many :tweets
- has_many :tweet_purchases
- has_one  :identification



## identification テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| last_name          | string     | null: false |
| first_name         | string     | null: false |
| last_name_kana     | string     | null: false |
| first_name_kana    | string     | null: false |
| phone_number       | string     | null: false |
| user               | references |             |


### Association

- belongs_to :user



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
