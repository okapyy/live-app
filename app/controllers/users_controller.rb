class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @name = user.name
    @videos= user.videos.page(params[:page]).order("created_at DESC").per(6)
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
