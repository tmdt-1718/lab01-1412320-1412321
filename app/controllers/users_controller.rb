class UsersController < ApplicationController
  def home
    if params[:user_id]
      @user = User.find(params[:user_id])
    else
      @user = User.find(current_user.id)
    end
    @blog = Blog.where(user_id: @user.id)
    @album = Album.where(user_id: @user.id)
  end

  def albums
  end

  def blog
  end
end
