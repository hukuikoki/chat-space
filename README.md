# データベース設計
## messages
|colum   |type      |
|:------ |:---------|
|text    |text      |
|image   |string    |
|user_id |references|
|group_id|references|
### アソシエーション
belongs_to :user
belongs_to :group

## users
|colum   |type   |
|:------ |:------|
|name    |string |
### アソシエーション
has_many :messages
has_many :belonged_groups, through: :messages source: :group

## groups
|colum   |type    |
|:------ |:-------|
|name    |string  |
###アソシエーション
belongs_to :user
has_many :messages

## user_groups
|colum   |type      |
|:------ |:---------|
|user_id |references|
|group_id|references|
###アソシエーション
belongs_to :user
belongs_to :group
