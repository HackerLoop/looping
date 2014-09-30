class UserMailer < ActionMailer::Base
  def welcome_email user
    @user = user
    @url  = root_url(ref: @user.referral_code)

    mail(to: @user.email, subject: 'Thanks for joining Looping!')
  end
end
