require 'rails_helper'

describe Message do
  describe '#create' do
    it "is valid with a text, image, user_id, group_id" do
      message = build(:message)
      expect(message).to be_valid
    end

    it "is invalid without a text" do
      message = build(:message, text: "")
      message.valid?
      expect(message.errors[:text]).to include("を入力してください")
    end

    it "is valid with a same number user_id and user.id" do
      user = build(:user)
      message = build(:message, user_id: user.id)
      expect(message.user_id).to eq user.id
    end

    it "is valid with a same number group_id and group.id" do
      group = build(:group)
      message = build(:message, group_id: group.id)
      expect(message.group_id).to eq group.id
    end

    it "is invalid with a text that has more than 255 characters " do
      message = build(:message, text: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      message.valid?
      expect(message.errors[:text][0]).to include("は255文字以内で入力してください")
    end
  end
end
