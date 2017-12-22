class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :name
      t.string :description
      t.decimal :actual_price
      t.decimal :offered_price
      t.integer :quantity
      t.string :type
      t.date :manufacture_date
      t.references :sub_category, foreign_key: true

      t.timestamps
    end
  end
end
