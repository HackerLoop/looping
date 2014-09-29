class AddReferralsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :referral_code, :string,  index: true
    add_column :users, :referrer_id,   :integer, index: true
    add_column :users, :waiting,       :boolean, default: false
  end
end
