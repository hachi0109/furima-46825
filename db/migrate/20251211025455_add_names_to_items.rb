class AddNamesToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :name, :string, null: false
    add_column :items, :price, :integer, null: false
    add_column :items, :explanation, :text, null: false
    add_column :items, :category_id, :integer, null: false
    add_column :items, :status_id, :integer, null: false
    add_column :items, :prefecture_id, :integer, null: false
    add_column :items, :shipping_date_id, :integer, null: false
    add_column :items, :shipping_cost_id, :integer, null: false
    add_reference :items, :user, null: false, foreign_key: true
  end
end
