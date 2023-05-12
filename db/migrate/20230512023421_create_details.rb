class CreateDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :details do |t|
      t.string "name"
      t.integer "amount"
      t.integer "category_id", null: false

      t.timestamps
    end
  end
end
