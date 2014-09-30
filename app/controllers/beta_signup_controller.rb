class BetaSignupController < ApplicationController
  def create
    @user = User.new user_params.merge(waiting: true)
    @user.assign_referrer(params[:ref])
    @user.generate_password!

    if @user.save
      @user.send_welcome_email
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
end
