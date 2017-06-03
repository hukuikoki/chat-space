class UsersController < ApplicationController

  def search
    @users = User.where.not(name: current_user.name)
    @users = @users.where('name LIKE(?)',"%#{search_params[:keyword]}%").order('name ASC')

    respond_to do |format|
      format.json { render json: @users }
    end
  end

  private

  def search_params
    params.permit(:keyword)
  end

end
