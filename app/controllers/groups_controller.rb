class GroupsController < ApplicationController

  before_action :get_id, only: [:edit, :update]

  def index
  end

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    @group = Group.new(group_params)
    @group.save
  end

  def update
    @group.update(group_params)
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids:[])
  end

  def get_id
     @group = Group.find(params[:id])
  end

end
