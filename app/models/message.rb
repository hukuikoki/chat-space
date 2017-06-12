class Message < ApplicationRecord
  validates :text, presence: true, length: { maximum: 255 }
  validates :user_id, presence: true
  validates :group_id, presence: true

  mount_uploader :image, ImageUploader

  belongs_to :user
  belongs_to :group
end
