class UsersController < ApplicationController
  def home
    @user = User.find(params[:user_id])
    @blog = Blog.where(user_id: params[:user_id])
    @album = Album.where(user_id: params[:user_id])
  end

  def albums
  end

  def blog
  end
end
