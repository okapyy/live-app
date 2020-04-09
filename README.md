# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# LiveApp DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
### Association
- has_many :favorites
- has_many :videos, through: :favorites

## videosテーブル
|Column|Type|Options|
|------|----|-------|
|video|text|null: false|
|artist|text||
|song-title|text||
|content|text||
|user_id|integer|null: false, foreign_key: true|
### Association
- has_many :favorites
- has_many :users, through: :favorites
- has_many :videos_tags
- has_many :tags, through: :videos_tags

## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
### Association
- has_many :videos_tags
- has_many :videos, through: :videos_tags

## videos_tagsテーブル
|Column|Type|Options|
|------|----|-------|
|video_id|integer|null: false, foreign_key: true|
|tag_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :video
- belongs_to :tag

## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|video_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :video