require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  setup do
    @user = users(:one)
  end

  test "First referred user that joins" do
    referred_user = create_user @user.referral_code

    email = UserMailer.referral_notification_email(@user, referred_user).deliver
    assert_not ActionMailer::Base.deliveries.empty?

    assert_equal "One of your friends joined thanks to you!",  email.subject
    assert email.body.include?("One of your friends, #{referred_user.email}")
  end

  test "Second referred user that joins" do
    referred_users = 2.times.collect { create_user @user.referral_code }

    email = UserMailer.referral_notification_email(@user, referred_users.last).deliver
    assert_not ActionMailer::Base.deliveries.empty?, "queue isn't empty"

    assert_equal "One of your friends joined thanks to you!",  email.subject
    assert email.body.include?("One of your friends, #{referred_users.last.email}")
  end

  test "Fifth referred user that joins" do
    referred_users = 5.times.collect { create_user @user.referral_code }

    email = UserMailer.referral_notification_email(@user, referred_users.last).deliver
    assert_not ActionMailer::Base.deliveries.empty?, "queue isn't empty"

    assert email.subject.include?("You now have 5 referred users")
    assert email.body.to_s.include?("Step 5")
  end
end
