class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @groups = current_user.groups.includes(:messages)
    @users = @group.users.includes(:messages)
    @message = Message.new
    @messages = @group.messages.includes(:user)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @message = current_user.messages.new(create_params)
      if @message.save
        respond_to do |format|
          format.html { group_messages_url(@message.group_id) }
          format.json { render 'create', handlers: 'jbuilder' }
        end
      else
        redirect_to  group_messages_url(@message.group_id), alert: 'メッセージが送信されませんでした。'
      end
  end

  private

  def create_params
    params.require(:message).permit(:text, :image).merge(group_id: params[:group_id])
  end

end

