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
      redirect_to group_messages_url(message.group_id), notice: 'メッセージが送信されました。'
    else
      flash.now[:alert] = 'グループは作成されませんでした'
      render :index
    end
  end

  private

  def create_params
    params.require(:message).permit(:text).merge(group_id: params[:group_id])
  end
end

