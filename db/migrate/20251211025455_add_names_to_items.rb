class AddNamesToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :name, :string
    add_column :items, :price, :text
    add_column :items, :explanation, :string
    add_column :items, :name, :string
    add_column :items, :name, :string
    add_column :items, :name, :string
    add_column :items, :name, :string
    add_column :items, :name, :string
    |               |     | null: false |
|         |        | null: false |
| category_id        | integer    | null: false |
| status_id          | integer    | null: false |
| shipping_cost_id   | integer    | null: false |
| prefecture_id      | integer    | null: false |
| shipping_date_id   | integer    | null: false |
| user               | references | null: false, foreign_key: true |
  end
end
