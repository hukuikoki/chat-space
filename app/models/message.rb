class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  def time
    time = Time.now
    time.strftime("%Y年%m月%d日 %H:%M:%S")
  end
end
