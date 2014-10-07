ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'sidekiq/testing'
Sidekiq::Testing.inline!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def create_user referral_code=nil
    @@index ||= 0
    @@index = @@index + 1

    user = User.new(:email => "email#{@@index}@looping.local", :password => "password")
    user.assign_referrer(referral_code) if referral_code
    user.save
    user
  end
end
