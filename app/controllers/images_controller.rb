class ImagesController < ApplicationController
  before_action :set_image, only: [:show]
  
  def index
    @images = Image.all
  end

  def create
    @image = Image.new(user_id: params[:user_id], album_id: params[:album_id], url: params[:image][:url])
    if @image.save
      redirect_to user_album_path(params[:user_id], params[:album_id])
    else
      redirect_to user_album_path(params[:user_id], params[:album_id]), alert: @image.errors
    end
  end

  def show
    @image.views += 1
    @image.album.total_views += 1
    @image.album.save
    @image.save
    render json: {image: @image, user: @image.user }, status: 200
  end

  private
    def set_image
      begin
        @image = Image.find(params[:id])
      rescue => exception
        redirect_to '/404' and return
      end
    end
end
