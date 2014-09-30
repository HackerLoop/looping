class UserMailer < ActionMailer::Base
  default from: 'noreply@looping.local'

  def welcome_email user
    @user = user
    @url  = root_url(ref: @user.referral_code)

    mail(to: @user.email, subject: 'Thanks for joining Looping!')
  end

  def referral_notification_email user
    @user = user
    @url  = root_url(ref: @user.referral_code)

    @case, @count = @user.referral_step

    if @case == :standard
       mail(to: @user.email, subject: 'One of your friends joined thanks to you!')
    else
       mail(to: @user.email, subject: "You now have #{@count} referred users!", template_name: "step_#{@count}")
    end
  end
end
