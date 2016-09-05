class AddTimeStampToContactShares < ActiveRecord::Migration
  def change
    add_column(:contact_shares, :timestamps, :datetime)
  end
end
