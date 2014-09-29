class BetaSignupController < ApplicationController
  def create
    @user = User.new user_params.merge(waiting: true)
    @user.assign_referrer(params[:ref])
    @user.generate_password!

    if @user.save
      redirect_to root_path(ref: @user.referral_code)
    else
      redirect_to :back, alert: "Email #{@user.errors[:email]}"
    end
  end

  def user_params
    params.require(:user).permit(:email)
  end
end
