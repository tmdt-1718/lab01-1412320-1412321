class BlogsController < ApplicationController
  require 'date'
    # before_action :logged_in_user, only: [:index, :show]
    # before_action :correct_user,   only: [:show]

    def index
        @user = User.find(params[:user_id])
        @blogs = Blog.all
        #@microposts = @user.microposts.paginate(page: params[:page])
    end

    def show

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
