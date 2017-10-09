class UserMailer < ApplicationMailer
  def login(user)
    @user = user
    mail to: user.email, subject: "Login successfully"
  end

  def comment(comment, user)
    @user = user
    @comment = comment
    mail to: user.email, subject: "New comment on blog"
  end
end
