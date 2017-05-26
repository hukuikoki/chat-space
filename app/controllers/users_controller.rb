class UsersController < ApplicationController

  def search
    @users = User.where('title LIKE(?)',"%#{search_params[:keyword]}%").order('title ASC').limit(20)

    respond_to do |format|
      format.json { render json: @users }
    end
  end

end
