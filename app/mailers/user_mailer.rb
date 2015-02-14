class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def assignment_comment_email(user, input)
    @user = user
    @comment = input
    @url = 'localhost:3000'
    mail(to: @user.email, subject: 'welcome to the site')
  end

  def submission_comment_email(user, input)
    @user = user
    @comment = input
    @url = 'localhost:3000'
    mail(to: @user.email, subject: 'welcome to the site')
  end



  # def welcome_email(user)
  #   @user = user
  #   @url  = 'http://example.com/login'
  #   mail(to: user.email, subject: 'Welcome to My Awesome Site')
  # end


end


#see 2.3.3, 2.3.4, 2.6, 