require 'test_helper'

class BetaSignupsControllerTest < ActionController::TestCase
  def setup
    @user = users(:one)
  end

  test "should show thanks page" do
    get :thanks, ref: @user.referral_code
    assert_response :success
  end

  test "should create a user" do
    assert_difference "User.count", 1 do
      post :create, user:{ email: 'test@looping.com' }
    end
  end

  test "should not create a user twice" do
    assert_difference "User.count", 0 do
      post :create, user:{ email: @user.email }
    end
  end

  test "should redirect to thanks page" do
    post :create, user:{ email: 'test@looping.com' }
    assert_redirected_to beta_signup_thanks_path(ref: assigns(:user).referral_code)
  end

  test "should redirect existing user to thanks page" do
    post :create, user:{ email: @user.email}
    assert_redirected_to beta_signup_thanks_path(ref: assigns(:user).referral_code)
  end
end
