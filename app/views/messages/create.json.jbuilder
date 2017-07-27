json.created_at @message.created_at.strftime("%Y年%m月%d日 %H:%M:%S")
json.text       @message.text
json.name       @message.user.name
json.image      @message.image.url
json.id       @message.id
