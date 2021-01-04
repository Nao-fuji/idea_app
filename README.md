# アイデアアップ
## Overview
    アイデアを投稿・募集・買取するアプリケーション
    
## Usage
### 1.ホーム画面
  ![image](https://user-images.githubusercontent.com/72326957/103554791-ce973400-4ef2-11eb-9999-d05decc5f8a3.png)
<br>
### 2.アイデア投稿一覧ベージ
   ![image](https://user-images.githubusercontent.com/72326957/103555704-0488e800-4ef4-11eb-84de-e5e5d3b46e1a.png)
   
### 3.アイデア投稿詳細ベージ（購入前）
   購入する前ではアイデアの詳細（関連画像やアイデア、その他）を見ることができない
   ![image](https://user-images.githubusercontent.com/72326957/103556205-c50ecb80-4ef4-11eb-99ec-2ee8e4deb78f.png)
   
### 4.アイデア投稿詳細ベージ（購入後）
   ![image](https://user-images.githubusercontent.com/72326957/103555910-56317280-4ef4-11eb-9996-76c437d7f444.png)
    
### 5.アイデア募集一覧ページ
   ![image](https://user-images.githubusercontent.com/72326957/103555757-1ec2c600-4ef4-11eb-968c-91ff31584ab2.png)
   
   
### 6.アイデア募集詳細ページ
   ![image](https://user-images.githubusercontent.com/72326957/103555952-647f8e80-4ef4-11eb-9baa-2db11148ad05.png)
   
### 7.アイデア募集に対する投稿一覧
   ![image](https://user-images.githubusercontent.com/72326957/103556121-a4467600-4ef4-11eb-987e-92a7866d46ed.png)
   
### 8.アイデア購入ページ
   ![image](https://user-images.githubusercontent.com/72326957/103556253-d6f06e80-4ef4-11eb-9a44-93267c4d6cfd.png)
   
### 9.ユーザー新規登録ページ
   ![image](https://user-images.githubusercontent.com/72326957/103556288-e5d72100-4ef4-11eb-8712-c50be8ee24a3.png)

## Requirement
    VSCode（Visual Studio Code）
    
## Install
    
## Author
    作成者：Nao-fuji
    tweeter:

    
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
