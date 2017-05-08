class Message < ApplicationRecord
  validates :text, presence: true, length: { maximum: 255 }

  belongs_to :user
  belongs_to :group
end
