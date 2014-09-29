class BetaSignupController < ApplicationController
  def create
    @user = User.new user_params.merge(waiting: true)
    @user.generate_password!

    if @user.save
      redirect_to root_path(ref: @user.referral_code)
    else
      raise @user.errors.inspect
    end
  end

  def user_params
    params.require(:user).permit(:email, :referrer_code)
  end
end
