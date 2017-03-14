#データベース設計
## messagestable
イメージ

|    body    |     image   |    user_id   |   group_id |
|:-----------|:------------|:------------ |:--------   |
|            |             |              |            |
|          　|        　　　|         　　　|　　　　　    |
|       　　　|         　　|          　　 |            |
|         　　|           　|           　　|　          |
|       　　　|        　　　|      　　　　　|         　 |
|    　　　　　|      　　　　|      　　　　　|            |




## userstable
 新たに追加カラム
 
| group_id | nickname      |              
|:-----------|------------:|
|        　　 |             |              
|            |             |              
|            |             |              
|            |             |              
|            |             |              




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


##messages_userstable

| messages_id | users_id |
|:------------|:---------|
|             |          |

