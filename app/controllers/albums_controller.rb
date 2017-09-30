class AlbumsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @albums = Album.find_by(user_id: params[:user_id])
  end

  def show
    
  end
end
