class AlbumsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:cover]

  def index
    @user = User.find(params[:user_id])
    @albums = Album.where(user_id: params[:user_id])
  end

  def show
    @new_image = Image.new
    @album = Album.find(params[:id])
    @images = @album.images
  end

  def cover
    @album = Album.find(params[:id])
    @image = Image.find(params[:image_id])
    @album.cover_url = @image.url.thumb.url
    if @album.save
      redirect_to user_albums_url(@album.user_id)
    else
    end
  end
end
