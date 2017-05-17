require 'rails_helper'

describe MessagesController do
  let(:user){ create(:user) }
  let(:group){ create(:group) }
  let(:message){ build(:message) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    before do
      get :index, params: { group_id: group.id }
    end

    it "assigns the requested group to @group" do
      expect(assigns(:group)).to eq group
    end

    it "assigns the requested groups to @groups" do
      groups = user.groups
      expect(assigns(:groups)).to match_array groups
    end

    it "assigns the requested users to @users" do
      users = group.users
      expect(assigns(:users)).to match_array users
    end

    it "assigns the requested messages to @messages" do
      messages = group.messages
      expect(assigns(:messages)).to match_array messages
    end

    it "renders the :index template" do
      expect(response).to render_template :index
    end
  end

  describe 'Post#create' do
     context "save valid attributes" do
       let(:params) { post :create, params: { group_id: group.id, message: attributes_for(:message) } }
       it "saves message" do
         expect{ params}.to change(Message, :count).by(1)
       end
       it "redirects to message#index" do
        params
        expect(response).to redirect_to group_messages_path
       end
     end

     context "does not save invalid attributes" do
      let(:params) { post :create, params: { group_id: group.id, message: attributes_for(:message, text: "") } }
      it "does not save message" do
        expect{ params}.not_to change(Message, :count)
      end
      it "redirects to message#index" do
        params
        expect(response).to redirect_to group_messages_path
      end
     end
  end
end
