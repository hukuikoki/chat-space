# データベース設計
## messagestable

| colum  | type  |
|:------ |:------|
| body   | text  |
|image   |string |
|user_id |integer|
|group_id|integer|



## userstable


| colum  | type  |
|:------ |:------|
| name   | string|


         




## groupstable

| colum  | type  |
|:------ |:------|
| key    | string|
|dedtail |text   |

    


## user_groupstable

| colum  | type  |
|:------ |:------|
| user_id|integer|
|group_id|integer|

