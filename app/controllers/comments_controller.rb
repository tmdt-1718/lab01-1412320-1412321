class CommentsController < ApplicationController
  def create
    blog = Blog.find(params[:blog_id])
    @comment = Comment.new(content: params[:comment][:content], blog: blog, user: current_user)
    if @comment.save
      UserMailer.comment(@comment, blog.user).deliver_later
      redirect_to user_blog_url(@comment.blog.user, @comment.blog)
    else
      redirect_to user_blog_url(blog.user, blog)      
    end
  end
end

