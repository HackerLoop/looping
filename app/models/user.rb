class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :referrer,  class_name: 'User', foreign_key: 'referrer_id'
  has_many   :referrals, class_name: 'User', foreign_key: 'referrer_id'

  validates :referral_code, uniqueness: true
  before_create :create_referral_code

  def generate_password!
    self.password = Devise.friendly_token.first(9)
  end

  def assign_referrer referrer_code
    referrer = User.find_by_referral_code referrer_code

    if referrer
      self.referrer_id = referrer.id
    end
  end

  def send_welcome_email
    UserMailer.delay.welcome_email(self)
  end

  private
  def create_referral_code
    referral_code = Devise.friendly_token.first(8)
    @collision = User.find_by_referral_code(referral_code)

    while !@collision.nil?
      referral_code = Devise.friendly_token.first(8)
      @collision = User.find_by_referral_code(referral_code)
    end

    self.referral_code = referral_code
  end

  def active_for_authentication?
    super && !waiting
  end
end
