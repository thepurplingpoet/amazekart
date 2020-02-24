class AddVerticalIdToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :vertical_id, :integer
  end
end
