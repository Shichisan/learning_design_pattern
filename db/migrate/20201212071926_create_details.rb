class CreateDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :details do |t|
      t.integer :amount
      t.references :category
      t.references :user
      t.string :detail_type

      t.timestamps
    end
  end
end
