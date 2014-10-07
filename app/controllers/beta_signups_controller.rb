class BetaSignupsController < ApplicationController
  before_action :redirect_if_user_exists, only: 'create'

  def create
    @user = User.new user_params.merge(waiting: true)
    @user.assign_referrer(params[:ref])
    @user.generate_password!

    if @user.save
      @user.send_welcome_email

      if @user.referrer.present?
        @user.send_notification_to_referrer
      end

      redirect_to beta_signup_thanks_path(ref: @user.referral_code)
    else
      redirect_to :back, alert: "Email #{@user.errors[:email].first}"
    end
  end

  def thanks
    @user = User.find_by_referral_code(params[:ref])
  end

  def user_params
    params.require(:user).permit(:email)
  end

  def redirect_if_user_exists
    @user = User.find_by_email(user_params[:email])

    if @user
      redirect_to beta_signup_thanks_path(ref: @user.referral_code)
    end
  end
end
