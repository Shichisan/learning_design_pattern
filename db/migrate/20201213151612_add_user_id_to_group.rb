class AddUserIdToGroup < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :user_id, :integer, index: true
  end
end
