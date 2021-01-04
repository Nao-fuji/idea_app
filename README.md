# アイデアアップ
## Overview
    アイデアを投稿・募集・買取するアプリケーション
    
## Usage
    <img width="1544" alt="スクリーンショット 2021-01-05 0 57 44" src="https://user-images.githubusercontent.com/72326957/103553952-86c3dd00-4ef1-11eb-9f57-f64a6a7e4ef1.png">
    <img width="1544" alt="スクリーンショット 2021-01-05 0 59 54" src="https://user-images.githubusercontent.com/72326957/103554271-f6d26300-4ef1-11eb-8230-8af922c2f239.png">

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
