class GroupsController < ApplicationController

  before_action :find_group, only: [:edit, :update]

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    group = Group.new(group_params)
    if group.save
      redirect_to group_messages_path(group), notice: '新しいグループが作成されました'
    else
      redirect_to new_group_path, alert: 'グループ作成に失敗しました。'
    end
  end

  def update
    @group.update(group_params)
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids:[])
  end

  def find_group
     @group = Group.find(params[:id])
  end

end
