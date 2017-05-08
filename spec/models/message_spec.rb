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

    it "is valid with a text" do
      message = build(:message, text: "asdf")
      expect(message).to be_valid
    end
  end
end
