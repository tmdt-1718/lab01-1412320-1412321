class BlogsController < ApplicationController
  require 'date'
    # before_action :logged_in_user, only: [:index, :show]
    # before_action :correct_user,   only: [:show]

    def index
      @user = User.find(params[:user_id])
      @blogs = Blog.where(user_id: params[:user_id])
    end

    def show
      @blog = Blog.find(params[:id])
      if @blog.user == User.find(params[:user_id])
        @blog.views += 1
        @blog.save
      else
        redirect_to '/404'
      end
    end

    def create
      @blog = Blog.new(user_id: current_user.id, title: params[:blog][:title], content: params[:blog][:content], url: params[:blog][:url])
      if @blog.save
        redirect_to user_blogs_path(current_user.id)
      else
        redirect_to user_blogs_path(current_user.id), alert: @blog.errors
      end
    end

    def new
      @blog = Blog.new
    end

    # private
    #   def logged_in_user
    #     unless logged_in_user?
    #       flash[:danger] = "Please log in."
    #       redirect_to login_url
    #     end
    #   end

    #   def correct_user
    #     @user = User.find(params[:id])
    #     redirect_to(root_url) unless current_user?(@user)
    #   end
end
