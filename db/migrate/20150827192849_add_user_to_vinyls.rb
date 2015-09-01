class AddUserToVinyls < ActiveRecord::Migration
  def change
    add_column :vinyls, :user_id, :integer
    add_index :vinyls, :user_id
  end
end
