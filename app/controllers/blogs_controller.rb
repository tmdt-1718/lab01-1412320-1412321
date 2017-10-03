class BlogsController < ApplicationController
  require 'date'

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
        redirect_to user_blogs_path(current_user.id), notice: 'Create new blog successfully'
      else
        redirect_to user_blogs_path(current_user.id), alert: @blog.errors
      end
    end

    def new
      @blog = Blog.new
    end

    def edit
      @blog = Blog.find(params[:id])
    end

    def update
      @blog = Blog.find(params[:id])
      url = params[:blog][:url]
      title = params[:blog][:title]
      content = params[:blog][:content]
      if url
        if @blog.update(url: url, title: title, content: content)
          redirect_to user_blogs_path(current_user.id), notice: 'Blog updated'
        else
          redirect_to user_blogs_path(current_user.id), alert: @blog.errors
        end
      else
        if @blog.update(title: title, content: content)
          redirect_to user_blogs_path(current_user.id), notice: 'Blog updated'
        else
          redirect_to user_blogs_path(current_user.id), alert: @blog.errors
        end
      end
    end

    def destroy
      @blog = Blog.find(params[:id])
      if @blog.destroy
        redirect_to user_blogs_path(current_user.id), notice: 'Blog deleted'
      else
        redirect_to user_blogs_path(current_user.id), alert: @blog.errors
      end
    end
end
