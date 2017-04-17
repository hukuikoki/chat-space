class GroupsController < ApplicationController

  def index
  end

  def new
    @group = Group.new
  end

  def edit
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.new(group_params)
    @group.save
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids:[])
  end

end
