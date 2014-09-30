require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  setup do
    @user = users(:one)
  end

  test "First referred user that joins" do
    create_user @user.referral_code

    email = UserMailer.referral_notification_email(@user).deliver
    assert_not ActionMailer::Base.deliveries.empty?

    assert email.subject.include?("One of your friends joined")
    assert email.body.include?("One of your friends joined")
  end

  test "Second referred user that joins" do
    2.times { create_user @user.referral_code }

    email = UserMailer.referral_notification_email(@user).deliver
    assert_not ActionMailer::Base.deliveries.empty?

    assert email.subject.include?("One of your friends joined")
    assert email.body.include?("One of your friends joined")
  end

  test "Fifth referred user that joins" do
    5.times { create_user @user.referral_code }

    email = UserMailer.referral_notification_email(@user).deliver
    assert_not ActionMailer::Base.deliveries.empty?

    assert email.subject.include?("You now have 5 referred users")
    assert email.body.to_s.include?("Step 5")
  end
end
