class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
    @users = @group.users
    @message = Message.new
    @messages = @group.messages
  end

  def create
    message = current_user.messages.new(create_params)
    if message.save
      redirect_to group_messages_path(message.group_id)
    end
  end

  private

  def create_params
    params.require(:message).permit(:text).merge(group_id: params[:group_id])
  end
end

