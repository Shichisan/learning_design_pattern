class AddGroupIdToDetail < ActiveRecord::Migration[6.0]
  def change
    add_reference :details, :group, index: true, null: true
  end
end
