class BlogsController < ApplicationController
  require 'date'
    # before_action :logged_in_user, only: [:index, :show]
    # before_action :correct_user,   only: [:show]

    def index
        @blogs = Blog.where(user_id: params[:user_id])
        #@microposts = @user.microposts.paginate(page: params[:page])
    end

    def show
      @blog = Blog.find(params[:id])
      if @blog.user == User.find(params[:user_id])
        @blog.view_count += 1
        @blog.save
      else
        redirect_to '/404'
      end
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
