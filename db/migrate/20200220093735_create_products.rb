class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.decimal :price
      t.integer :stock
      t.integer :seller
      t.integer :vertical_category
      t.decimal :discount

      t.timestamps
    end
  end
end
