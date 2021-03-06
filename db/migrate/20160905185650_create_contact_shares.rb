class CreateContactShares < ActiveRecord::Migration
  def change
    create_table :contact_shares do |t|
      t.integer :contact_id, null: false
      t.integer :user_id, null: false
    end

    add_index(:contact_shares, :contact_id, unique: true)
    add_index(:contact_shares, :user_id, unique: true)
    remove_index(:contacts, :user_id)
    add_index(:contacts, :user_id, unique: true)
  end
end
