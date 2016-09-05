class ChangeTimeStampToContactShares < ActiveRecord::Migration
  def change
    remove_column :contact_shares, :timestamps, :datetime
    add_column :contact_shares, :created_at, :datetime
    add_column :contact_shares, :updated_at, :datetime
  end
end
