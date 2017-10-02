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

  def new
    @album = Album.new
    @image = Image.new
  end

  def create

    @album = Album.new(name: params[:album][:name], user_id: current_user.id, total_views: 0)
    if @album.save
      @image = Image.new(user_id: current_user.id, album_id: @album.id, url: params[:album][:image][:url])
      if @image.save
        @album.cover_url = @image.url.thumb.url
        @album.save
        redirect_to user_albums_url(current_user), notice: "Album created successfully"
      else
        redirect_to new_album_path, alert: @image.errors
      end
    else
      redirect_to new_album_path, alert: @album.errors
    end
  end

  def cover
    @album = Album.find(params[:id])
    @image = Image.find(params[:image_id])
    if current_user == @image.user && @image.album == @album
      @album.cover_url = @image.url.thumb.url
      if @album.save
        redirect_to user_albums_url(@album.user_id)
      else
        render json: @user.errors
      end
    end
  end
end
