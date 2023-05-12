class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.bigint "author_id", null: false
      t.string "name"
      t.string "icon_url"
      t.index ["author_id"], name: "index_categories_on_author_id"

      t.timestamps
    end
  end
end
