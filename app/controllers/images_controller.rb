class ImagesController < ApplicationController
  before_action :set_image, only: [:show]
  
  def index
    @images = Image.all
  end

  def show
    @image.views += 1
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
