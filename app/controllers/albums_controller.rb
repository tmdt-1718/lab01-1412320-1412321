class AlbumsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @albums = Album.where(user_id: params[:user_id])
  end

  def show
    @album = Album.find(params[:id])
    @images = @album.images
  end
end
