# アイデアアップ
## Overview
    アイデアを投稿・募集・買取するアプリケーション
    
## Usage
    ###1.ホーム画面
    ![image](https://user-images.githubusercontent.com/72326957/103554791-ce973400-4ef2-11eb-9999-d05decc5f8a3.png)
    
    ###2.アイデア投稿一覧ベージ
    ###3.アイデア投稿詳細ベージ（購入前）
    ###4.アイデア投稿詳細ベージ（購入後）
    
    ###5.アイデア募集一覧ページ
    ###6.アイデア募集詳細ページ
    ###7.アイデア募集に対する投稿一覧
    ###8.アイデア購入ページ
    ###9.ユーザー新規登録ページ
    
   ![image](https://user-images.githubusercontent.com/72326957/103554583-7a8c4f80-4ef2-11eb-9780-12a2f21d757e.png)


## Requirement
    開発環境
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
