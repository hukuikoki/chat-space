# データベース設計
## messagestable
イメージ

|    body    |     image   |    user_id   |   group_id |
|:-----------|:------------|:------------ |:--------   |

### 型
body text image string user_id integer group_id integer


## userstable
 新たに追加カラム
 
| group_id | nickname      |              
|:-----------|------------:|



### 型
group_id integer nickname string            




## groupstable
### カラム

| group_name |
|:-----------|
|            |
|            |      
|            |      
|            |         
|            |      
|            |

### 型
group_name string


## messages_userstable

| messages_id | users_id |
|:------------|:---------|
|             |          |

### 型
messages_id integer
users_id integer

