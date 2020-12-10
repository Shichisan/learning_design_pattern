class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :gender
      t.string :prefecture
      t.string :occupation
      t.integer :min_annual_income
      t.integer :max_annual_income

      t.timestamps
    end
  end
end
