# データベース設計
## messages
|colum   |type      |
|:------ |:---------|
|text    |text      |
|image   |string    |
|user_id |references|
|group_id|references|

## users
|colum   |type   |
|:------ |:------|
|name    |string |

## groups
|colum   |type    |
|:------ |:-------|
|name    |string  |

## user_groupstable

|colum   |type      |
|:------ |:---------|
|user_id |references|
|group_id|references|

