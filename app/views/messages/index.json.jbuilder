json.messages @messages.each do |message|
  json.name     message.user.name
  json.created_at     message.created_at.strftime("%Y年%m月%d日 %H時%M分")
  json.text     message.text
  json.image    message.image.to_s
  json.id       message.id
end
