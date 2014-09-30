require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test "referral_step returns [:standard, 0] if user has no referrals" do
    assert_equal [:standard, 0], @user.referral_step
  end

  test "referral_step returns [:step, 1] if user has 1 referrals" do
    create_user @user.referral_code
    assert_equal [:standard, 1], @user.referral_step
  end

  test "referral_step returns [:standard, 3] if user has 3 referrals" do
    3.times { create_user @user.referral_code }
    assert_equal [:standard, 3], @user.referral_step
  end

  test "referral_step returns [:step, 5] if user has 5 referrals" do
    5.times { create_user @user.referral_code }
    assert_equal [:step, 5], @user.referral_step
  end
end
